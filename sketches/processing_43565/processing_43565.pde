
PShape s;

void setup()
{
  size(600,600);
  smooth();
  //noLoop();
  shapeMode(CENTER);
  
  
  s = loadShape ("final_logo.svg");
}
 
void draw()
{
  background(10,115,115);
 
  for(int i = -50; i<= width+50; i+=80)
  { 
    float rw = random(0.5,1.5);
    float rh = random(0.5,1.5);
    int rs = int(random(255));
    int rsw = int(random(2,10));
    logo(rs, rh, rw,rh, s, i);
  }
}
 
void logo(float x, float y, float w, float h, PShape s, int sw)
{
  pushMatrix();
  translate(x,height/2);
  scale(w,h);
  stroke(h);
  strokeWeight(w);
 shape(s, 0, 0, 100, 100);
  popMatrix();
}

