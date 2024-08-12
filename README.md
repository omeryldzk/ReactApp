# React Application

## Overview

This React application serves as the frontend for a full-stack project that interacts with a Spring Boot backend. It features a responsive design with Bootstrap and uses React Router for navigation. The application includes user and account management functionalities.

## Project Architecture

### Components

- **`App.js`**: The root component that defines the application’s routing and layout.
- **`components/`**: Contains individual components for various functionalities:
  - **User Management**: `UserList`, `UserDetail`, `UserForm`
  - **Account Management**: `AccountList`, `AccountForm`, `AccountDetail`
  - **Home Page**: `Home`
  - **Navbar**: `AppNavbar`
  
### Routing

React Router is used for navigation within the app. Routes are defined in `App.js` to handle different paths and components.

### Styling

The application uses Bootstrap for styling. Ensure to include `bootstrap.min.css` for styling components.

## Proxy Configuration

To handle API requests to the backend server, the `setupProxy.js` file is used. This file configures a proxy that forwards requests from the frontend to the backend server. Here's a summary of how it works:

- **Proxy Setup**:
  - **Location**: `setupProxy.js` in the `src` folder.
  - **Functionality**: Redirects requests from `/api` to the backend server.
  - **Configuration**:
    ```javascript
    const { createProxyMiddleware } = require('http-proxy-middleware');

    module.exports = function(app) {
      app.use(
        '/api',
        createProxyMiddleware({
          target: 'http://67.207.86.85:8080',  // Backend server URL
          changeOrigin: true,
          pathRewrite: { '^/api': '' },  // Remove /api prefix before forwarding
        })
      );
    };
    ```
  - **Usage**: Requests to `/api` will be proxied to `http://67.207.86.85:8080`, allowing your React app to communicate with the backend without CORS issues.

## Using Axios

Axios is used for making HTTP requests from the React application. Here's how to use it:

### Setup

1. **Install Axios**:
    ```bash
    npm install axios
    ```

2. **Create an API Utility**:
   - Create a file named `api.js` in the `src` folder for centralized API configuration:
     ```javascript
     import axios from 'axios';

     const api = axios.create({
       baseURL: '/api',  // Base URL for API requests
     });

     export default api;
     ```

### Making Requests

- **GET Request**:
  ```javascript
  import api from '../api';

  useEffect(() => {
    api.get('/users')
      .then(response => {
        // Handle response data
      })
      .catch(error => {
        console.error('Error fetching users:', error);
      });
  }, []);
  ```
- **POST Request**:
    ```javascript
    import api from '../api';

    const handleSubmit = (e) => {
    e.preventDefault();
    const newUser = { firstName, lastName, email, password };

    api.post('/users', newUser)
    .then(response => {
      console.log('User created', response.data);
      // Handle success
    })
    .catch(error => {
      console.error('Error creating user:', error);
    });
};
    ```
- **DELETE Request**:
    ```javascript
    import api from '../api';

  const handleDelete = (id) => {
    if (window.confirm('Are you sure you want to delete this user?')) {
      api.delete(`/users/${id}`)
        .then(() => {
          // Handle success
        })
        .catch(error => {
          console.error('Error deleting user:', error);
        });
    }
  };

    ```
    ## Running the Application

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/ReactApp.git
    cd ReactApp
    ```

2. **Install dependencies:**
    ```bash
    npm install
    ```

3. **Start the development server:**
    ```bash
    npm start
    ```

4. **Navigate to** [http://67.207.86.85:3000](http://67.207.86.85:3000) **to view the application.**

## Additional Resources

- [React Documentation](https://reactjs.org/)
- [React Router Documentation](https://reactrouter.com/)
- [Axios Documentation](https://axios-http.com/)
- [Bootstrap Documentation](https://getbootstrap.com/)

