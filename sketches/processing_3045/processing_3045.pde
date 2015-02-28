
import processing.video.*;
Capture myCapture;
MovieMaker mm;  

final int camX=120;
final int camY=90;
final int filmLen=12;
final int dimX=camX*filmLen;
final int dimY=camY;
final int fr=24;
final  String clip="/Desktop/timecam_shot/drawing";

int i=0;
int b=0;

void setup() 
{
  size(dimX, dimY,P2D);
  frameRate(fr);
  int d=day();
  int m=month();
  int y=year();
  int h=hour();
  int mp=minute();
  int ms=second();

  println(Capture.list());
  myCapture = new Capture(this, camX, camY, fr);
  mm = new MovieMaker(this, width, height, System.getProperty("user.home")+clip+y+m+d+h+ms+ms+".mov",
                       fr, MovieMaker.ANIMATION, MovieMaker.BEST);
  tint(255,50);
println("User Home Path: "+System.getProperty("user.home"));
}

void captureEvent(Capture myCapture) {
  myCapture.read();
  myCapture.filter(BLUR,b);
  image(myCapture, i, 0);
  
  if ((frameCount % 24) == 0){
   
    if (i<dimX-camX){
      i+=camX;
    }else {
      set(-camX,0,get(0,0,camX*filmLen,camY));
      
    } 
  }
}

void keyPressed() {
    switch (key){
    case 'q': exit();break;
    case 'a': b+=1;break;
    case 'z': if(b >1) {b-=1;}break;
    }
}


void draw() {
  mm.addFrame();
}

