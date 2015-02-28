
int xPos = 20;
int yPos = 20;
int rad = 100;

int dirX = 80;
int dirY = 80;

PImage bild1;
PImage bild5;
PImage bild6;

void setup () {
  noCursor();
  smooth();
  size (800,650);
bild1 = loadImage("fus.png"); 
bild5 = loadImage("hintergrund1.png");  
bild6 = loadImage("vordergrund.png");
}

void draw(){
  
image(bild5,0,0);


noStroke();
ellipse(xPos, yPos, rad, rad);
 if (xPos > width || xPos < 0) {
    dirX = dirX * -1;
  }
  if (yPos > height || yPos < 0) {
    dirY = dirY * -1;
  }
  xPos = xPos + dirX;
  yPos = yPos + dirY;
 
  

  
  image(bild1,0,mouseY - 1100);

image(bild6,0,250);
  
  //stopt ellipsen:
 if(mousePressed){
   image(bild5,0,0);
   ellipse(390,600,100,100);
 image(bild1,0,-550);
}

image(bild6,0,250);
 
}


