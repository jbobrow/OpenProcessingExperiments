
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;

SineWave sine;

float q = 0;
float a = mouseX + q;
float b = mouseY;
float chx= 0;
float chy = 0;
float x1 = 100;
float y1 = 0;
float x2 = 100;
float y2 = 100;
float ch2 =0;
float dir2 = 0;
float  m = 0;

int dir = 1;

int dragging = 0;

void setup() {
  size (700, 400);
  minim = new Minim(this); //minim constructer method

  out = minim.getLineOut(Minim.MONO, 512); //set up output buffer
  
  SineWave sine = new SineWave(440, 0.5, out.sampleRate());

  // add waves to out-buffer
  out.addSignal(sine);
  
  smooth();
}



void draw () {


  background (0);
  fill (255, 80);
  stroke (255, 100);
  strokeWeight (15);
  
  bezier (x1, y1, chx, chy, ch2, ch2, x2, y2 );
 // int[] dots = { x1, y1, chx, chy, ch2, x2, y2 }
  
  SineWave sine = new SineWave(440, 0.5, out.sampleRate());
  
  stroke(255);
  strokeWeight (1);
  line (chx, ch2, x2, y2);




  ch2 = ch2 +(2*dir2);

  if (ch2 > width) {
    dir2 = -1;
  }
  else if (ch2 < 0) {
    dir2 = 1;
  }

  x1 = x1 +(2*dir);

  if (x1 > width) {
    dir = -1;
  } 
  else if (x1 < 0) {
    dir = 0;
  }
  
  if ( x1 > width-50) {
    
    y1 = y1 + (2*dir2);
    
      if (y1 > height){
       dir = 1; 
      }
  }


  y2 = y2 +(2*dir2);

  if (y1 > height) {
    dir2 = -1;
  } 
  else if (y1 < 0) {
    dir2 = 1;
  }

  if (mousePressed) {
    if (dist (chx, chy, mouseX, mouseY) <1000) {
      dragging = 1;
    }
  }

  if (dragging == 1) {
  chx = mouseX;
  chy = mouseY;
  ch2 = mouseY;
  }
    
  ellipse (chx, chy, 10, 10);
  
  
  if ( mouseX > 700/*width*/){
    
    chx = mouseY;
    
  }
  
  if (mouseY > 400/*height*/) {
     if (y2 < 400){
       y1 = y1 * y1;
       x1 = x1 - x1;
       y2 = y2 +(4*dir2);
      }
        if ( mouseX <  0 ){
        strokeWeight(m=5);
  }

  }
}


void mouseReleased() {
  dragging = 0;
}

void stop() {

  out.close();
  minim.stop(); //nice cleanup
  super.stop();
}



