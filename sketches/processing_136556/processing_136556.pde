
/* @pjs preload="thinkin.jpg, simplicity.jpg, complexity1.jpg, mirrorview1.jpg, dabuddha.jpg" ; */

int myState = 0 ;
int counter = 0 ;
PImage thinkin ;
PImage simplicity ;
PImage complexity1 ;
PImage mirrorview1 ;
PImage dabuddha ;

void setup () {
  size(500, 500) ;
  frameRate(48) ;
  thinkin = loadImage("thinkin.jpg") ;
  simplicity = loadImage("simplicity.jpg") ;
  complexity1 = loadImage("complexity1.jpg") ;
  mirrorview1 = loadImage("mirrorview1.jpg") ;
  dabuddha = loadImage ("dabuddha.jpg") ;

}

void draw() {

  background(100) ;
  println(myState) ;

  counter = counter + 1 ;
  if (counter > 2*frameRate) {
   myState = myState + 1 ;
   if (myState > 5) {
    myState = 0 ;
   }
  counter = 0 ;
  }


 switch(myState) {

  case 0:
  image(thinkin, 0, 0) ;
  text("Have you ever just sat down and thought to yourself...", 40, 40) ;
  break;

  case 1:
  image(simplicity, 0, 0) ;
  text("...simplicity isn't really a bad thing.", 50, 50) ;
  break ;

  case 2:
  image(complexity1, 0, 0) ;
  text("Aparently the makers of this watch don't share that Philosophy.", 10, 10) ;
  break ;

  case 3:
  image(mirrorview1, 0, 0) ;
  text("There is no sense in convoluding what should be a clear cut process.", 70, 70) ;
  break ;
  
  case 4:
  image(dabuddha, 0, 0) ;
  text("So don't be afraid to take your time.", 10, 10) ;
  break ;
  
  case 5:
  background(0) ;
  fill(#FFFFFF) ;
  text("Unless you're working on this project and it's 3:22AM on the day that it's due.", 10, 250) ;
  break ;
 }
}




