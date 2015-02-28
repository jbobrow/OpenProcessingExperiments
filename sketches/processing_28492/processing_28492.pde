
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

ArrayList<Collision> collisions = new ArrayList<Collision>();

int whitex1 = 140;
int whitex2 = 250;
int whitex3 = 360;
int whitey = 440;
int goldx1 = 195;
int goldx2 = 305;
int goldy = 390;
int buttonsizea = 60;
int buttonsizeb = 35;
float explodespeed = 0.5;

Minim minim = new Minim(this);


void setup()
{
  smooth();
  size(500,500);
  
  
  minim.loadFile("Powerup_vib.wav").close();
  minim.loadFile("Powerup.wav").close();
  minim.loadFile("Everything_up.wav").close();
  minim.loadFile("Hit_Hurt.wav").close();
  minim.loadFile("Meathead.wav").close();
  
}
void beat1()
{
  stroke(0);
  fill(255);
  ellipse(whitex1,whitey,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(whitex1,whitey,buttonsizeb,buttonsizeb);  
}
void beat1a()
{
  stroke(255,215,0);
  fill(255);
  ellipse(whitex1,whitey,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(255,215,0);
  ellipse(whitex1,whitey,buttonsizeb,buttonsizeb);
}
void beat2()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goldx1,goldy,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(goldx1,goldy,buttonsizeb,buttonsizeb);  
}

void beat2a()
{
  stroke(255);
  fill(255,215,0);
  ellipse(goldx1,goldy,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(255);
  ellipse(goldx1,goldy,buttonsizeb,buttonsizeb);  
}
void beat3()
{
  stroke(0);
  fill(255);
  ellipse(whitex2,whitey,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(whitex2,whitey,buttonsizeb,buttonsizeb);  
}
void beat3a()
{
  stroke(255,215,0);
  fill(255);
  ellipse(whitex2,whitey,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(255,215,0);
  ellipse(whitex2,whitey,buttonsizeb,buttonsizeb);  
}
void beat4()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goldx2,goldy,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(goldx2,goldy,buttonsizeb,buttonsizeb);  
}
void beat4a()
{
  stroke(255);
  fill(255,215,0);
  ellipse(goldx2,goldy,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(255);
  ellipse(goldx2,goldy,buttonsizeb,buttonsizeb);  
}
void beat5()
{
  stroke(0);
  fill(255);
  ellipse(whitex3,whitey,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(0);
  ellipse(whitex3,whitey,buttonsizeb,buttonsizeb);  
}

void beat5a()
{
  stroke(255,215,0);
  fill(255);
  ellipse(whitex3,whitey,buttonsizea,buttonsizea);
  noFill();
  strokeWeight(2);
  stroke(255,215,0);
  ellipse(whitex3,whitey,buttonsizeb,buttonsizeb);  
}

float goR1 = 0;
float goR2 = 0;
float goR3 = 0;
float goR4 = 0;
float goR5 = 0;
float goL1 = 500;
float goL2 = 500;
float goL3 = 500;
float goL4 = 500;
float goL5 = 500;

void ball1()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goR1,40,10,10);
  goR1 = goR1 + 3;
  if (goR1 > 500)
  {
    goR1 = 0;
  }  
}
void ball1a()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goL1,40,10,10);
  goL1 = goL1 - 3;
  if (goL1 < 0)
  {
    goL1 = 500;
  }  
}
void ball2()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goR2,80,10,10);
  goR2 = goR2 + 3;
  if (goR2 > 500)
  {
    goR2 = 0;
  }   
}
void ball2a()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goL1,80,10,10);
  goL2 = goL2 - 3;
  if (goL2 < 0)
  {
    goL2 = 500;
  }
}
void ball3()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goR3,120,10,10);
  goR3 = goR3 + 3;
  if (goR3 > 500)
  {
    goR3 = 0;
  }  
}
void ball3a()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goL1,120,10,10);
  goL3 = goL3 - 3;
  if (goL3 < 0)
  {
    goL3 = 500;
  }  
}
void ball4()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goR4,160,10,10);
  goR4 = goR4 + 3;
  if (goR4 > 500)
  {
    goR4 = 0;
  }   
}
void ball4a()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goL1,160,10,10);
  goL4 = goL4 - 3;
  if (goL4 < 0)
  {
    goL4 = 500;
  } 
}
void ball5()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goR5,200,10,10);
  goR5 = goR5 + 3;
  if (goR5 > 500)
  {
    goR5 = 0;
  }  
}
void ball5a()
{
  stroke(0);
  fill(255,215,0);
  ellipse(goL1,200,10,10);
  goL5 = goL5 - 3;
  if (goL5 < 0)
  {
    goL5 = 500;
  }  
}

float growx = 0;
float growy = 0;

void explode1()
{
  noFill();
  stroke(255);
  ellipse(250,40,growx,growy);
  growx = growx + explodespeed;
  if (growx > 350)
  {
    growx = 0;
  }
  growy = growy + explodespeed;
  if (growy > 350)
  {
    growy = 0;
  } 
}
void explode2()
{
  noFill();
  stroke(255);
  ellipse(250,80,growx,growy);
  growx = growx + explodespeed;
  if (growx > 350)
  {
    growx = 0;
  }
  growy = growy + explodespeed;
  if (growy > 350)
  {
    growy = 0;
  }
}
void explode3()
{
  noFill();
  stroke(255);
  ellipse(250,120,growx,growy);
  growx = growx + explodespeed;
  if (growx > 350)
  {
    growx = 0;
  }
  growy = growy + explodespeed;
  if (growy > 350)
  {
    growy = 0;
  }
}
void explode4()
{
  noFill();
  stroke(255);
  ellipse(250,160,growx,growy);
  growx = growx + explodespeed;
  if (growx > 350)
  {
    growx = 0;
  }
  growy = growy + explodespeed;
  if (growy > 350)
  {
    growy = 0;
  }
}
void explode5()
{
  noFill();
  stroke(255);
  ellipse(250,200,growx,growy);
  growx = growx + explodespeed;
  if (growx > 350)
  {
    growx = 0;
  }
  growy = growy + explodespeed;
  if (growy > 350)
  {
    growy = 0;
  }
}

void draw()
{
  background(0);  
  beat1();
  beat2();
  beat3();
  beat4();
  beat5();
  
  if (dist(mouseX,mouseY,whitex1,whitey) < 30) {
    beat1a();
  }
  if (dist(mouseX,mouseY,goldx1,goldy) < 30) {
    beat2a();
  }
  if (dist(mouseX,mouseY,whitex2,whitey) < 30) {
    beat3a();
  }
  if (dist(mouseX,mouseY,goldx2,goldy) < 30) {
    beat4a();
  }
  if (dist(mouseX,mouseY,whitex3,whitey) < 30) {
    beat5a();
  }  
  
  for (Collision coll : collisions) {
    coll.moveAndDraw();
  }
  
}

void mousePressed() {
  if (dist(mouseX,mouseY,whitex1,whitey) < 30) {
    collisions.add(new Collision(40, "Powerup_vib.wav"));
  }
  if (dist(mouseX,mouseY,goldx1,goldy) < 30) {
    collisions.add(new Collision(80, "Powerup.wav"));
  }
  if (dist(mouseX,mouseY,whitex2,whitey) < 30) {
    collisions.add(new Collision(120, "Everything_up.wav"));
  }
  if (dist(mouseX,mouseY,goldx2,goldy) < 30) {
    collisions.add(new Collision(160, "Hit_Hurt.wav"));
  }
  if (dist(mouseX,mouseY,whitex3,whitey) < 30) {
    collisions.add(new Collision(200, "Meathead.wav"));
  } 
  
}


