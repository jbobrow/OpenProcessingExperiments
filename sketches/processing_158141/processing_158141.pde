
class PausePlayButton {
  boolean paused;
  ControlButton current;
  PauseButton pause;
  PlayButton play;
  float size;
  float xCenter;
  float yCenter;
  
  PausePlayButton(float size, float xCenter, float yCenter) {
    pause = new PauseButton(size, xCenter, yCenter);
    play = new PlayButton(size, xCenter, yCenter);
    current = play;
    play.init();
    paused = true;
  }
  
  void display() {
     current.display();
  }
  
  boolean hover(int x, int y) {
    return current.hover(x,y); 
  }
  
  void onClick(int x, int y) {
    if (hover(x,y)) {
      paused = !paused;
      current.reset();
      if (paused) 
        current = play;
      else 
        current = pause; 
      current.init();
    }
  }
  
  boolean isPaused() {
    return paused; 
  }
}

