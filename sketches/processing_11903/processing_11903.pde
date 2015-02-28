
int IMGHEIGHT;
int IMGWIDTH;
int CANVASHEIGHT;
int CANVASWIDTH;
Image[] j = new Image[6];
import ddf.minim.signals.*;
import ddf.minim.*;





 Minim minim;
 AudioOutput out;
SineWave[] sound=new SineWave[6];

void setup() 
{
  minim = new Minim(this);
 
  out = minim.getLineOut(Minim.STEREO, 8192);


  IMGHEIGHT=600;
  IMGWIDTH=600;

  frameRate(12);
  CANVASHEIGHT=450;
   CANVASWIDTH=800;
  size(CANVASWIDTH,CANVASHEIGHT);
  background(0,0,0);

}
void draw()
{
 float freq;
 float amp;
 float pan;
   if (random(1000)<50){ filter(ERODE);};
    if (random(1000)<50){ filter(BLUR);};
    if (random(1000)<25){ filter(DILATE);};
    for(int i=0;i<j.length;i++){
      if(j[i] != null){
        if(sound[i] == null){
          sound[i] = new SineWave(0,1, out.sampleRate());
          sound[i].portamento(10);
          
          out.addSignal(sound[i]);
        }
            freq=map(j[i].y,0,CANVASHEIGHT,220,1100);
            amp=map(j[i].o*j[i].h*j[i].w,0,30*CANVASHEIGHT*CANVASWIDTH,0,.5);
            pan=map(j[i].x,0,CANVASWIDTH,-1,1);
            sound[i].setFreq(freq);
            sound[i].setAmp(amp);
            sound[i].setPanNoGlide(pan);
            if( j[i].draw()){
              j[i]=null;

                
 
            }
      }
      else{
 
          j[i]=new Image(CANVASHEIGHT,CANVASWIDTH,IMGHEIGHT,IMGWIDTH);

        
      }
    }

 
     
 }




  
 
  

 void keyPressed()
{
 // if ( key == 's' ) save(str(millis())+".jpg");
 //   if ( key == 'r' ) setup();
}

class Image{
   
  int N=9;
  PImage i1;

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
  
  public Image(int acHeight, int acWidth,int aiHeight, int aiWidth){
         
    String f=str(int(random(N))+1);
    float rd;
    rd=random(.3,.7);

    i1=loadImage("h"+f+".jpg");
     
     h=int(rd*aiHeight);
    w=int(rd*aiWidth);
    x=int(random(acWidth));
    
    y=int(random(acHeight));
    cw=acWidth;
    ch=acHeight;
    o=int(random(10,20));


   
    r=int(random(0,255));
    g=int(random(0,255));
    b=int(random(0,255));
   

    dx=int(random(-1,2));
    dy=int(random(-1,2));
    ds=random(.99,1.01);
    dt=random(.99, 1.01);
  }
  
  public boolean draw(){
  
  boolean done;
  done=false;
if (random(100)>60){
  x=x+dx;
  y=y+dy;
}
  h=int(h*ds);
  w=int(w*ds);
  o=int(o*dt);
  tint(r,g,b,o);

  image(i1,x,y,w,h);
  
  
  if(random(20)>17){
    dx=int(random(-1,2));
    dy=int(random(-1,2));
      ds=random(.95,1.05);
  }
  if (random(100)>96){
    done=true;
  }
    return done;
  }
  
  
}



