
PImage gate ;
PImage minibike ;
PImage scooter ;
PImage finishedgate ;
PImage timeline ;
PImage background2 ;
PFont  LuzSans ;
PFont Kristen ;

int myState = 0 ;
int x = 600 ;
int y = 0 ;
int y1 = 0 ;

void setup() {
  size(600, 600) ;
  smooth() ;


// data folder resources
gate = loadImage ("gate.jpg") ;
minibike = loadImage ("minibike.jpg") ;
scooter = loadImage ("scooter.jpg") ;
finishedgate = loadImage ("gate_finished.jpg") ;
timeline = loadImage ("timeline.jpg") ;
background2 = loadImage ("sunset.jpg") ;
LuzSans = loadFont ("LuzSans-Book-50.vlw") ;
Kristen = loadFont ("KristenITC-Regular-50.vlw") ;

}
void draw() {
  background(100) ;

  
  switch(myState) {
    case 0:
    // textFont(fontNickname, 200) ; // font nickname needed
    image (gate, 75, 100, 280, 210) ;
    fill (#FAFCFC) ;
    textFont (LuzSans, 40) ;
    text ("You've got to start somewhere...", 10, 60) ;
    textFont (LuzSans, 25) ;
    text ("please click mouse", 360, 540) ;
    text ("to scroll through" , 390, 570) ;
    break ;
    
    case 1:
    image (minibike, 300, 300, 270, 210) ;
    fill (#5FC8FF) ;
    textFont (Kristen, 40) ; 
    text("I'd rather be doing this...", 65, 270) ;
    break ;
    
    case 2:
    image (scooter, 300, 100, 250, 200) ;
    textFont (LuzSans, 40) ; 
    fill (#150101) ;
    text("All work and a little play...", 30, 355) ;
    break ;
    
    case 3:
    image (finishedgate, 80, 100, 460, 400) ;
    textFont (LuzSans, 40) ;
    fill (#FFF708) ;
    text("...can make for a", 10, 50) ;
    text ("very productive day", 140, 560) ;
    break ;
   
    case 4:
      
  // variable motor controls!
  x = x - 2 ;
  if (x < -555) {
    x = 600 ;
  }
  y = y + 1 ;
  if (y > 600) {
    y = 0 ;
  }
  //!
    
    fill (#2CD313) ;
    image (timeline, x, 225, 550, 170) ;    
    textFont (Kristen, 50) ;
    text("...which can still be fun!", 10, y) ;
    break ;
    
    case 5:
    image (background2, 0, 0, 600, 600) ;  
    y1 = y1 + 1 ;
    if (y1 > 600) {
      y1 = 0 ;
    }
    
    fill (#FFED5F) ;
    textFont (Kristen, 50) ;
    text ("till the sun bids farewell", 10, y1) ; 
    break ; 
 
 
 }

}

void mousePressed() {
 // println("clicked mouse!") ;
 myState = myState + 1 ;
 
 // NEED IF STATEMENT HERE
 if(myState > 5) {
   myState = 0 ;
  }
 
}




