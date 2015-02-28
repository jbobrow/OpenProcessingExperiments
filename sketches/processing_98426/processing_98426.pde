
var audioElement = document.createElement("audio");
 
PImage fruteria;
PImage tronja;
 
void setup(){
 size(400,400);
background(0);
fruteria = loadImage("fruteria.jpg");
tronja = loadImage("naranja.jpg");
imageMode(CENTER);
    
}
 
void draw(){
 image(fruteria, width/2, height/2, 400, 400);
  image(naranja,mouseX,mouseY, 100,100);
 
 
if (mousePressed){
 audioElement.setAttribute("159669_lolamadeus_watermelon-squelch4.wav");
audioElement.play();
 
   }
}



