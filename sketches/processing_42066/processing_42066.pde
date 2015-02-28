

float a, b, c, d, e;
float x1, z1,
      x2, z2,
      x3, z3,
      x4, z4;
float depth;
void setup ()

{
  size(800, 800, P3D);
  depth = 800;
  a=0;
  frameRate(60);
  textMode(CENTER);
  smooth();
}

void draw()
{
  b=frameCount/5.0;
  c=frameCount/10.0;
  d=frameCount/20.0;
  e=frameCount/3.0;
  lights();
  background(0);
  x1 = width*sin(b);  x2 = width*sin(c); x3 = width*sin(d);  x4 = width*sin(e); 
  z1 = depth*cos(b);  z2 = depth*cos(c); z3 = depth*cos(d);  z4 = depth*cos(e);
  drawsystem();
  rotatesystem();
}
void drawsystem()
{
   pushMatrix();
    rotateX(a);
    translate(width/2, .75*height, 0);
     fill(255,255,0);
     stroke(255,255,0);
     pushMatrix();
      translate(0,-50,0);
      text ("the solar system!");
     popMatrix();
     noStroke();
     sphere(30);
    pushMatrix();
     translate(.25*x1, 0, -.25*z1);
     fill(0,255,0);
     stroke(0,0,255);
     sphere(10);
    popMatrix();
    pushMatrix();
     translate(.5*x2, 0, -.5*z2);
     fill(255,0,0);
     noStroke();
     sphere(15);
    popMatrix();
    pushMatrix();
     translate(.4*x3, 0, -.4*z3);
     fill(255,100,0);
     noStroke();
     sphere(25);
    popMatrix();
    pushMatrix();
     translate(.125*x4, 0, -.125*z4);
     fill(255,0,255);
     noStroke();
     sphere(4);
    popMatrix();
   popMatrix(); 
}
void rotatesystem()
{
  if (keyPressed==true)
  {
    if(keyCode == UP)
    { a=a+.05;}
    if(keyCode == DOWN)
    { a=a-.05;}
  }
}

