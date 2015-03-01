
//http://ccmixter.org/ghostly/people/cwillits
//https://www.freesound.org/people/Incarnadine/packs/801/
int IMGHEIGHT;
int IMGWIDTH;
int CANVASHEIGHT;
int CANVASWIDTH;
Unit[] j = new Unit[3];
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Object parent;
 /*int[] S0={1,7,4,5,14};
 String[] dir0={"vocals","misc","drums","horn","chimes"};
 int[] c0={color(255,0,0),color(0,255,0),color(0,0,255), color(255,255,0),color(255,0,255)};
  int[] S={1,7,4,5,14};
  String[] dir={"vocals","misc","drums","horn","chimes"};
  int[] c={color(255,0,0),color(0,255,0),color(0,0,255), color(255,255,0),color(255,0,255)};

*/
int[] S0={10};
 String[] dir0={"chimes"};
 int[] c0={color(255,255,255)};
  int[] S={10};
  String[] dir={"chimes"};
  int[] c={color(255,255,255)};


void setup() 
{

  parent=this;
  IMGHEIGHT=300;
  IMGWIDTH=300;

  frameRate(10);
  CANVASHEIGHT=int(720);
  CANVASWIDTH=int(720);
  size(720,720);
  background(0,0,0);
}
void draw()
{
  int n;

  if (random(1000)<3000) { 
  //filter(BLUR);
  };
  if (random(1000)<300) { 
   // filter(ERODE);
  };
  if (random(1000)<300) { 
   //filter(DILATE);
  };

  for (int i=0;i<j.length;i++) {
    if (random(1000)<10) { 
      n=int(random(S0.length));
      S[i%S0.length]=S0[n];
      dir[i%S0.length]=dir0[n];
       c[i%S0.length]=c0[n];
    };
    if (j[i] != null) {
      if ( j[i].draw()) {
        j[i].player.pause();
        j[i].player.close();
        j[i].minim.stop();
        j[i]=null;
      }
    }
    else {

      j[i]=new Unit(i%S0.length,CANVASHEIGHT, CANVASWIDTH, IMGHEIGHT, IMGWIDTH);
    }
  }
  
  if (random(3000)<-1){
    for(int i=0;i<j.length;i++){
        if (j[i] != null) {
      
        j[i].player.pause();
        j[i].player.close();
        j[i].minim.stop();
        j[i]=null;
      
        }
    }
    stop();
    exit();
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
 
  int i;
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
  int col;
  public Unit(int index, int acHeight, int acWidth, int aiHeight, int aiWidth) {

    float rd;
    rd=random(.5, 1);
    i=index;
    j=int(random(S[index])+1);
    
    w=int(rd*aiWidth/1.5);
    h=w;
    x=int(random(acWidth/2))+256;

    y=int(random(acHeight/2))+256;
    cw=acWidth;
    ch=acHeight;
 

    dx=int(random(-1, 2));
    dy=int(random(-1, 2));
    ds=random(.9, 1.1);
     ds=random(.99, 1.01);
   
    o=8;
    dt=1;
    minim = new Minim(parent);
    
    col=c[index];
    

     player = minim.loadFile(dir[index] +"/" +j+".mp3");
    
    player.setGain(map(h, 0, 1.5*ch, -15, 0));


   // player.setPan((x-.5*acWidth)/(.5*acWidth));
    player.loop();
    
   g=int(random(128,255));
    r=int(random(128,255));
    b=int(random(128,255));
   g=int((128+j%5*4));
   r=int((128+j%5*4));
   b=int((128+j%5*4));
   
   if (j%5==1){
     r=0;g=0;b=128;
   }
     if (j%5==2){
     r=0;g=128;b=0;
   }
     if (j%5==3){
     r=0;g=128;b=128;
   }
     if (j%5==4){
     r=128;g=0;b=0;
   }
     if (j%5==0){
     r=64;g=0;b=128;
   }
  
    circ=false;
    if (j<6) {
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


   fill(color(r,g,b), o);
    if (circ) {
      stroke(0,0,0,64);
      stroke(255-r,255-g,255-b,64);
      ellipse (x, y, w, h);
            ellipse (cw-x, y, w, h);
      ellipse (x, ch-y, w, h);
       ellipse (cw-x, ch-y, w, h);
        ellipse ( y, x,w, h);
            ellipse ( y,cw-x, w, h);
      ellipse ( ch-y, x,w, h);
       ellipse (ch-y,cw-x,  w, h);
    }
    else {
       stroke(255, 255, 255, 64);
  stroke(255-r,255,g-255-b,64);
      rect(x-w/2, y-h/2, w, h);
            rect(cw-x-w/2, y-h/2, w, h);
      rect(x-w/2, ch-y-h/2, w, h);
       rect(cw-x-w/2,ch-y-h/2, w, h);
        rect( y-h/2, x-w/2, w, h);
            rect(y-h/2, cw-x-w/2,  w, h);
      rect(ch-y-h/2,x-w/2,  w, h);
       rect(ch-y-h/2, cw-x-w/2,w, h);
    }
    //player.setPan((x-.5*cw)/(.5*cw));

    player.setGain(map(h, 0, 1.5*ch, -15, 0));
    

    if (random(20)>17) {
      dx=int(random(-1, 2));
      dy=int(random(-1, 2));
      ds=random(.9, 1.1);
    }
  
    if (random(1000)<20) {
     player.rewind();
    }
    
     if (random(1000)<20) {
      player.skip(int(random(player.length())));
    }
    if (random(1000)<20) {
      player.pause();
    }
    if (random(1000)<20) {
      player.play();
    }
       if (random(1000)<20) {
      player.play(int(random(player.length())));
    }
 
   
    
   
    

    if (h>ch*.85||h<2) {
      done=true;
    }
    return done;
  }
  

}


