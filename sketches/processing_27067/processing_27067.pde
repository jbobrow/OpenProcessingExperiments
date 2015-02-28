
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
int s=512, minSize = 20;
int steps = 5;
int maxSteps = 6;
color start;
color end;
 
dot mom;

void reset_sketch () {
}
  
void setup() {
  size(s,s);
  imageMode (CENTER);
  img = loadImage("face1.jpg");
  img2 = loadImage("face2.jpg");
  img3 = loadImage("face3.jpg");
  img4 = loadImage("face4.jpg");
  img5 = loadImage("face5.jpg");
  img.resize(s,s);
  smooth(); noStroke();
  mom = new dot(s/2,s/2,s,s/2,s/2,s, 0);
  
  minim = new Minim(this);
  song = minim.loadFile ("sound1.mp3");
  
}
  
void draw() {
 mom.draw();
}
  
void mouseMoved() {
  mom.interact();
}
  
class dot {
  
  boolean alife = true;
  boolean loaded = false;
  PImage myImage;
  int x0, y0, d0, x, y, d;
  float t;
  float depth;
  dot[] kids;
  
  
  
  dot(int _x0, int _y0, int _d0, int _x, int _y, int _d, float dpth) {
    depth = dpth;
    x0=_x0; y0=_y0; d0=_d0; x=_x; y=_y; d =_d;
  }

  void draw() {
    t = constrain(t + 1f/steps, 0,1);
     float xt = lerp(x0, x, t), yt = lerp(y0, y, t), dt = lerp(d0, d, t);
     
    if(!loaded){
     
      int randomRoll = (int)floor(random(0,4));
      
      if(randomRoll == 0){
        myImage = img5.get();
      }
      if(randomRoll == 1){
        myImage = img2.get();
      }
      if(randomRoll == 2){
        myImage = img3.get();
      }
      if(randomRoll == 3){
        myImage = img4.get();
      }
      
      
      myImage.resize((int)dt,(int)dt);
    }
    
    if(alife) {
        image(myImage,xt,yt);
       loaded = true;
    }
    else for(int i=0; i<4; i++) kids[i].draw();
    }
  
  void interact() {
      if(alife) { if (t==1) giveBirth(); }
      else kids[(mouseX-x<0?2:0) + (mouseY-y<0?1:0)].interact();
  }
    
  void giveBirth() {
    
   AudioPlayer sound = minim.loadFile ("sound1.mp3");
  sound.loop (3);
    if(depth < maxSteps){
      int e = d/4, f = d/2;
      kids = new dot[] {
        new dot(x,y,d,x+e,y+e,f,depth+1), new dot(x,y,d,x+e,y-e,f,depth+1),
        new dot(x,y,d,x-e,y+e,f,depth+1), new dot(x,y,d,x-e,y-e,f,depth+1)
      };
      alife = false;
    }
  }
}

void stop(){
//  song.close();
  minim.stop();
  super.stop();
}

void keyReleased()
{
 if (key=='r') setup();
}

