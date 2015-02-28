
class Flower {
  float x, y;
  color c = color(255, 100, 100, 100);
  

  Ani diameterAni;
  float diameterStart = random(0, 500);
  float diameterEnd = random(0, 50);
  float diameter = diameterStart;
  float duration = 0.9;

  Flower(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    // diameter animation
    diameterAni = new Ani(this, duration, "diameter", diameterEnd);
    diameterAni.pause();
    diameter = diameterEnd;
  }

  void bang() {
    for (int i = 0; i < roses.length; i++) {
    diameter = diameterStart;
    diameterAni.seek(0);
    diameterAni.resume();
  }
  }

  void draw() { 
    fill(255, random(150, 255), random(150, 255), 20);
    stroke(255, random(150, 255), random(150, 255), random(0, 255));
    ellipse(x, y, diameter, diameter);
    ellipse(x + 5, y + 5, diameter, diameter);
    ellipse(x - 5, y + 5, diameter, diameter);
    ellipse(x + 5, y - 5, diameter, diameter);
    ellipse(x - 5, y - 5, diameter, diameter);

    ellipse(x + 8, y + 0, diameter, diameter);
    ellipse(x - 8, y + 0, diameter, diameter);
    ellipse(x + 0, y + 8, diameter, diameter);
    ellipse(x + 0, y - 8, diameter, diameter);
    
    if(diameter >= width || diameter >= height) {
  }
}
}


