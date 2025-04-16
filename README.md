# Flutter Product Manager

A full-stack product management application with a Node.js/Express/MongoDB backend and Flutter frontend.

## Project Structure

```
project/
├── back-end/             # Node.js Express API server
│   ├── models/           # MongoDB schemas
│   ├── routes/           # API endpoints
│   ├── .env              # Environment variables (not included in repo)
│   └── index.js          # Server entry point
│
└── product_app/          # Flutter mobile application
    └── lib/
        ├── models/       # Data models
        ├── providers/    # State management
        ├── screens/      # UI screens
        └── main.dart     # App entry point
```

## Backend (Node.js/Express/MongoDB)

### Features
- RESTful API with Express
- MongoDB database for product storage
- CRUD operations for product management

### Setup
1. Navigate to the back-end directory:
   ```
   cd back-end
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Create a `.env` file in the back-end directory with:
   ```
   MONGO_URI=your_mongodb_connection_string
   ```

4. Start the server:
   ```
   node index.js
   ```
   
The server will run on port 3000 by default.

## Frontend (Flutter)

### Features
- Clean UI for product management
- Provider pattern for state management
- HTTP client for API communication
- CRUD operations interface

### Setup
1. Navigate to the product_app directory:
   ```
   cd product_app
   ```

2. Install Flutter dependencies:
   ```
   flutter pub get
   ```

3. Update the API endpoint in `lib/providers/product_provider.dart` if needed:
   ```dart
   final String baseUrl = 'http://localhost:3000/products';
   // Use 'http://10.0.2.2:3000/products' for Android emulator
   ```

4. Run the app:
   ```
   flutter run
   ```

## API Endpoints

| HTTP Method | Endpoint | Description |
|-------------|----------|-------------|
| GET | /products | Get all products |
| POST | /products | Create a new product |
| GET | /products/:id | Get a specific product |
| PUT | /products/:id | Update a product |
| DELETE | /products/:id | Delete a product |

## Models

### Product
```javascript
{
  name: String,
  price: Number,
  description: String
}
```

## App Screens

1. **Home Screen**: Displays a list of all products
2. **Add Product Screen**: Form to add a new product
3. **Product Detail Screen**: View product details
4. **Edit Product Screen**: Update or delete product

## Troubleshooting

### Flutter App Can't Connect to API
- Ensure the backend server is running
- Check the API URL in `product_provider.dart`
- For Android emulator, use `10.0.2.2` instead of `localhost`
- For iOS simulator, use `localhost`
- For physical devices, use your computer's IP address

### Loading Screen Issue
If the app shows a continuous loading screen:
- Check if the Flutter app is correctly fetching data from the API
- Verify that the MongoDB connection is successful
- Check your network connectivity

