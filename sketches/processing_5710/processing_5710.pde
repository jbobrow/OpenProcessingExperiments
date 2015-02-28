
class DancingPixel{
  float x;
  float y;
  float pixelSize;
  float angle;
  float colorR;
  float colorG;
  float colorB;

  DancingPixel(float sz0, float x0, float y0, float r0, float g0, float b0){
    pixelSize = sz0;
    x = x0;
    y = y0;
    colorR = r0;
    colorG = g0;
    colorB = b0;
    angle = 0;
  }

  void draw(){
    fill(colorR,colorG,colorB);
    rect(x+10*cos(angle),y+10*sin(angle),pixelSize,pixelSize);
  }

  void update(){
    angle += radians(5);
  }

}



