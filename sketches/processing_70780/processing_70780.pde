

import ddf.minim.*; 

Minim girl ;

AudioPlayer song ;

int renk = 100 ;
int x ;
int y ;

void setup () {
  
  size (600,600) ;
  colorMode (HSB,100) ;
  background(100) ;
  smooth ();
  noStroke();
  noCursor();
  // Construction of the minim object 
  girl = new Minim (this) ;
  
  // Load the Audio File 
  song = girl.loadFile ("girl.mp3", 512) ;
  
  // Play the file as a loop
  song.loop () ;
  
}


void draw () {
  
  if (renk < 100) {
    renk = renk +1 ;
  }
  else {
    renk = 0 ;
  }
  
  for (int i = 0 ; i < song.bufferSize () - 1 ; i++) {
    float x = random(0,600);
    float y = random (0,600) ;

    if (i == 0) {
    ellipse(x,y,song.left.get(i)*400,song.right.get(i)*400);
    }
    
    if (song.left.get(i) > 0.7) { background (0) ; // changes the bg if the pitch is low
   
    }
   // else {
     // background (0,0,0,0) ;
    //}
  
  }
  
  noStroke() ;
  fill (renk,100,100) ;
  
}

void keyPressed () {
   if (key=='s') {
     saveFrame("exports/img-####.tiff") ; // to save the frames you want
     
   }
}

