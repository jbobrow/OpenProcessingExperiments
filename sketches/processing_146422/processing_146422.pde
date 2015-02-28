
class AudioManager {
  AudioPlayer playerA;
  AudioSample up;
  AudioSample down;
  AudioSample left;
  AudioSample right;
  AudioSample collisionOne;
  AudioSample collisionTwo;
  AudioSample infoDown;
  AudioSample infoUp;
  AudioSample startUp;
  AudioSample successOne;
  AudioSample successTwo;
  AudioSample voiceDanger;
  AudioSample voiceEngage;
  AudioSample voiceQuick;
  AudioSample voiceShutDown;
  AudioSample voiceYouLost;

  AudioManager() {
    playerA = minim.loadFile("MazeGameBGM.wav");
    up = minim.loadSample("MazeGameUp.wav", 512);
    down = minim.loadSample("MazeGameDown.wav", 512);
    left = minim.loadSample("MazeGameLeft.wav", 512);
    right = minim.loadSample("MazeGameRight.wav", 512);
    collisionOne = minim.loadSample("Game Collision1.wav", 512);
    collisionTwo = minim.loadSample("Game Collision2.wav", 512);
    infoDown = minim.loadSample("Game InfoDown.wav", 512);
    infoUp = minim.loadSample("Game InfoUp.wav", 512);
    startUp = minim.loadSample("Game StartUp.wav", 512);
    successOne = minim.loadSample("Game Success1.wav", 512);
    successTwo = minim.loadSample("Game Success2.wav", 512);
    voiceDanger = minim.loadSample("VoiceDanger.wav", 512);
    voiceEngage = minim.loadSample("VoiceEngage.wav", 512);
    voiceQuick = minim.loadSample("VoiceQuick.wav", 512);
    voiceShutDown = minim.loadSample("VoiceShut-Down.wav", 512);
    voiceYouLost = minim.loadSample("VoiceYou-Lost.wav", 512);
  }
}


