
class Spiral
{
  float centerX, centerY, prevX, prevY, radius;
  int deg = 0;

  Spiral(float startX, float startY) {
    radius = 0.15;
    centerX = startX;
    centerY = startY;
    prevX = centerX;
    prevY = centerY;
  }
  

  void draw(float startX, float startY) {
deg++;
   for(int i = 0; i<360*8; i+=12){
    float angle = radians(i);
    float x = (startX + (cos(angle) * radius));
    float y = (startY + (sin(angle) * radius));
    stroke(#ff0000);
    line(prevX, prevY, x, y);
    radius *= 1.025;
    prevX = x; 
    prevY = y;
   }
  
  }
}


