
int px;
int py;
int vx;
int vy;
int g;
int b;
int r;
int numberx;
int numbery;
void setup() {
  size(600, 600);
  background(0, 0, 0);
  vx=5;
  vy=5;
  numberx=120;
  numbery=120;
  px      = 0;
  py      = 0; 
  fill(255, 255, 255);


}  
 
void draw() { 
  rect(px,py,5,5);
  vy=0;
  vx=5;
  for (int i = 0; i < numberx; i++)
  {
    vy=0;
    rect(vx,py,5,5);  
    vx+=5;
     r    = (int)random(0, 256);
     g    = (int)random(0, 256);
     b    = (int)random(0, 256);
    fill(r,g,b);
    for (int v = 0; v < numbery; v++)
   {
     rect(vx-10,vy,5,5);  
      vy+=5;
      r    = (int)random(0, 256);
      g    = (int)random(0, 256);
      b    = (int)random(0, 256);
      fill(r,g,b);
    }
}
}
