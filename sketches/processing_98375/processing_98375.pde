
var audioElement = document.createElement("audio");

PImage Agua;
PImage pedra;

void setup(){
 size(400,400);
background(0);
Agua = loadImage("Agua.jpg");
pedra = loadImage("pedra.png");
imageMode(CENTER);
  
  

}




void draw(){
 image(Agua, width/2, height/2, 400, 400); 
  image(pedra,mouseX,mouseY, 100,100);


if (mousePressed){
 audioElement.setAttribute("src","splash.wav");
audioElement.play();

   }
}


