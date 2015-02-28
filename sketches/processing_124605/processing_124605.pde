

class Call {
  String[] WAVES = {"iphone.wav","LG.wav","nokia.wav","old_phone.wav"};

  AudioPlayer player;
  Phone phone1;
  Phone phone2;
  boolean isStarted, isFinished;
  

  Call(Phone phone1, Phone phone2) {
    this.phone1 = phone1;
    this.phone2 = phone2;
  }

  void draw() {
    if (isStarted && !player.isPlaying()) {
        isFinished = true;
        phone1.isRinging = false;
        phone2.isRinging = false;
    }
    
    if (!isStarted) {
      isStarted = true;
      player = minim.loadFile(WAVES[rand.nextInt(WAVES.length)]);
      player.play();
      phone1.isRinging = true;
      phone2.isRinging = true;
    }
    
  }
}

