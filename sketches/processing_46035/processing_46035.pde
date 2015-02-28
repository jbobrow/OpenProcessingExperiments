
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer audio;
float SMOOTHING = 0.15;
float vol = 0;
float trans;
PImage hongo2;
PImage trip;
PImage pasto;
 
void setup()
{
  size(700, 486);
  trip = loadImage ("trip.jpg");
  image (trip, 0, 0);
  ellipseMode (CENTER);
  imageMode (CENTER);
  noStroke();
  smooth();
 
  minim = new Minim(this);
  audio = minim.loadFile("plan.mp3");
  audio.loop();
  trans= 230;
  hongo2 = loadImage ("hongo2.png");
}
 
void draw() {


       
    fill(random (250,255),random (250,255),0);
  ellipse(width/2, height, 1.2*width,1.2*height);
   
  fill(165,42,42, trans);
 
 
  vol = lerp(vol, audio.mix.level(), SMOOTHING);
 
   
  ellipse(width/2, height, width, height-vol*50);
   
  image(hongo2,width/2,(height-vol*50)-height/2-30,100,100);
}


