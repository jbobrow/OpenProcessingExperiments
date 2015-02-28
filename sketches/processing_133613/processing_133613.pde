
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

import ddf.minim.*;
Minim minim;
AudioPlayer s1,s2,s3,s4;

PFont f;

void setup () {
  size (500,332);
   img =loadImage("micro.jpg");
   img1 =loadImage("bastille.png");
   img2 =loadImage("lana.png");
   img3 =loadImage("florence.png");
   img4 =loadImage("killers.png");
       
   //Musica
   minim=new Minim(this);
  s1=minim.loadFile("The Killers   Mr Brightside.mp3");
  s2=minim.loadFile("Lana Del Rey   Young and Beautiful.mp3");
  s3=minim.loadFile("Bastille, No Angels.mp3");
  s4=minim.loadFile("Florence + The Machine - Dog Days Are Over .mp3");
  
  f = loadFont("KillTheLights-20.vlw");
   background( img);
}

 void draw(){
  textFont(f);
  fill(255);
  text("Lana Del Rey - Young and Beautiful",80,247);
  text("Bastille - No Angels",80,272);
  text("Florence + The Machine - Dog Days Are Over",80,297);
  text("The Killers - Mr Brightside",80,322);
  noSmooth();
  noStroke();

 }
void mousePressed() {
  if(mouseX>80 && mouseX<399 && mouseY>231 && mouseY<247) {
   s2.play();
   image (img2 ,175,30);
  s1.pause();
  s3.pause();
   s4.pause();
  }
 
if(mouseX>80 && mouseX<247 && mouseY>258 && mouseY<272) {
   s3.play();
   image (img1 ,175,30);
   s1.pause();
   s2.pause();
  s4.pause();
}
    
  if(mouseX>80 && mouseX<483 && mouseY>282 && mouseY<298) {
   s4.play();
 image (img3 ,175,30);
   s1.pause();
   s2.pause();
  s3.pause();
  }
    if(mouseX>80 && mouseX<300 && mouseY>308 && mouseY<320) {
   s1.play();
 image (img4 ,175,30);
   s4.pause();
   s2.pause();
  s3.pause();
  }
}


  


  


  
  
  
  
  



