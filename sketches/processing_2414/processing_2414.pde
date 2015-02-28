
public class greenLight {
  
  float x;
  float y;
  
  float greenLightSize = 0;
  float greenLightMax = 6;
  float growSpeed = 0.1;
  
  greenLight(float xp, float yp) {
    x = xp;
    y = yp;
    registerDraw(this);
    };
    
void draw() {
  
  if (greenLightSize < greenLightMax) {                //If the light is smaller than the max size GROW
  greenLightSize += growSpeed;
  }
  
  else {                                     //If the light is at Max size fall off the screen
  y -= (greenLightSize * random(0.01,1));
  };
  
  fill(255, 255, 255, 90);
  image(gBubble, x, y, greenLightSize, greenLightSize);
  };
};

