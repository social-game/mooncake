import 'package:meta/meta.dart';
import 'package:mooncake/repositories/repositories.dart';
import 'package:mooncake/sources/sources.dart';

/// Implementation of [RemoteUserSource]
class RemoteUserSourceImpl implements RemoteUserSource {
  final ChainHelper _chainHelper;

  RemoteUserSourceImpl({
    @required ChainHelper chainHelper,
  })  : assert(chainHelper != null),
        this._chainHelper = chainHelper;

  @override
  Future<AccountData> getAccountData(String address) async {
    try {
      final endpoint = "/auth/accounts/$address";
      final response = await _chainHelper.queryChain(endpoint);
      final accountData =
          AccountDataResponse.fromJson(response.result).accountData;
      return accountData.address == address ? accountData : null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}