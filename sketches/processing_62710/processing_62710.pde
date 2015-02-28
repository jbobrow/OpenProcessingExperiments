
int xPos = 0;
int xPos2 = 800;
PImage bild1;
PImage bild2;
PImage bild3;
PImage bild4;
PImage bild5;
PImage bild6;
float x1 = 800;
float x2 = 1600;
float x3 = 1600;

void setup () {
  noCursor();
  size (800,650);
  bild1 = loadImage("wagen.png");
  bild2 = loadImage("mann.png");
  bild3 = loadImage("mann2.png");
bild4 = loadImage ("wolken.png"); 
bild5 = loadImage("hintergrund.png");
bild6 = loadImage("vordergrund.png");
}

void draw(){
  
image(bild5,0,0);

  //wolken
  x1 = x1-4;
  if (x1 < -800){
    x1=800;
  }
image(bild4,x1,0);
 
 x2 = x2-4;
  if (x2 < -800){
    x2=800;
  }
image(bild4,x2,0);

  x3 = x3-5;
  if (x3 < -800){
    x3=800;
  }
image(bild4,x3,0);

/*image(bild4,xPos2,0);
  if(xPos2 < -800){
xPos2 = 800;}
xPos2 = xPos2 - 5;*/

  //wagen
 image(bild1,xPos,380);
  if(xPos > width){
xPos = -200;}
xPos = xPos +5;

//mann
  image(bild2,mouseX,300);
  if(mouseX > 850){
mouseX = -50;}

image(bild6,0,450);

if(mousePressed){
xPos =mouseX+ 240;
image(bild3,mouseX,300);

image(bild6,0,450);
 
}
}

