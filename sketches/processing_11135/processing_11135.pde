
PImage img;
PImage img2;

boolean buttonLight = false;

float xl1 = 270;
float xl2 = 395;
float yl1 = 0;
float yl2 = 78;

float x1 = 400;
float x2 = 800;

float xtazza1 = 350;
float xtazza2 =390;
float ytazza1 = 415;
float ytazza2 = 460;

float xrub1 = 137;
float xrub2 = 211;
float yrub1 = 378;
float yrub2 = 450;

float xfuo1 = 510;
float xfuo2 = 567;
float yfuo1 = 418;
float yfuo2 = 451;

float xcof1 = 508;
float xcof2 = 544;
float ycof1 = 396;
float ycof2 = 413;

//carica libreria Minim
import ddf.minim.*;

AudioPlayer player;
AudioPlayer tazza;
AudioPlayer rubinetto;
AudioPlayer fuochi;
AudioPlayer coffee;
AudioPlayer light;
Minim minim;
//

void setup() {
  size(800, 533);

 minim = new Minim(this);

 player = minim.loadFile("passi donna1.mp3", 2048);
 tazza = minim.loadFile("cucc_tazza.aif" , 2048);
  rubinetto = minim.loadFile("rubinetto.aif" , 2048);
    fuochi = minim.loadFile("fuochi.aif" , 2048);
        coffee = minim.loadFile("coffee.mp3" , 2048);
        light = minim.loadFile("light.wav", 2048);
        
}


void draw() {
  img2 = loadImage("bg_dark.jpg");
  image(img2,0,0,800,533);
  
if (buttonLight) {
  img = loadImage("bg.JPG"); 
  image(img,0,0,800,533);

  
  
} else {
img2 = loadImage("bg_dark.jpg"); 
  image(img2,0,0,800,533);
}
   
}


void mousePressed() {
   if ( (mouseX > xl1) && (mouseX < xl2) && (mouseY > yl1) && (mouseY < yl2)){
  buttonLight = ! buttonLight;
    light.play();
   
}

}
    
 void keyPressed () { 
  if ( (mouseX > xtazza1) && (mouseX < xtazza2) && (mouseY > ytazza1) && (mouseY < ytazza2)){

 if (key == 'a')
{
  tazza.loop();
}

if ( key == 's')
{
    tazza.pause();
}   
  }

if ( (mouseX < x2) && (mouseX > x1)) {
 
 if (key == 'a')
{
 //missing player loop
}

if ( key == 's')
{
    player.pause();
}   
}



if ( (mouseX > xrub1) && (mouseX < xrub2) && (mouseY > yrub1) && (mouseY < yrub2)) {
 
 if (key == 'a')
{
  rubinetto.loop();
}

if ( key == 's')
{
    rubinetto.pause();
}   
}



if ( (mouseX > xfuo1) && (mouseX < xfuo2) && (mouseY > yfuo1) && (mouseY < yfuo2)) {
 
 if (key == 'a')
{
  fuochi.loop();
}

if ( key == 's')
{
    fuochi.pause();
}   
}


if ( (mouseX > xcof1) && (mouseX < xcof2) && (mouseY > ycof1) && (mouseY < ycof2)) {
 
 if (key == 'a')
{
  coffee.loop();
}

if ( key == 's')
{
    coffee.pause();
}   
}
}

  
void stop()
{
  // always close Minim audio classes when you are done with them
 
  // always stop Minim before exiting.
  minim.stop();
 
  super.stop();
}

