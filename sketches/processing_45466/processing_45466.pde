
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float SMOOTHING = 0.15;
float vol = 0;
float trans;
int direction = 1;
float signal;
PImage littlePeople;
PImage bg;


void setup()
{
  size(1280,1000);
  ellipseMode (CENTER);
  imageMode (CENTER);
  noStroke();
  smooth();
  
  frameRate(30);

  minim = new Minim(this);
  audio = minim.loadFile("mum.mp3");
  audio.loop(); 
  trans= 210; 
  littlePeople = loadImage ("lp.png");
  bg = loadImage("hokusai_wallcoo.jpg");
}

void draw()
{
 
   if (signal > bg.height-1 || signal < 0) { 
    direction = direction * -1; 
  }  if (signal > bg.width*bg.height-1 || signal < 0) { 
    direction = direction * -1; 
  }

  if (mousePressed) {
    int mx = constrain(mouseX, 0, bg.width-1);
    int my = constrain(mouseY, 0, bg.height-1);
    signal = my*bg.width + mx;
  } else {
    signal += 0.33*direction;
  }
     
int sx = int(signal) % bg.width;
int sy = int(signal) / bg.width;

if (keyPressed) {
    set(0, 0, bg);  
    point(sx, sy);
    rect(sx - 5, sy - 5, 10, 10);
  } else {
    color c = bg.get(sx, sy);
    background(c);
  }
   //ellipse
  fill(119,187,238, trans);
  vol = lerp(vol, audio.mix.level(), SMOOTHING);
  ellipse(width/2, height, width, height-vol*500);
  
  
  //little people
  image(littlePeople,width/2,(height-vol*500)-height/2-30,150,150);
  
  
  
  

 
}




