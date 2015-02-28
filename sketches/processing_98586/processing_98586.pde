
/* @pjs font="UniversLTStd-UltraCn.otf"; */
PImage img1;
PImage img2;
PImage img3;
PImage img4;
int myState = 0;
PFont myFont ;
int myCtr = 10*24 ;

void setup() {
  size (1920, 1080);
  frameRate (24);
  myFont = createFont("UniversLTStd-UltraCn.otf");
  //myCrt = 5*frameRate ;
  img1 = loadImage("ANIMAL.png");
  img2 = loadImage("ICECREAM.png");
  img3 = loadImage("LEARN.png");
  img4 = loadImage("RECYCLE.png");
}

void draw() {
  
  switch(myState) {
    
    case 0:
    background (0) ;
    fill(255) ;
    textFont(myFont, 225) ;
    textAlign(CENTER,3*height/7);
    text ("We surveyed 100 people", width/2, 3*height/10);
    textAlign(CENTER);
    text ("the top answers",width/2, 5*height/10);
    textAlign(CENTER);
    text ("are on the board",width/2, 7*height/10);
    
    
    myCtr-- ;
    if (myCtr < 0) {
    myState = 1 ;
    myCtr = 30*24 ;
  }
  
    break ;
    
    case 1:
    image(img1, 0, 0);
    
    myCtr-- ;
    if (myCtr < 0) {
    myState = 2 ;
    myCtr = 30*24 ;
  }
   break ;
    
    case 2:
    image(img2, 0, 0);
    
    myCtr-- ;
    if (myCtr < 0) {
    myState = 3 ;
    myCtr = 30*24 ;
  }
    break ;
    
    case 3:
    image(img3, 0, 0);
    
    myCtr-- ;
    if (myCtr < 0) {
    myState = 4 ;
    myCtr = 30*24 ;
  } 
    break ;
    
    case 4:
    image(img4, 0, 0);
    
    myCtr-- ;
    if (myCtr < 0) {
    myState = 0 ;
    myCtr = 10*24 ;
  }   
    
  }
  
}


