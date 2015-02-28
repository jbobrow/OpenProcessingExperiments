

PImage foto;
PImage foto2;

var audioElement=document.createElement("audio");

void setup(){
   size(800,600);
   
foto=loadImage("paisaje.jpg");
foto2=loadImage("sol.jpg");
}

void draw() {
  image(foto, 0, 0);
  image(foto2,mouseX,mouseY);
}

void mousePressed(){
  audioElement.setAttribute("src","eva.mp3");
  audioElement.play();
}


