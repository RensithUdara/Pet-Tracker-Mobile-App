# PetCare - Pet Tracker Mobile App

A comprehensive mobile application built with Flutter MVC architecture for tracking your pet's health records, including vaccinations, checkups, medications, and treatments. Keep your furry friends healthy with smart reminders and intuitive health monitoring.

## Features Implemented

### 🎨 UI/UX Features
- **Welcome Screen**: Engaging onboarding experience with feature highlights
- **Login Screen**: Clean authentication interface with validation
- **Sign Up Screen**: User registration with form validation
- **Home Dashboard**: Quick overview of pet care features
- **Responsive Design**: Adapts to different screen sizes
- **Custom Theming**: Consistent color scheme and typography

### 🏗️ Architecture
- **MVC Pattern**: Clean separation of concerns
  - **Models**: Data structures (User model)
  - **Views**: UI components (Screens & Widgets)
  - **Controllers**: Business logic (AuthController)
- **Provider State Management**: Reactive state management
- **Custom Widgets**: Reusable UI components

### 🔐 Authentication
- **Form Validation**: Email and password validation
- **Loading States**: Visual feedback during authentication
- **Error Handling**: User-friendly error messages
- **State Management**: Login/logout state persistence

### 📱 Custom Components
- **CustomButton**: Styled buttons with loading states
- **CustomTextField**: Form inputs with validation
- **PetLogo**: Animated logo component
- **Responsive Layout**: Adaptive UI components

## Project Structure

```
lib/
├── controllers/
│   └── auth_controller.dart     # Authentication business logic
├── models/
│   └── user.dart               # User data model
├── utils/
│   └── app_constants.dart      # Colors, dimensions, text styles
├── views/
│   ├── screens/
│   │   ├── welcome_screen.dart # Onboarding screen
│   │   ├── login_screen.dart   # Login interface
│   │   ├── sign_up_screen.dart # Registration interface
│   │   └── home_screen.dart    # Dashboard (placeholder)
│   ├── widgets/
│   │   ├── custom_button.dart  # Reusable button component
│   │   ├── custom_text_field.dart # Form input component
│   │   └── pet_logo.dart       # App logo component
│   └── views.dart              # Export file for views
└── main.dart                   # App entry point
```

## Dependencies Added

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.2              # State management
```

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pet_tracker_mobile_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Available Devices
- **Windows Desktop**: Native Windows application
- **Chrome Web**: Web browser application
- **Android/iOS**: Mobile devices (with emulator/device connected)

## Screen Flow

1. **Welcome Screen**: First-time user onboarding
   - App introduction and features
   - "Get Started" button to proceed
   - "Skip for now" option

2. **Login Screen**: Returning user authentication
   - Email and password input
   - Form validation
   - Sign up navigation link

3. **Sign Up Screen**: New user registration
   - Email, password, and confirm password
   - Form validation and error handling
   - Login navigation link

4. **Home Dashboard**: Main app interface (placeholder)
   - Welcome message
   - Feature cards (Pets, Schedule, Health, Reminders)
   - Quick action buttons
   - Sign out functionality

## Design System

### Color Palette
- **Primary**: `#9FBE9F` (Sage Green)
- **Secondary**: `#E8F3E8` (Light Green)
- **Accent**: `#7B9B7B` (Darker Green)
- **Background**: `#F8F8F8` (Light Gray)
- **Surface**: `#FFFFFF` (White)

### Typography
- **Headings**: Bold, clear hierarchy
- **Body Text**: Readable 16px base size
- **Captions**: Secondary information at 12px

### Components
- **Buttons**: Rounded corners (12px radius)
- **Input Fields**: Outlined style with focus states
- **Cards**: Subtle shadows and rounded corners

## Future Enhancements

### Planned Features
- **Pet Management**: Add, edit, delete pet profiles
- **Health Records**: Track vaccinations, medications, vet visits
- **Reminders**: Smart notifications for appointments and medications
- **Calendar Integration**: Scheduling and appointment management
- **Photo Gallery**: Store pet photos and documents
- **Data Backup**: Cloud synchronization
- **Multi-pet Support**: Manage multiple pets
- **Veterinarian Contacts**: Store vet information
- **Health Analytics**: Track health trends over time

### Technical Improvements
- **Database Integration**: Local SQLite and cloud storage
- **API Integration**: Veterinary service APIs
- **Push Notifications**: Reminder system
- **Biometric Authentication**: Fingerprint/Face ID support
- **Offline Functionality**: Local data caching
- **Data Export**: Health record sharing with vets
- **Multi-language Support**: Localization
- **Accessibility**: Screen reader and keyboard navigation support

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Testing

Run tests with:
```bash
flutter test
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: This is the initial implementation focusing on authentication screens and basic architecture. The app is ready for further development of pet tracking features.
