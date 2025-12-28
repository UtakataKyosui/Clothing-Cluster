import axios from 'axios';

// Axiosインスタンスの作成
export const apiClient = axios.create({
    baseURL: process.env.NEXT_PUBLIC_API_URL || '/api',
    headers: {
        'Content-Type': 'application/json',
    },
});

// リクエストインターセプター
apiClient.interceptors.request.use(
    (config) => {
        // 必要に応じて認証トークンなどを追加
        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

// レスポンスインターセプター
apiClient.interceptors.response.use(
    (response) => {
        return response;
    },
    (error) => {
        // エラーハンドリング
        console.error('API Error:', error);
        return Promise.reject(error);
    }
);
