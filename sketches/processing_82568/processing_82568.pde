

import processing.video.* ;

Movie catFilm ;


int x ;
int y ;
int rayon = 200 ;
float angle = 10 ;

void setup() {
 
  size (600,600,P2D);
  background(0);
  

  catFilm = new Movie (this, "cat.mov");
  

  catFilm.loop() ;

  catFilm.play() ;
 
}

void draw() {
  
  angle += 0.05 ; 
  

  x = round ((width/2 - 155) + sin(angle) * rayon) ; 
  y = round ((height/2 - 130) + cos(angle) * rayon) ;
  

  image (catFilm, x, y) ;
  
}



