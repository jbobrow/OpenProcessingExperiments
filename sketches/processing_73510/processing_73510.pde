
//Laura Tran CP1 4-5

float rX = .2;
float rY = -.2;
float rZ = .5;

void setup()
{
 background(0);
size(500,500,P3D);
frameRate(40);
}
void draw()
{
  step1();
  step2();
}

void step1()
{
lights();
translate(width/2, height/2, -100);
rotateX(rX);
rotateY(rY);
rotateZ(.5);
fill(0,0,255,3);
noStroke();
sphere(50);
{
 rX = rX + .1;
 rY = rY + -.1;
 rZ = rZ + .1;
}

{
  if (mousePressed)
 stroke(0);
  box(100);
}
}


void step2()
{
  translate(-width/2,-height/2,-100);
  fill(255,0,0,8);
 box(50);
 translate(mouseX,mouseY,100);
 fill(0,255,0,10);
 sphere(45);
}

/**
Click your mouse to see the stroke.<br>
Unclick to undo the stroke.
*/

