

PImage fons;
PImage gat;
var audioElement = document.createElement("audio");

void setup(){
  size(900,600);
  fons = loadImage("ny.jpg");
  gat = loadImage("supergat.png");
}

void draw (){
  
  noCursor();
  image(fons,0,0);
  image(gat, mouseX-80, mouseY-120, 300,300);
}

void mousePressed(){
 audioElement.setAttribute("src","superCAT.mp3");
 audioElement.play();
}



