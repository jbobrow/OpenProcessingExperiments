
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/* @pjs preload="BackgroundDay.png"; */
/* @pjs preload="BackgroundNight.png"; */
//Declare PImage variable

PImage background1;
PImage background2;
PImage star;
PImage bow;
PImage gingerbread;
int radius = 10;
boolean starFlag = false; 
boolean bowFlag = false; 
boolean ballFlag = true;
boolean dayFlag = false;
boolean gingerbreadFlag = false;
Minim minim;
AudioSample music;

//Load an image file
void setup() {
  size(800, 600);
  background1 = loadImage("BackgroundNight.png");
  image(background1, 0, 0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  minim = new Minim(this);
  music=minim.loadSample("nightMusic.wav");
  
  
}

//Draw the image
void draw(){
  
  
}
//Draws a series of concentric circles, 
//part of the code is taken from http://processing.org/examples/radialgradient.html 
void drawGradient(float x, float y) {
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 5) % 360;
  }
}


void mousePressed(){
   if (starFlag == true){
     star = loadImage("Star.png");
     image(star, mouseX-5, mouseY-5,15,15); //-5 so that that image appeared right where the user clicked and not below (image is drawn from the top right corner)
   }
   else if (bowFlag == true){
     bow = loadImage("Bow.png");
     image(bow, mouseX-15, mouseY-15,30,30);
   } 
   
  
   else if (gingerbreadFlag == true){
     gingerbread = loadImage("GingerBreadMan.png");
     image(gingerbread, mouseX-20, mouseY-20,45,45);
   } 
   else{
   drawGradient(mouseX, mouseY);
   }
   //prevX = mouseX;
   //prevY = mouseY;
 
  
}


void keyPressed(){
  
  if(key=='1'){
    radius = 2;
  }
  if(key=='2'){
    radius = 4;
  }
  if(key=='3'){
    radius = 6;
  }
  if(key=='4'){
    radius = 8;
  }
  if(key=='5'){
    radius = 10;
  }
  if(key=='6'){
    radius = 12;
  }
  if(key=='7'){
    radius = 14;
  }
  if(key=='8'){
    radius = 16;
  }
  if(key == 'm' || key == 'M') music.trigger();
  if(key == 's' || key == 'S'){
    starFlag = true;
    ballFlag = false;
    gingerbreadFlag = false;
    bowFlag = false;
    
  }
  if(key == 'b' || key == 'B'){
    bowFlag = true;
    starFlag = false;
    gingerbreadFlag = false;
    ballFlag = false;
  }
  if(key == 'l' || key == 'L'){
    bowFlag = false;
    gingerbreadFlag = false;
    starFlag = false;
    ballFlag = true;
  }
   if(key == 'g' || key == 'G'){
    bowFlag = false;
    starFlag = false;
    ballFlag = false;
    gingerbreadFlag = true;
  }
   
  if(key == 'd' || key == 'D'){
    background2 = loadImage("BackgroundDay.png");
    dayFlag = true;
    image(background2, 0, 0);
  }
  if(key == 'n' || key == 'N'){
    background1 = loadImage("BackgroundNight.png");
    dayFlag = false;
    image(background1, 0, 0);
  }
 
  if (key == ' '){
    if (dayFlag == true){
      background2 = loadImage("BackgroundDay.png");
      image(background2, 0, 0);
    }
    else{
      background1 = loadImage("BackgroundNight.png");
      image(background1, 0, 0);
    } 
  }
  
}


