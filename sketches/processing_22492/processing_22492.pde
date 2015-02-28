
import seltar.motion.*;
Motion m;
float Angle = random(TWO_PI), Strokeweight = 1;
PShape cell;
int angle=0;

void setup()
{
  size(700,700);  
  m = new Motion(width,height);
  smooth();
  background(0);  
 
}

void draw()
{
  frameRate(27);
background(0);
  Angle += radians(random(-5,5));
  Strokeweight += random(-10,10);
  m.moveDir(Angle,random(2,5));
  m.wrap(0,0,width,height);
  m.move();
  displayDiatom(m.getX(),m.getY(),cell);
}


void displayDiatom(float x, float y, PShape cell) {
  pushMatrix();
  translate(x,y);
  
  /*cellwall*/
 noFill();
 strokeWeight(5);
 stroke(120,120,30);
 ellipse(0,0,155,155);
  fill(0,255,0,120);
  rotate(angle);
strokeWeight(.1);

  /*chloroplasts*/
  ellipse(20,30,15,15);
  ellipse(60,20,15,15);
  ellipse(40,49,15,15);
  
/*nucleus*/
   fill(190,30,30);
   stroke(255,0,0);
   strokeWeight(3);
  ellipse(0,0,random(40,50),random(40,50));
  noStroke();
  fill(40,5,5);
  ellipse(random(0,17),5,10,10);
  
 /* Endoplasmic Reticulum*/
strokeWeight(1);
stroke(255,0,255);

  line (20,20,25,30);
  line (25,30,10,30);
  line (10,30,25,40);
  noStroke();
  /*vacuole*/
  fill(15,115,100);
  rect(30,30,20,20);
  
  /*mitochondria*/
   fill(190,30,30);
  ellipse(25,25,4,15);
  ellipse(10,55,15,4);
  
 /*ribosomes*/
 noStroke();
   fill(255);
 
ellipse(30,30,2,2);
ellipse(35,60,2,2);
ellipse(30,10,2,2);
ellipse(20,30,2,2);

  popMatrix();
  
  
 
 angle++;
  
  
}
	

