import axios from 'axios';

const api = axios.create({
  baseURL: 'http://67.207.86.85:8080',
});

export default api;
