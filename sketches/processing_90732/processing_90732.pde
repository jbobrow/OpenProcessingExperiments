
void setup()
{
  size(800,800);
  smooth();
  noLoop();
}
 
void draw()
{
  background(0,219,255);
 
  for(int e = 5; e<= width+5; e+=5)
  { 
    float rw = random(0.5,1.5);
    float rh = random(0.5,1.5);
    int rs = int(random(214));
    int rsw = int(random(2,10));
    grass(e, height-20, rw,rh, rs,rsw);
  }
}
 
void grass(float x, float y, float w, float h, int s, int sw)
{
  pushMatrix();
  translate(x,y);
  scale(w,h);
  stroke(9,129,38);
  strokeWeight(sw);
 
 
 
  line(30, 80, 30,80);
  line(60, 10, 65, 10);
  line(-30, -120, 35, 0);
  line(30, 10, 35, 0);
  popMatrix();
}



