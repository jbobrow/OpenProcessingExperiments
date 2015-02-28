
int myState = 0 ;
PImage Jason ;
PImage Joe ;
PImage merchguy ;
PImage Tim ;
 
 
void setup() {
  size (500, 500) ;
  Jason = loadImage("Jason.jpg") ;
  Joe = loadImage("Joe.jpg") ;
  merchguy = loadImage("merchguy.jpg") ;
  Tim = loadImage("Tim.jpg") ;
}
 
 
void draw() {
  textAlign(CENTER, CENTER) ;
    switch(myState) {
     case 0:
     background(255, 0, 0) ;
     text("A Very Metal Slideshow!", width/2, height/2) ;
     textSize(35) ;
     text("Click HERE!!", 300, 420) ;
     fill(#211414);
     break ;
    
     case 1:
     background(Joe) ;
     break ;
      
     case 2:
     background(Jason) ;
     break ; 
      
     case 3:
     background(Tim) ;
     break ;
      
     case 4:
     background(merchguy) ;
     break ;
  }   
}
 
void mousePressed() {
  myState = myState + 1 ;
  if (myState > 4) {
    myState = 0 ;
  } 
} 



