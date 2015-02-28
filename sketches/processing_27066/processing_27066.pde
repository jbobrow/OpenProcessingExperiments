
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

int s=512, minSize = 20;
int steps = 5;
int maxSteps = 20;
color start;
color end;
 
dot mom;

void reset_sketch () {
}
  
void setup() {
  size(s,s);
  smooth(); noStroke();
  mom = new dot(s/2,s/2,s,s/2,s/2,s, 0);
  
  minim = new Minim(this);
  song = minim.loadFile ("boo.wav");
  
  start = color(121, 0, 0);
  end = color (0);
}
  
void draw() {
 mom.draw();
}
  
void mouseMoved() {
  mom.interact();
}
  
class dot {
  
  boolean alife = true;
  int x0, y0, d0, x, y, d;
  color c0, c;
  float t;
  float depth;
  dot[] kids;
  
  dot(int _x0, int _y0, int _d0, int _x, int _y, int _d, float dpth) {
    depth = dpth;
    x0=_x0; y0=_y0; d0=_d0; x=_x; y=_y; d =_d;
    colorMode(HSB);
    c0 = color(0,255,180+random(-10,10)); c = color(0,0,0);
    colorMode(RGB);
  }

  void draw() {
    t = constrain(t + 1f/steps, 0,1);
    if(alife) {
      float xt = lerp(x0, x, t), yt = lerp(y0, y, t), dt = lerp(d0, d, t);
      color ct = lerpColor(c, c0, depth/(maxSteps+0.0));
      fill(ct); rectMode (CENTER); rect(xt,yt,dt,dt);
    }
    else for(int i=0; i<4; i++) kids[i].draw();
    }
  
  void interact() {
      if(alife) { if (t==1) giveBirth(); }
      else kids[(mouseX-x<0?2:0) + (mouseY-y<0?1:0)].interact();
  }
    
  void giveBirth() {
    
 // AudioPlayer sound = minim.loadFile ("boo.wav");
 // sound.loop (5);
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

