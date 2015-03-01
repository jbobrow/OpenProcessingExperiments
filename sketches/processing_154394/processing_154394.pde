
float x2;
float y2;
float easingCoeff=.2;


void setup ()
{
  size(400, 400);
}
void draw ()
{
  background(0);
 
  
  float x=mouseX;
  float diffX= x-x2;
  if(abs(diffX)>1) {
    x2 += diffX*easingCoeff;
  }
  {
    float y=mouseY;
    float diffY=y-y2;
    if(abs(diffY) > 1) {
      y2 += diffY*easingCoeff;
    }
  }
  ellipse(x2, y2, 55, 55);
}




