
public class Flower {

  float x;
  float y;
  
  float flowerSize = 0;
  float flowerMax = 10;
  float growSpeed = 1;

  Flower(float xp, float yp) {
    x = xp;
    y = yp;
    registerDraw(this);  
  };

  void draw() {
    if (flowerSize < flowerMax) {
    flowerSize += growSpeed;
    }
    else {
      y -= flowerSize;
    };
    fill(255, 255, 255, 50);
  image(bubble, x, y, flowerSize, flowerSize);
  };

};


