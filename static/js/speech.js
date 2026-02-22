/**
 * HelioRoots AI Speech Utility
 * Handles multi-language Text-to-Speech for the Hackathon Demo
 */

function speak(text, lang) {
    // Check if the browser supports Speech Synthesis
    if (!window.speechSynthesis) {
        console.error("Browser does not support Speech Synthesis");
        return;
    }

    // Cancel any ongoing speech to prevent overlapping
    window.speechSynthesis.cancel();

    const utterance = new SpeechSynthesisUtterance(text);

    // Map the stored language codes to browser-compatible voices
    // 'kn-IN' -> Kannada, 'hi-IN' -> Hindi, 'en-IN' -> English
    utterance.lang = lang || 'en-IN';
    
    // Set natural speaking parameters
    utterance.rate = 0.9;  // Slightly slower for clarity
    utterance.pitch = 1.0;
    utterance.volume = 1.0;

    // Optional: Log the speech for debugging
    console.log(`AI Speaking (${utterance.lang}): ${text}`);

    window.speechSynthesis.speak(utterance);
}

// Pre-load voices (Fixes Chrome issues where voices aren't ready on load)
window.speechSynthesis.onvoiceschanged = () => {
    window.speechSynthesis.getVoices();
};