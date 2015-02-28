
var audioElement1 = document.createElement("audio");
var audioElement2 = document.createElement("audio");

PImage fruteria;
PImage poma;
  
void setup(){
  
size(400,400);
  
fruteria = loadImage("fruteria.jpg");
poma = loadImage("manzana.png");

audioElement2.setAttribute("src","supermarket.mp3");
audioElement2.play();


noCursor();
     
}
  
void draw(){

  background(0);
  
  imageMode(CENTER);
  image(fruteria,width/2,height/2);
 
  image(poma,mouseX,mouseY);


}
  
void mousePressed (){

 audioElement1.setAttribute("src","mordisco.mp3");
audioElement1.play();

   }


