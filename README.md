# Weather App

A simple Flutter weather application that shows current weather conditions with beautiful animations.

## Features

- 🌍 Automatically detects user's current city
- 🌡️ Displays current temperature
- ☁️ Shows weather conditions with animated illustrations

## App Demo

<p align="left">
  <img src="https://github.com/damooola/weather-app/raw/main/assets/weather_app_gif.gif"
       alt="Weather App Demo"
       width="250"
       height="450"/>
</p>

## Requirements

- Flutter SDK
- OpenWeatherMap API key
- The following Flutter packages:
  - `http`
  - `geolocator`
  - `geocoding`
  - `lottie`

## Setup

1. Clone the repository

```bash
git clone https://github.com/damooola/weather_app.git
```

2. Get Flutter dependencies

```bash
flutter pub get
```

3. Add your OpenWeatherMap API key
   - Sign up at [OpenWeatherMap](https://openweathermap.org/api) to get an API key
   - Replace the API key in `WeatherPage` with your key:

```dart
final _weatherService = WeatherServices("YOUR_API_KEY_HERE");
```

## Project Structure

```
lib/
  ├── models/
  │   └── weather_model.dart
  ├── services/
  │   └── weather_services.dart
  ├── pages/
  │   └── weather_page.dart
  └── main.dart
```

## Animation Assets

The app uses Lottie animations for different weather conditions:

- `assets/sunny.json` - Clear weather
- `assets/cloudy.json` - Cloudy conditions
- `assets/shower.json` - Rain
- `assets/thunder.json` - Thunderstorms

## How It Works

1. The app starts by getting the user's current city using the device's location
2. It then fetches weather data for that city from OpenWeatherMap API
3. The UI updates to show:
   - City name
   - Current temperature
   - Weather condition
   - An animation matching the current weather

## Known Issues

- The app may show "Loading City..." if location services are disabled
- Temperature is always displayed in Celsius

## Future Improvements

- [ ] Add support for multiple cities
- [ ] Implement weather forecast
- [ ] Add temperature unit toggle (Celsius/Fahrenheit)
- [ ] Improve error handling and user feedback

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

- Weather data provided by [OpenWeatherMap](https://openweathermap.org/)
- Weather animations from [LottieFiles](https://lottiefiles.com/)
- This project is based on Minimal Weather App by Mitch Koko. You can find     the original tutorial [here](https://youtu.be/yLtpMqvMgdY?si=Ax9qaewb3fwYEvPH).
