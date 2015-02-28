
//zeewan lee
//March 04, 2011
//final project first draft
PImage universe;
PImage fetus;
PImage baby1;
PImage baby2;
float speed = 0.5;
int diameter=20;
float x;
float y;
particle small; 
particle big;


void setup() {
  size(600,459);
  smooth();
  universe=loadImage("universe.jpg");
  fetus=loadImage("fetus.png");
  baby1=loadImage("baby1.png");
  baby2=loadImage("baby2.png");
  x=width/2;
  y=height/2;
  small=new particle (width*0.33, height/2,50);
  big= new particle (width*0.66, height/2,10);
   }


void draw () {
 background(universe); 
 image (baby2,0,200);
 image(fetus,random(100,400),random(50,300));
 
 small.move();
 small.display();
 big.move();
 big.display();
 
  if (mousePressed){
  if(mouseButton==LEFT){
    image(baby1,random(mouseX-10,mouseX+10),random(mouseY-10,mouseY+10));
     }  
     }
}

class particle {
float x;
float y; 
int diameter;
float speed=3.5;

particle (float tempX, float tempY, int tempDiameter){
  x=tempX;
  y=tempY;
  diameter=tempDiameter;
}

void move() {
  x +=random(-speed, speed);
  y +=random(-speed, speed);
}

void display () {
  ellipse (x,y,diameter,diameter);
  noStroke();
  fill(random(200),random(0,150),random(200),random(80,300));
}
}
 


