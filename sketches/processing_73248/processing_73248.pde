
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


import ddf.minim.*;

Minim blake ;

AudioPlayer song ;

int circle = 100 ;
int x ;
int y ;

void setup () {

  size (800, 800) ;
  colorMode (HSB,100) ;
  background(100) ;
smooth ();
 

  
  blake = new Minim (this) ;


  song = blake.loadFile ("01 Unluck.mp3") ;


  song.loop () ;
}


void draw () {




  if (circle < 100) {
    circle = circle +1 ;
  }
  else {
    circle = 0 ;
  }

  for (int i = 0 ; i < song.bufferSize () - 1 ; i++) {
    float x = random(0, 800);
    float y = random (400, 400) ;

    if (i == 0) {
      ellipse(x, y, song.left.get(i)*600, song.right.get(i)*600);
      rect(x, y, song.left.get(i)*20, song.right.get(i)*400);
    }
  }

  noStroke() ;
  fill (circle, 100,100) ;
}







