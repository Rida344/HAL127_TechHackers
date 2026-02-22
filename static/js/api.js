const HelioAPI = {
    // 1. Get Real-Time Weather for Irrigation Logic
    async checkWeather(lat, lon) {
        const res = await fetch('/api/weather', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({ lat, lon })
        });
        return await res.json();
    },

    // 2. Call Gemini AI via Langflow
    async getAIAdvice(context) {
        const res = await fetch('/api/analyze', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(context)
        });
        return await res.json();
    }
};