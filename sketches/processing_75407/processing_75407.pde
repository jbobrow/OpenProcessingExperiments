
public class Food {
  float xpos;
  float ypos;
  int diam;
  int growCounter;
  float growthRate;
  boolean wasEaten;
  
  Food() {
    xpos = random(0, 800);
    ypos = random(0, 800);
    growthRate = random(0, 3);
    diam = 0;
  }
  
  boolean eaten() {
    if(wasEaten)
      return true;
    return false; 
  }
  
  void update() {
    if(!wasEaten) {
      noStroke();
      fill(012, 131, 244);
      ellipse(xpos, ypos, diam, diam);
     if(growCounter % 5 == 0)
      {
        grow();
      }
      growCounter++;
    }
  }
  
  void grow() {
    diam+=growthRate;
  }
}

