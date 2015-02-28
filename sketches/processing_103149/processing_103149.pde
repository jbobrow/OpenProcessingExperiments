
float x,y,dim,r,g,b;
boolean shouldRot = false;
int rots = 0;
 
 
 
void setup()
{
  size (500,500,OPENGL);
  frameRate(24);
  r=100;
  g=1;
  b=1;
  smooth();
  noStroke();
}
 
 
void draw()
{
  if (mousePressed && (mouseButton == LEFT)) {
    shouldRot = true;
  } else if (mousePressed && (mouseButton == RIGHT)) {
   shouldRot = false;
  }
   
   
  background (r,g,b++);
 
   
   
  fill (255,255,0);
  translate(width/2,height/2,0);
  lights();
  if(true)
  {
    rotateX(radians(50)+10);
    rotateY(radians(rots/3));
    rotateZ(rots/3);
  }
  dim = width*mouseX ;
  box(100);
   
  pushMatrix();
    translate(100,0,0);
    fill(0,255,0);
    box(100);
  popMatrix();
pushMatrix();
    translate(-100,0,0);
    fill(255,0,0);
    box(100);   
  popMatrix();
   
  if (true)
  {
    rotateX(radians(5));
    rotateY(radians(rots/2));
    rotateZ(rots/2);
  }
  fill(255,0,0);
  translate(170,170,0);
  sphere(10+mouseX/10);
   
  if(true)
   {
    rotateX(radians(5));
    rotateY(radians(rots/2));
    rotateZ(rots/2);
   }
  fill(255,255,0);
  translate(-170,170,0);
  sphere(10+mouseX/10);
  if (true)
  {
    rotateX(radians(5));
    rotateY(radians(rots/2));
    rotateZ(rots/2);
  }
  fill(255,0,255);
  translate(170,-170,0);
  sphere(10+mouseX/10);
   
  if (true)
  {
    rotateX(radians(5));
    rotateY(radians(rots/2));
    rotateZ(rots/2);
  }
  fill(0,255,255);
  translate(170,170,170);
  sphere(10+mouseX/10);
   
  if (true)
  {
    rotateX(radians(5));
    rotateY(radians(rots/2));
    rotateZ(rots/2);
  }
  fill(0,255,0);
  translate(-170,170,0);
  sphere(10+mouseY/10);
   
   
  if(shouldRot)
  {
   rots++;
  }
   
}
