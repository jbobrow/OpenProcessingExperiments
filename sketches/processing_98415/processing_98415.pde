
//variables
float posX, posY, velX, velY, velB, velE;
float colorB,color1,color2,color3;
float posXb, posYb, posYc;
float RbutX, RbutY;
float posB;
float exp, act1,act2;
float diana;
int i;
 
var audioElement = document.createElement("audio");
 
  
PImage FondoCielo;
PImage Avion;
PImage paraca;
  
  
void setup(){
size(800,700);
FondoCielo=loadImage("http://www.filmscan.co.nz/samples/sky.jpg");
Avion=loadImage("http://tuxpaint.org/stamps/stamps/vehicles/flight/planes/747.png");
paraca=loadImage("http://wiki.desert-operations.com/es_new/images/thumb/e/eb/Airborne.png/180px-Airborne.png");
imageMode(CENTER);
//valores variables
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 1;
  velB = 4;
  act1=0;
  act2=act1-10;
 
}
  
void draw(){
  //Posición bomba
  
  posXb = mouseX;
  posYb = posYb+velB;
  

 //fondo
  image(FondoCielo,width/2,height/2);
   
//paraca
  
  image(paraca,posX,posYb);


//avion
  image(Avion, mouseX, mouseY-20);
 
  }
  

     
 
 
  
void mousePressed(){
 audioElement.setAttribute("src","paracass.mp3");
 audioElement.play();

 
 if (posX == mouseX) {
    posX = mouseX;
  } else {
    posX = mouseX;
  }
  if (posYb == mouseY) {
    posYb = mouseY;
  } else {
    posYb = mouseY;
  }
 
   
}



