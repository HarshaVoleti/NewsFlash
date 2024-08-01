[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FSupriyaKuncha%2Fculturize&count_bg=%23FE5667&title_bg=%23FE5667&icon=github.svg&icon_color=%23FFFFFF&title=Repository+Visits&edge_flat=false)](https://hits.seeyoufarm.com)

  <h1 align="center"> Quick News App </h1>
<p align="center">A <b>Quick News App</b> made using Flutter and Firebase</p>

<p align="center">A simple quick news app built with Flutter and firebase that displays news in both list and card views and also a page to show the full news.</p>

## 📝 Project Info
The contents in this project follow the following structure, where all views are containerised into screens.

```
flashnews/
├── android/
├── ios/
├── lib/
│   ├── models/
│   │   ├── colors.dart
│   │   ├── textstyles.dart
│   │   └── Article.dart
│   ├── services/
│   │   ├── remote_config.dart
│   │   ├── auth_services.dart
│   │   ├── news_services.dart
│   │   └── shared_preferences.dart
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   └── signup_screen.dart
│   ├── providers/
│   │   ├── auth_provider.dart
│   │   └── news_provider.dart
│   ├── widgets/
│   │   ├── custom_button.dart
│   │   └── custom_textfield.dart
│   ├── main.dart
│   └── firebase_options.dart
├── pubspec.yaml
├── README.md
└── screenshots/
    ├── login_screen.png
    ├── home_screen.png
    └── signup_screen.png
```

## ⚙️ Setup

  #### Tech Stack
  <ul>
  <li><img src="https://img.icons8.com/color/48/null/flutter.png" width="20" height="20">  Flutter</li>
  </ul>
  <li><img src="https://img.icons8.com/color/48/null/firebase.png" width="20" height="20">  Firebase</li>
  </ul>

  #### Pre requisites
  <ul>
  <li><img src="https://img.icons8.com/color/48/null/flutter.png" width="20" height="20">  Flutter SDK installed in your system</li>
  <li>Visual Studio Code, Android Studio and Xcode(if using mac) installed</li>
  <li>Android or IOS emulators installed and running</li>
  </ul>

  ##### Clone the repository
```bash
git clone https://github.com/HarshaVoleti/NewsFlash.git
```
  ##### Move to the desired folder
```bash
cd \NewsFlash
```

  ##### To run the app, simply write
```bash
flutter pub get
flutter run
```

## ℹ️ About

<p> A simple quick news app built with Flutter and firebase that displays news in both list and card views and also a page to show the full news.</p>

### Here is the quick tour on how to use our app
After installing our app.

#### <h3><ins>List & Card View.</ins></h3>
These are authentication screens, one to register and one to login

<div display="flex" align="center" border-left="2px solid white">
<img src="https://github.com/HarshaVoleti/NewsFlash/blob/main/screenshots/signup_screen.png" width="200" height="400" >
<img src="https://github.com/HarshaVoleti/NewsFlash/blob/main/screenshots/login_screen.png" width="200" height="400" >
</div>

#### <h3><ins>News Screen.</ins></h3>
Here, In the Home Screen, News fetched from the API are shown as a lit

<div display="flex" align="center" border-left="2px solid white">
<img src="https://github.com/HarshaVoleti/NewsFlash/blob/main/screenshots/home_screen.png" width="200" height="400" >
</div>

## 🛠️ Built With
Flutter - The UI toolkit used to build the app.
Firebase - for data storage.
## 💬 Contact
Harsha Voleti - mailharshavoleti@gmail.com
