
/* @pjs font = "WendyOne-Regular.ttf" ; */


int myState = 0 ;
PFont myFont ;

PImage graph ;

PImage[] images = new PImage[104];


int myCtr ;
int myImageCtr = 0 ; 

void setup() {
  size(1920, 1080) ;

  graph = loadImage("graph.png") ;
  frameRate(24) ;
  myFont = createFont ("WendyOne-Regular.ttf") ;

  myCtr = 2*24 ; 

  for ( int i = 0; i< images.length; i++ )
  {
    images[i] = loadImage( i + ".gif" );   // make sure images "0.jpg" to "11.jpg" exist
  }
}

void draw() {


  switch(myState) {

  case 0:
  //  background (#DB2828) ;

   image(images[int(myImageCtr/3)], 0, 0, width, height) ;  // change the denominator - make bigger for slower
   myImageCtr++ ; 
    if (myImageCtr > 104) {
      myImageCtr = 0 ; 
    }
    image(graph, 500, 175, 1000, 750) ;
    textFont(myFont, 80) ;
    textAlign(RIGHT) ;
    text("The graph shows various pollution levels in Peoria", 1925, 1000) ;  





    break ;

  default:
    break ;
  }
}



