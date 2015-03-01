
int IMGHEIGHT;
int IMGWIDTH;
int CANVASHEIGHT;
int CANVASWIDTH;
Unit[] j = new Unit[4];
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Object parent;
void setup() 
{

  parent=this;
  IMGHEIGHT=300;
  IMGWIDTH=300;

  frameRate(10);
  CANVASHEIGHT=int(2*IMGHEIGHT);
  CANVASWIDTH=int(2*IMGWIDTH);
  size(600, 600);
  background(0, 0, 0);
}
void draw()
{


  if (random(1000)<100) { 
    filter(BLUR);
  };
  if (random(1000)<100) { 
    filter(ERODE);
  };
  if (random(1000)<100) { 
    filter(DILATE);
  };
  for (int i=0;i<j.length;i++) {
    if (j[i] != null) {
      if ( j[i].draw()) {
        j[i].player.pause();
        j[i].player.close();
        j[i].minim.stop();
        j[i]=null;
      }
    }
    else {

      j[i]=new Unit(CANVASHEIGHT, CANVASWIDTH, IMGHEIGHT, IMGWIDTH);
    }
  }
}



void keyPressed()
{
  if ( key == 's' ) save(str(millis())+".jpg");
  if ( key == 'r' ) setup();
}

class Unit {
  Minim minim;
  AudioPlayer player;
  int S=14;

  int j;
  int x;
  int y;
  int o;
  int r;
  int g;
  int b;
  int h;
  int w;
  int dx;
  int dy;
  float ds;
  float dt;
  int ch;
  int cw;
  boolean circ;
  public Unit(int acHeight, int acWidth, int aiHeight, int aiWidth) {

    float rd;
    rd=random(.5, 1);

    
    w=int(rd*aiWidth);
    h=w;
    x=int(random(acWidth));

    y=int(random(acHeight));
    cw=acWidth;
    ch=acHeight;
 

    dx=int(random(-1, 2));
    dy=int(random(-1, 2));
    ds=random(.9, 1.1);
   
    o=16;
    dt=1;
    minim = new Minim(parent);
    j=int(random(S)+1);

    player = minim.loadFile(j+".mp3");

    player.setGain(map(h, 0, 1.5*ch, -40, 0));


    player.setPan((x-.5*acWidth)/(.5*acWidth));
    player.loop();
    g=int(random(j*20)+15);
    r=int(random(j*10)+45);
    b=int(random(j*10)+45);
    circ=false;
    if (j<11) {
      circ=true;
    }
  }

  public boolean draw() {

    boolean done;
    done=false;
    if (random(100)>60) {
      x=x+dx;
      y=y+dy;
    }
    h=int(h*ds);
    w=int(w*ds);
    o=int(o*dt);


    fill(r, g, b, o);
    if (circ) {
      stroke(0, 0, 0, 255);
      ellipse (x, y, w, h);
      
    }
    else {
      stroke(255, 255, 255, 255);
      rect(x-w/2, y-h/2, w, h);
    }
    player.setPan((x-.5*cw)/(.5*cw));

    player.setGain(map(h, 0, 1.5*ch, -40, 0));

    if (random(20)>17) {
      dx=int(random(-1, 2));
      dy=int(random(-1, 2));
      ds=random(.9, 1.1);
    }
    if (random(100)<2) {
      player.rewind();
    }
    if (random(100)<2) {
      player.skip(int(random(player.length())));
    }
    if (random(100)<2) {
      player.pause();
    }
    if (random(100)<2) {
      player.play();
    }
    if (random(100)<2) {
      player.play(int(random(player.length())));
    }
    if (h>ch||h<2) {
      done=true;
    }
    return done;
  }
}


