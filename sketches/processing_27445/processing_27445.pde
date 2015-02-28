
class Bonus {
  
  float x;
  float y;
  float diameter;
  
  Timer timer;
  boolean available;
  boolean active;
  
  Bonus() {
    x = random(width);
    y = random(height);  
  
    available = false;
    active = false;
  
    timer = new Timer(3000);
    diameter = 30;
  }
  
  void update() {
    if (timer.finished()) {
      if (active == true) {
        active = false;
        available = false;
      }
      else {
        available = !available;
        x = random(width);
        y = random(height);  
      }
      timer.reset();
    }
  }
  
  void display() {
    // just a little trick here to animate the outline
    float c = map(sin(frameCount*0.1), -1, 1, 128, 255);
    stroke(c);
    fill(0,255,0);
    ellipse(x, y, diameter, diameter);
    fill(c);
    textFont(basicFont);
    textAlign(CENTER);
  
  }
    
 
  void activate() {
    active = true;
    available = false;
    timer.reset();
  }
    
 
  void reset() {
    available = false;
    active = false;
    timer.reset();
  }
  
}
  

