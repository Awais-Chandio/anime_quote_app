# Random Anime Quote App

A Flutter application that fetches and displays random anime quotes from the Animechan API ('https://animechan.io/api/v1/quotes/random'). The app maintains a history of the last 10 quotes and allows users to view them in a separate history screen.

---

## Features

- Fetches and displays random anime quotes.
- Maintains a history of the last 10 quotes.
- Saves quote history locally using `shared_preferences`.
- Displays user-friendly error messages.
- Works on Android, iOS, and Web.

---

## Getting Started

### Prerequisites

- Flutter SDK installed. Follow the [official guide](https://flutter.dev/docs/get-started/install) if not already installed.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/random-anime-quote-app.git
   cd random-anime-quote-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## Project Structure

```
lib/
├── models/
│   └── anime_quote.dart          # Model for the anime quote
├── repositories/
│   └── quote_repository.dart     # Handles API calls
├── viewmodels/
│   └── quote_viewmodel.dart      # Manages app state
├── views/
│   ├── quote_screen.dart         # Main screen for random quotes
│   └── history_screen.dart       # Screen for quote history
└── main.dart                     # Entry point of the app
```

---

## Dependencies

- [http](https://pub.dev/packages/http): For API requests.
- [provider](https://pub.dev/packages/provider): For state management.
- [shared_preferences](https://pub.dev/packages/shared_preferences): For local storage.

---

## Running on Different Platforms

- Android: Run on an emulator or physical device.
- iOS: Run on a simulator or physical device.

---

## Contributing

Contributions are welcome! Open an issue or submit a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact

For questions or feedback, reach out:

- Email: awaischandio5544@gmail.com
- GitHub: [Awais-Chandio](https://github.com/Awais-Chandio)

---

Enjoy the app! 🚀
