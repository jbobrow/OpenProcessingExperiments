
void drawFractal(float x, float y, float s, int d){
fill((2*d*51)%255,((d+2)*51)%255,((d+4)*51)%255);
rect(x, y, s, s);
if(d > 0){
  drawFractal(x-(s/3),y+(s/3),(s/3),d-1);
  drawFractal(x+s, y+(s/3),(s/3),d-1);
  drawFractal(x+(s/3),y+s,(s/3),d-1);
  drawFractal(x+(s/3),y-(s/3),(s/3),d-1);
  drawFractal(x+(s/3),y+(s/3),(s/3),d-1);}
  else {return;}}
  void setup(){
    noStroke();
    size(500,500);
 drawFractal(122, 122, 243, 5);
  }
 

