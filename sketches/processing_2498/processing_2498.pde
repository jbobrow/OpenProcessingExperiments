
public class Flower {
  
  float x;
  float y;
  
  float flowerSize = 0;
  float flowerMax = 10;
  float growSpeed = 0.1;
  
  Flower (float xp, float yp) {
  x = xp;
  y = yp;
  registerDraw(this);
  };
  
  void draw() {
    
    if (flowerSize < flowerMax) {
    flowerSize += growSpeed;
    }
    else {
      y -= (flowerSize * random(0.01, 0.9));
    };
    
    fill(255, 255, 255, 50);
    //ellipse(x, y, flowerSize, flowerSize);
    image(bubble, x, y, flowerSize, flowerSize);
    
  };
  
  
};

