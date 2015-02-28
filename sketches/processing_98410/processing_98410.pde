
PImage ketchup;
PImage fondo;

var audioElement= document.createElement("audio");

void setup(){
  size(400,300);

  fondo= loadImage("fondo.png");
  ketchup= loadImage("ketchup.png");

}

void draw(){
 
  image(fondo,0,0,width,height);
image(ketchup,mouseX,mouseY,50,50);
  

}

void mousePressed(){
  audioElement.setAttribute("src","so.mp3");
  audioElement.play();
}


