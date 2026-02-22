// --- HELIOROOTS AI: UNIFIED GLOBAL BRAIN ---

/**
 * 1. HELIO API HANDLERS
 * Connects the frontend to your Flask backend and Langflow AI.
 */
const HelioAPI = {
    // Check Weather for Irrigation Logic
    async checkWeather(lat, lon) {
        try {
            const res = await fetch('/api/weather', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({ lat, lon })
            });
            return await res.json();
        } catch (e) {
            console.error("Weather API Error:", e);
            return { rain: false };
        }
    },

    // Call Gemini AI via Langflow
    async getAIAdvice(context) {
        try {
            const res = await fetch('/api/analyze', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(context)
            });
            return await res.json();
        } catch (e) {
            console.error("AI Analysis Error:", e);
            return { advice: "System busy. Check soil manually." };
        }
    }
};

/**
 * 2. GLOBAL VOICE ENGINE
 * Handles multi-lingual synthesis with Indian accent prioritization.
 */
function speak(text, langCode) {
    // Force clear previous speech queue
    window.speechSynthesis.cancel(); 

    const utter = new SpeechSynthesisUtterance(text);
    
    // Fetch system voices
    const voices = window.speechSynthesis.getVoices();
    
    // Prioritize Indian accents for Kannada/Hindi
    const selectedVoice = voices.find(v => 
        v.lang.startsWith(langCode.split('-')[0]) && 
        (v.name.includes('India') || v.name.includes('Google') || v.name.includes('Natural'))
    ) || voices.find(v => v.lang.startsWith(langCode.split('-')[0]));

    if (selectedVoice) {
        utter.voice = selectedVoice;
        console.log(`Voice Engine: Using ${selectedVoice.name}`);
    }
    
    utter.lang = langCode;
    utter.rate = 0.85; // Rural accessibility speed
    utter.pitch = 1.0;
    
    window.speechSynthesis.speak(utter);
}

/**
 * 3. TOPOLOGY CALCULATOR
 * Logic: 1 Master per farm, 4 Slaves per acre.
 */
function getTopology(acres) {
    const slaveCount = Math.ceil(acres * 4);
    return {
        master: 1,
        slaves: slaveCount,
        total_nodes: slaveCount + 1,
        range: "2.5 KM (LoRaWAN)",
        power: "Solar-Hybrid"
    };
}

/**
 * 4. PERSISTENT DATA HELPERS (farmDB)
 * Manages the "Memory" of the app between pages.
 */
const farmDB = {
    save: (key, val) => {
        const valueToStore = typeof val === 'object' ? JSON.stringify(val) : val;
        localStorage.setItem(key, valueToStore);
    },
    get: (key) => {
        const item = localStorage.getItem(key);
        if (!item) return null;
        try {
            return JSON.parse(item);
        } catch (e) {
            return item;
        }
    },
    getCoords: () => {
        const coords = localStorage.getItem('farmCoords');
        return coords ? JSON.parse(coords) : { lat: 12.9716, lng: 77.5946 };
    }
};

/**
 * 5. CRITICAL INITIALIZATION
 */
window.speechSynthesis.onvoiceschanged = () => {
    console.log("Agricultural Voice Engine Ready.");
    window.speechSynthesis.getVoices();
};