
class Ball {
  
  float x = mouseX, y = mouseY;
  
  boolean up = true;
  int ellipses = 10;
  
  boolean clicked = false;
  boolean wither = false;
  
  color initial = color(0, 0, random(100, 200));
  
  AudioPlayer audio;
  
  void draw() {
    if (clicked && !audio.isPlaying()) {
      wither = true;
      up = false;
    }
    
    strokeWeight(3);
    stroke(0);
    line(x, y, 250, 500);
    
    strokeWeight(1);
    
    if (!clicked) {
      stroke(0);
      fill(initial, 100);
      ellipse(x, y, 30, 30);
    } else {
      noStroke();
      for (int i = 0; i < ellipses; ++i) {
        fill(0, 0, random(100, 200),5);
        ellipse(x, y, 30 + i, 30 + i);
      }
      stroke(0);
      ellipse(x, y, 30 + ellipses, 30 + ellipses);
      
      if (up && !wither) {
        ellipses += 1           ;
      } else {
        ellipses -= 1;
      }
      
      if (ellipses >= 30) {
        up = false;
      } else if (ellipses <= 10) {
        up = true;
      }
    }
  }
  
}


