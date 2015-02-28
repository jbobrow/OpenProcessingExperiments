
PImage bowie1;
PImage bowie2;
PImage bowie3;
PImage bowie4;
PFont p;

import ddf.minim.*;
 
Minim minim;
AudioSample kick;

 
 
void setup(){
  size (700,700);
 
  smooth();
  stroke(255);
  noLoop();
   
 
 
 bowie1 = loadImage("bowie1.jpg");
  bowie2 = loadImage("bowie2.jpg");
  bowie3 = loadImage("bowie3.jpg");
  bowie4 = loadImage ("bowie4.jpg");
  minim =new Minim (this);

  kick = minim.loadSample("bowie.mp3", 2048);

 
}
 
void draw(){
  background(255);
   
  fill(245,121,121);

 
 
  for (int i=0; i<2; i++) {
    float r = random(0, 100);
    pushMatrix();
    if(r<30){
      float x = random(bowie1.width/2, width - bowie1.width/2);
      float y= random(bowie1.height/2, height - bowie1.height/2);
      translate(x, y);
      float angle = random (-90, 90);
      rotate(radians(angle));
      image(bowie1, -bowie1.width/2, -bowie1.height/2);
 
 
    }else if(r<60){
      float c = random(bowie2.width/2, width - bowie2.width/2);
      float d= random(bowie2.height/2, height - bowie2.height/2);
      translate(c, d);
      float angle = random (-90, 90);
      rotate(radians(angle));
      image(bowie2, -bowie2.width/2, -bowie2.height/2);
       
 
    }else{
      float a = random(bowie3.width/2, width - (bowie3.width/2));
      float b= random(bowie3.height/2, height - bowie3.height/2);
      translate(a, b);
      float angle = random (-90, 90);
      rotate(radians(angle));
      image(bowie3, -bowie3.width/2, -bowie3.height/2);
      
 
       
       
       
       
    }
    popMatrix();
  }
 
}
 
 
void mousePressed(){
  redraw ();
}
void keyPressed()
{
  if ( key == 'B' ) kick.trigger();
}
 
void stop()
{
  
  kick.close();
  minim.stop();
   
  super.stop();
 
}

 
 
  


