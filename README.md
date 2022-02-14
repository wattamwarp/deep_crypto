# Currency App

This applications shows the currency details & their current orders

-Added git Actions.

-Unit ,Widget & Integration tests

-helper contains colors, urls,sizeconfig




## Layout/Overview of this App
 -- images
 ![logo](https://user-images.githubusercontent.com/44410637/153852882-44f3bcfa-cd67-4a37-a680-98688aa85aad.jpeg)
![splash screen](https://user-images.githubusercontent.com/44410637/153852918-a5171368-fc67-4599-bbd6-dda8c0ed6d9e.jpeg)
![home page](https://user-images.githubusercontent.com/44410637/153852944-3ce530ba-feee-4001-b9d5-7a579b870e91.jpeg)
![currency details](https://user-images.githubusercontent.com/44410637/153852958-9ca8e457-ff44-4b0c-a7bb-cd5721dcb804.jpeg)
![loading](https://user-images.githubusercontent.com/44410637/153852973-e03c5e32-4cfb-4158-be27-bf1ec63471a4.jpeg)
![order book](https://user-images.githubusercontent.com/44410637/153853002-f8849146-d6b0-42c6-a206-0af8d00fa0d9.jpeg)

 
 

## Flutter SDK Version
  After creating your project, change your Flutter sdk version to sdk: ">=2.15.1 <3.0.0"  in your pubspec.yaml. Null safety is supported on sdk version 2.12.0 and above.

## Dependencies used:
 - flutter:
    sdk: flutter
 - cupertino_icons: ^1.0.2
 - http: ^0.13.4  //For Network calls
 - intl: ^0.17.0 //For Date Time Conversions
 - flutter_bloc: ^8.0.1 //BLoc for state management
 - equatable: ^2.0.3  //makes it super simple to compare objects with one another and works well with BLoc
 - flutter_launcher_icons: ^0.9.2  //generting launcher cupertino_icons
 - 
 
  ## Business Logic Component
  - BLoC stands for Business Logic Component and is a state management tool that decouples our business logic from our UI.
  - The major reason for having proper state management is so we can easily scale or maintain our app and test our code. When our UI and business logic our intertwined, it is a lot more difficult to add features and the files become extremely cluttered.
  - Example, our user sends in event to BLoC by taking some action in the app. Actions could be things like tapping a button or scrolling to the bottom of a list. An event called Get Data is sent to the BLoC. The BLoC then takes in this event and yield the state called loading. Our UI then knows to show the user a loading indicator. The BLoC sent a request to the API or database to retrieve data. When the response comes back to the BLoC, the BLoC yields a new state called Loaded Contained Retrieve data. Since the BLoC now has a loaded state, our UI reflects the loaded state by showing the retrieved data to our user. If we were to put all of this logic into our UI, it would get pretty messy with all the set states and only more complicated as we add more logic. This is why separating our business logic from a UI is essential for readability and scaling our app.
  
  
## To run this project

```bash
  flutter pub get  -- getting packages
  flutter run
  flutter test   ---runnig test


```
  
  ## Getting Started

This project is a starting point for a Flutter application.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


