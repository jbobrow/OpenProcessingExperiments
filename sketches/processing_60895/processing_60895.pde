









import gifAnimation.*;
PImage G;
PImage G2;
PImage B;
int grassX1=0;
int grassX2=900;
int backgroundX1= 0;
int backgroundX2=900;

PImage[]  animation;
Gif tedGif;
boolean pause = false;

void setup(){
  size(900,395);
  frameRate(50);
 
 G=loadImage("grass.png");
  G2=loadImage("grass.png");
  B=loadImage("background.png");
  
  println("gifAnimation" + Gif.version());
  tedGif = new Gif(this, "walk_cycle.gif");
  tedGif.loop();
  tedGif= new Gif(this,"walk_cycle.gif");
  tedGif.play();
  //tedGif.ignoreRepeat();
  animation = Gif.getPImages(this, "walk_cycle.gif");
 
}
 void draw() {
   
   background(1,1/ (float) height * mouseY);
   image(B,0,1);
   image(B,backgroundX1,100);
   image(B,backgroundX2,100);
   image(tedGif, 119,height/ 2- tedGif.height/ 3);
   image(G,grassX1,320);
   image(G2,grassX2,320);
   
   backgroundX1= backgroundX1+1;
   if (backgroundX1 > +10){
     backgroundX1= 0;
   }
   
     backgroundX2=backgroundX2 -2;
     if (backgroundX2 < -2) {
       backgroundX2 = 0;
   
     }
   grassX1=grassX1-1;
 if (grassX1 > +10){
     grassX1= 0;
 }
 
 grassX2=grassX2+2;
  if (grassX2 > +31) {
   grassX2=0;
  }
 
     }
  



