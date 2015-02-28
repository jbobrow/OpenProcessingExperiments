
class Bubble {
  float radius = 0;
  float noiseNum = 0;
  float centreX = random (-300, 300);
  float centreY = random (-300, 300);
  
  //constructor function
  Bubble() {
  };
  
  void draw() {
    float radius =noise(noiseNum) *180;
    noiseNum = noiseNum+random(-0.03,0.01);
    stroke(210+random(-50,50),10+random(-10,20),80+random(0,255),100);
    fill(245,190,2);
    ellipse(centreX, centreY, radius,radius);
  }
}

