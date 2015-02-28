
float rot;
float boxsize;
void setup()
{
  size(1280,720, P3D);
}
void draw()
{
  background(255);
  translate(width/2, height/2);
  rot+=0.01;
  if(!mousePressed) {
    rotateX(rot);
    rotateY(rot);
  }
  boxsize = 200;
  box(boxsize);
  koch(boxsize);}

void koch(float h) {
if (h > 40)
  {
   float i = h*0.707107;
    h *= 0.5;
  
  pushMatrix();
  translate(h+h/2,0,0);
  box(h);
  koch(h);  
  popMatrix();
  
  pushMatrix();
  translate(-h-h/2,0,0);
  box(h);
  koch(h);
  popMatrix();

  pushMatrix();
  translate(0, h+h/2,0);
  box(h);
  koch(h);  
  popMatrix();
  
  pushMatrix();
  translate(0, -h-h/2,0);
  box(h);
  koch(h);
  popMatrix();
  
  pushMatrix();
  translate(0, 0, h+h/2);
  box(h);
  koch(h);  
  popMatrix();
  
  pushMatrix();
  translate(0, 0,-h-h/2);
  box(h);
  koch(h);
  popMatrix();
  
  }
  
}
