

var audioElement = document.createElement("audio");

PImage Fotopaisaje;
PImage Fotopajaro2;


void setup(){
  size(600,500);
  
  Fotopaisaje = loadImage ("paisaje.jpg");
  Fotopajaro2 = loadImage ("pajaro2.jpg");
  imageMode(CENTER);
}

void draw(){
  image(Fotopaisaje,width/2,height/2,600,500);
  image(Fotopajaro2,mouseX,mouseY,100,100);
}

 void mousePressed(){
   audioElement.setAttribute("src","audio.wav");
   audioElement.play();
   
 }



