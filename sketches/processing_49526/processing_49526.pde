
class Bg {

  float x;
  float y;
  float w;
  float h = height;
  boolean moving;
  boolean scoretrig = false;
  PImage bgshape;
  float side;
 
  float sx; //s stands for starting
  float sy;
  float sw;
  boolean sm;
  
  Bg(float xtemp, float ytemp, float wtemp, boolean movtemp, float sidetemp) {
  
    x = xtemp;
    y = ytemp;
    w = wtemp;
    moving = movtemp;
    bgshape = loadImage("cavefloor.png");
    side = sidetemp;
    
    sx = x;
    sy = y;
    sw = w;
    sm = moving;
    
  }
  
  void reset(){
  
    x = sx;
    y = sy;
    w = sw;
    moving = sm;
  }
  
  void render() {
    if (y < height) {
      if (moving) y += dif();
      fill(60,10,10);
      rect(x,y,w,h);
      if(side == 2) {
        image(bgshape, x, y-20);
      }
    }
  }

}

