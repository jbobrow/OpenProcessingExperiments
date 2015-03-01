
Wave myWave1;
Wave myWave2;
Wave myWave3;
PImage shark;
PImage sharkz;
PFont f;

void setup() {
  size (665,385);
 myWave1 = new Wave(color(51,209,152), 100,200,2,1);
 myWave2 = new Wave (color(163, 229, 234), 50,100,1,1);
 myWave3= new Wave (color(0, 168, 203), 25, 50, 2, 2);
 shark=loadImage("sharky.jpg");
 sharkz=loadImage("sharkz.jpg");
 f = loadFont("Courier-Bold-48.vlw");
}

void draw() {

 if (mousePressed) {
   background(sharkz);
 } else {
   background(shark);
 }
 if (mousePressed){
fill(mouseX,mouseY,50);
ellipse(278,175, 10,20);
fill(mouseX,mouseY,50);
ellipse(415,174, 10, 20);
fill(mouseX,mouseY,50);
ellipse(560,195,15,15); 
 }


  myWave1.move();
  myWave1.display();
  myWave2.move();
  myWave2.display();
  myWave3.move();
  myWave3.display();


  textFont(f);   
if (mousePressed){
  fill(mouseX,mouseY,50);
} else {
  fill(10,mouseX,mouseY);
}

  textAlign(CENTER);
  if (mousePressed){
  text("FLOWER",width/2,mouseX-100); 
  } else {
  text("flower",width/2,mouseY);
}

}

class Wave {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
 
  
  Wave(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
   yspeed = tempYspeed;
  
}

void display() {
  stroke(0,0,0,0);
  if (mousePressed) {
    fill (c/6);
  } else {
  fill(c);
  }
  rectMode(CENTER);
  rect (xpos,ypos,200,100);
}


void move() {
  if (mousePressed) {
  xpos = xpos + xspeed+8;
  if (xpos> width) {
    xpos=50;
  } } else {
  xpos = xpos + xspeed;
  if (xpos> width) {
    xpos=0;
  } }
  if (mousePressed) {
    ypos = ypos + yspeed+8;
    if (ypos> height) {
      ypos = 0;
    } } else {
    ypos=ypos+yspeed;
    if (ypos> height) {
      ypos=0;
  }
    }
}
}


