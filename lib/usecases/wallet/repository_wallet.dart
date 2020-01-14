import 'package:mooncake/entities/entities.dart';

/// Represents the repository that should be used when dealing with the
/// user wallet.
abstract class WalletRepository {
  /// Saves the given mnemonic inside the secure storage of the device
  /// allowing it to be retrieved later.
  Future<void> saveWallet(String mnemonic);

  /// Returns the address associated to the user wallet.
  Future<String> getAddress();

  /// Returns the [Wallet] instance of the current application user.
  /// If no [Wallet] instance has been saved yet, returns null.
  Future<Wallet> getWallet();

  /// Deletes the currently stored wallet for the user.
  Future<void> deleteWallet();
}
