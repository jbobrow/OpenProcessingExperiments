


PImage fondo;
PImage raqueta;
int pilotes =10;


var audioElement=document.createElement ("audio");

void setup() {
  size (1200, 880);
  fondo=loadImage("fondo2.jpg" );
  raqueta=loadImage("raqueta2.jpg");
  noCursor();
}

void draw(){
 background (0);
 image (fondo,0,0);
 image (raqueta, mouseX-100, mouseY-100);
}

void mousePressed(){
  
  audioElement.setAttribute("src","smash.wav");
  audioElement.play();
}


