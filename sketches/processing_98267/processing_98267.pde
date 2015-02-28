
var audioElement = document.createElement("audio");
 
PImage foto;
PImage foto2;
void setup(){
  size(500,500);
  background(250);
  foto=loadImage("happy.gif");
 foto2=loadImage("psychedelic.jpg");
 
}
 
 
void draw(){

 image(foto2, 0,0,width,height);
  image(foto, mouseX-100,mouseY-100);
  
if (mousePressed){
   
audioElement.setAttribute("src", "sweep.mp3");
  
  audioElement.play();
  

}
}



