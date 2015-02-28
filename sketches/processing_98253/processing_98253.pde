

var audioElement = document.createElement("audio");

PImage FotoMono;
PImage FotoSelva;


void setup(){
size(500,500);
background(32,255,0);
FotoMono=loadImage("monkeygif.gif");
FotoSelva=loadImage("selva.jpg");
imageMode(CENTER);
}

void draw(){
  image(FotoSelva,width/2,height/2,500,500);
  image(FotoMono, mouseX, mouseY, 290,280);
}

void mousePressed(){
 audioElement.setAttribute("src","soundmonkey.wav");
 audioElement.play();
}



