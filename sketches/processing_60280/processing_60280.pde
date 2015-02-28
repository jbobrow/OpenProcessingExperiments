
//CONFETTI
//You had a party with a lot of confetti woooooooooooooooooooooooooooooooo
//But you have made a mess.
//Good job!!


import gifAnimation.*;
import processing.video.*;
Starz [] stars;
PImage star;
PImage[] animation;
Gif loopingGif;
import processing.video.*;
Capture myCapture;

void setup(){
 size(480,350);
 frameRate(500);
 //Camera
 myCapture = new Capture(this, width, height, 30);
 //Loading GIF
 loopingGif = new Gif(this, "star.gif");
 loopingGif.loop();
 //Class
 stars = new Starz[250];
  for(int i=0;i<stars.length; i++){
    stars[i] = new Starz(-20,-20);
     stars[i].move();
     stars[i].display();
 }
}

void draw(){
 photoFilter();
 //Class
 for(int i=0; i<stars.length;i++){
 stars[i].move();
 stars[i].display();
 } 
}

class Starz{
  //Getting those stars in there
  float x,y,speedx,speedy;
  Starz(float xpos,float ypos){
    x = xpos*5;
    y = ypos/10;
    speedx = random(5);
    speedy = random(10);
  }
  //Methods
  void move(){
    x+=speedx;
    y+=speedy;
  }
  //Get those stars!
  void display(){
   if (mousePressed == true){
    tint(random(400),random(400),random(302));
   }
   image(loopingGif, x, y);
 }
}


void photoFilter(){
  //Making the camera do crazy things
  myCapture.loadPixels();
 loadPixels();
 int camSize = myCapture.width * myCapture.height;
   for(int i=0;i <camSize;i++){
   color cp = myCapture.pixels[i];
   float b = brightness(cp);
   float h=hue(cp);
   float s=saturation(cp);
   //Change stuff when you click the mouse whoa
   if (mousePressed == true){
     h=250;
     } else {
       h=100;
     } 
   if (mousePressed == true){
     s=100;
   } else {
     s=500;
   } 
     
  pixels[i] = color(h,s,b);
   }
 
myCapture.updatePixels();
updatePixels();
}



void captureEvent(Capture myCapture) {
  myCapture.read();
}

