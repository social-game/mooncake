(window.webpackJsonp=window.webpackJsonp||[]).push([[6],{215:function(e,t,a){"use strict";a.r(t);var n=a(0),r=Object(n.a)({},(function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("ContentSlotsDistributor",{attrs:{"slot-key":e.$parent.slotKey}},[a("h1",{attrs:{id:"development"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#development"}},[e._v("#")]),e._v(" Development")]),e._v(" "),a("h2",{attrs:{id:"requirements"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#requirements"}},[e._v("#")]),e._v(" Requirements")]),e._v(" "),a("p",[e._v("In order for you to locally run Mooncake, you will need to satisfy the following requirements:")]),e._v(" "),a("ol",[a("li",[a("p",[e._v("Having "),a("a",{attrs:{href:"https://flutter.dev",target:"_blank",rel:"noopener noreferrer"}},[e._v("Flutter"),a("OutboundLink")],1),e._v(" installed.\nFor the installation guide please reference the "),a("a",{attrs:{href:"https://flutter.dev/docs/get-started/install",target:"_blank",rel:"noopener noreferrer"}},[e._v("official website"),a("OutboundLink")],1),e._v(".\nThe Flutter version used during the development is "),a("code",[e._v("1.20.0")]),e._v(". You can get it by running:")]),e._v(" "),a("div",{staticClass:"language-shell line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-shell"}},[a("code",[e._v("$ flutter version "),a("span",{pre:!0,attrs:{class:"token number"}},[e._v("1.20")]),e._v(".0\n$ flutter upgrade\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br"),a("span",{staticClass:"line-number"},[e._v("2")]),a("br")])])]),e._v(" "),a("li",[a("p",[e._v("An Android/iOS emulator or physical device.")])])]),e._v(" "),a("h2",{attrs:{id:"architecture"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#architecture"}},[e._v("#")]),e._v(" Architecture")]),e._v(" "),a("p",[e._v("The whole code architecture follows the "),a("a",{attrs:{href:"https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html",target:"_blank",rel:"noopener noreferrer"}},[e._v("Clean Architecture pattern"),a("OutboundLink")],1),e._v(" mixed with the "),a("a",{attrs:{href:"https://bloclibrary.dev/#/whybloc",target:"_blank",rel:"noopener noreferrer"}},[e._v("BLoC pattern for the UI part"),a("OutboundLink")],1),e._v(".")]),e._v(" "),a("p",[e._v("The directories are separated using the Clean Architecture layers. From the inner to the outer one:")]),e._v(" "),a("ul",[a("li",[a("code",[e._v("entities")]),e._v(" contains the data structure definition;")]),e._v(" "),a("li",[a("code",[e._v("usecases")]),e._v(" contains the different use cases definition;")]),e._v(" "),a("li",[a("code",[e._v("repositories")]),e._v(" act as interface adapters;")]),e._v(" "),a("li",[a("code",[e._v("sources")]),e._v(" and "),a("code",[e._v("ui")]),e._v(" contain respectively the database/network interfaces and all the views definition.")])]),e._v(" "),a("p",[e._v("To make the code more simple to maintain, we used the "),a("a",{attrs:{href:"https://en.wikipedia.org/wiki/Dependency_injection",target:"_blank",rel:"noopener noreferrer"}},[e._v("dependency injection technique"),a("OutboundLink")],1),e._v(". The whole injection is handled using the "),a("a",{attrs:{href:"https://pub.dev/packages/dependencies",target:"_blank",rel:"noopener noreferrer"}},[a("code",[e._v("dependencies")]),e._v(" Pub package"),a("OutboundLink")],1),e._v(" and you can find the injector definition inside the "),a("code",[e._v("dependency_injection")]),e._v(" folder.")]),e._v(" "),a("h2",{attrs:{id:"code-generation"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#code-generation"}},[e._v("#")]),e._v(" Code generation")]),e._v(" "),a("p",[e._v("To properly handle JSON marshaling and unmarshaling, we used the "),a("a",{attrs:{href:"https://pub.dev/packages/json_serializable",target:"_blank",rel:"noopener noreferrer"}},[a("code",[e._v("json_serializable")]),a("OutboundLink")],1),e._v(" and "),a("a",{attrs:{href:"https://pub.dev/packages/json_annotation",target:"_blank",rel:"noopener noreferrer"}},[a("code",[e._v("json_annotation")]),a("OutboundLink")],1),e._v(" packages.")]),e._v(" "),a("p",[e._v("If you change the definition of classes marked with "),a("code",[e._v("@JsonSerializable()")]),e._v(" remember to run the following command to toggle the code generation and update the generated "),a("code",[e._v("fromJson")]),e._v("/"),a("code",[e._v("toJson")]),e._v(" methods as well:")]),e._v(" "),a("div",{staticClass:"language-shell line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-shell"}},[a("code",[e._v("flutter pub run build_runner build\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br")])]),a("h2",{attrs:{id:"parameters"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#parameters"}},[e._v("#")]),e._v(" Parameters")]),e._v(" "),a("h3",{attrs:{id:"syncing"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#syncing"}},[e._v("#")]),e._v(" Syncing")]),e._v(" "),a("p",[e._v("If you want to try a faster sync time, you can change it from withing the "),a("code",[e._v("main.dart")]),e._v(" file, setting the desired "),a("code",[e._v("syncPeriod")]),e._v(" when creating the "),a("code",[e._v("PostsBloc")]),e._v(" instance.")]),e._v(" "),a("h2",{attrs:{id:"analytics"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#analytics"}},[e._v("#")]),e._v(" Analytics")]),e._v(" "),a("p",[e._v("In order to constantly improve the application workings, we use "),a("a",{attrs:{href:"https://firebase.google.com/docs/analytics",target:"_blank",rel:"noopener noreferrer"}},[e._v("Firebase Analytics"),a("OutboundLink")],1),e._v(" to track "),a("strong",[e._v("completely anonymous")]),e._v(" usage of the application by the users. This include tracking when they log in, add/remove a reaction, create a post etc.")]),e._v(" "),a("p",[e._v("In order to do so, we use the "),a("a",{attrs:{href:"https://firebase.google.com/docs/flutter/setup",target:"_blank",rel:"noopener noreferrer"}},[e._v("Flutter Firebase Plugins"),a("OutboundLink")],1),e._v(".")]),e._v(" "),a("h2",{attrs:{id:"formatting"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#formatting"}},[e._v("#")]),e._v(" Formatting")]),e._v(" "),a("p",[e._v("When writing code we follow the "),a("a",{attrs:{href:"https://flutter.dev/docs/development/tools/formatting",target:"_blank",rel:"noopener noreferrer"}},[e._v("Flutter formatting guideline"),a("OutboundLink")],1),e._v(". To ensure your files also follow the same formatting, please run the given commands once you edited or added new files:")]),e._v(" "),a("div",{staticClass:"language-shell line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-shell"}},[a("code",[e._v("flutter "),a("span",{pre:!0,attrs:{class:"token function"}},[e._v("format")]),e._v(" "),a("span",{pre:!0,attrs:{class:"token builtin class-name"}},[e._v(".")]),e._v("\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br")])]),a("h2",{attrs:{id:"testing"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#testing"}},[e._v("#")]),e._v(" Testing")]),e._v(" "),a("p",[e._v("If you want to write tests, please refer the "),a("a",{attrs:{href:"https://flutter.dev/docs/testing",target:"_blank",rel:"noopener noreferrer"}},[e._v("Flutter testing guide"),a("OutboundLink")],1),e._v(".")]),e._v(" "),a("p",[e._v("If you have developed a new feature, or you simply want to make sure that all tests pass, execute the following command:")]),e._v(" "),a("div",{staticClass:"language- line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-text"}},[a("code",[e._v("flutter test --coverage test\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br")])]),a("h2",{attrs:{id:"run-the-app"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#run-the-app"}},[e._v("#")]),e._v(" Run the app")]),e._v(" "),a("p",[e._v("To run a local version of this application, you have two options.")]),e._v(" "),a("h3",{attrs:{id:"run-in-debug-mode"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#run-in-debug-mode"}},[e._v("#")]),e._v(" Run in debug mode")]),e._v(" "),a("p",[e._v("To run the app in debug mode, simply open your emulator or connect a physical device and then execute:")]),e._v(" "),a("div",{staticClass:"language-shell line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-shell"}},[a("code",[e._v("flutter run\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br")])]),a("h3",{attrs:{id:"run-in-release-mode"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#run-in-release-mode"}},[e._v("#")]),e._v(" Run in release mode")]),e._v(" "),a("p",[e._v("While in debug mode, the application is never fully compiled. To make sure the changes you have made will run properly, you need to run the application in release mode.")]),e._v(" "),a("div",{staticClass:"custom-block warning"},[a("p",{staticClass:"custom-block-title"},[e._v("WARNING")]),e._v(" "),a("p",[e._v("Please note that the release mode is available only on physical devices.")])]),e._v(" "),a("p",[e._v("To run the app on release mode simply execute:")]),e._v(" "),a("div",{staticClass:"language- line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-text"}},[a("code",[e._v("flutter run --release\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br")])]),a("h4",{attrs:{id:"android-setup"}},[a("a",{staticClass:"header-anchor",attrs:{href:"#android-setup"}},[e._v("#")]),e._v(" Android setup")]),e._v(" "),a("p",[e._v("To run the app in release mode on an Android device, you will need to follow these steps:")]),e._v(" "),a("ol",[a("li",[a("p",[e._v("Open up the "),a("code",[e._v("android/local.properties")]),e._v(" file that you should have.")])]),e._v(" "),a("li",[a("p",[e._v("Inside the file, put the following lines:")]),e._v(" "),a("div",{staticClass:"language- line-numbers-mode"},[a("pre",{pre:!0,attrs:{class:"language-text"}},[a("code",[e._v("signing.storeFile=\nsigning.storePassword=\nsigning.keyPassword=\nsigning.keyAlias=\n")])]),e._v(" "),a("div",{staticClass:"line-numbers-wrapper"},[a("span",{staticClass:"line-number"},[e._v("1")]),a("br"),a("span",{staticClass:"line-number"},[e._v("2")]),a("br"),a("span",{staticClass:"line-number"},[e._v("3")]),a("br"),a("span",{staticClass:"line-number"},[e._v("4")]),a("br")])])]),e._v(" "),a("li",[a("p",[e._v("Generate a new Keystore and associated key to sign Mooncake.\nYou can read how to do it here: "),a("a",{attrs:{href:"https://developer.android.com/studio/publish/app-signing#generate-key",target:"_blank",rel:"noopener noreferrer"}},[e._v("Generate an upload key in Android Studio"),a("OutboundLink")],1),e._v(".")])]),e._v(" "),a("li",[a("p",[e._v("Fill the "),a("code",[e._v("signing.storeFile")]),e._v(", "),a("code",[e._v("signing.storePassword")]),e._v(", "),a("code",[e._v("signing.keyPassword")]),e._v(" and "),a("code",[e._v("signing.keyAlias")]),e._v(" values with the ones of the Keystore file and key you just have generated.")])])]),e._v(" "),a("p",[e._v("If you are ready to run the app in release mode, here are the steps to follow:")]),e._v(" "),a("ol",[a("li",[e._v("Open")])])])}),[],!1,null,null,null);t.default=r.exports}}]);