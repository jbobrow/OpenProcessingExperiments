
/* @pjs preload="hopkinshead.png, dalamb.png"; */

ArrayList myLambs ;
PVector hanPos ;
int deathCounter = 0 ; 
int myState = 0 ; 
PImage head ;


void setup() {
  size(1000, 750) ;
  
 hanPos = new PVector(mouseX, mouseY) ;
 head = loadImage("hopkinshead.png") ;
 
 textSize(100) ;
 

  myLambs = new ArrayList() ;  

  for (int i = 0 ; i < 20; i++) {
    myLambs.add(new Lamb()) ;   
  }
}


void draw() {
  
  switch(myState) {
    
    case 0: 
    background(100) ; 
    text("The time has come...", 50, 300) ; 
    text("...to silence the lambs", 0, 400) ;
    text("-Click Mouse-", 50, 600) ;
    textSize(150) ;
    break ; 
    
    
  case 1:

  background(#000000) ; 
  for (int i = 0 ; i < myLambs.size() ; i++) {
    Lamb lamb = (Lamb) myLambs.get(i) ;
    lamb.display() ;
    lamb.drive() ;
 
    float d = (lamb.loc).dist(hanPos) ;
    
    if (d < 50) {
      println("GOOD! YES! GOOD!" ) ; 
      lamb.alive = false ;
       
    }
    
  }
  
  
  
   for (int i = 0 ; i < myLambs.size() ; i++) {
    Lamb lamb = (Lamb) myLambs.get(i) ;
    
    if (lamb.alive == false){
      myLambs.remove(i) ;
      deathCounter++ ; 
    }
    
   } 
  
  if (myLambs.size() == 0) {
    myState = 2 ;
  }
  
  hanPos.x = mouseX ;
  hanPos.y = mouseY ;
  
  loadImage("hopkinshead.png") ;  
  image(head, hanPos.x, hanPos.y) ; 
  
  fill(255, 0, 0) ; 
  textSize(200) ; 
  text(deathCounter, 500, 375) ;
  break ; 
  
  
  case 2:
  background(#000000) ; 
  text("Oh, do come again...", 50, 300) ;
  textSize(150) ;
  break ; 
  
  }
  
} 


void mousePressed() {
  if (myState == 0) {
    myState = 1 ; 
  }
  
  if (myState == 2) {
   for (int i = 0 ; i < 50; i++) {
    myLambs.add(new Lamb()) ;   
  }
    
    myState = 0 ;
  }
  
}



class Lamb {
  
  // attributes
  PVector loc ; 
  PVector vel ;
  boolean alive ;
  PImage lamb ;

  
  // constructor
  Lamb() {
    loc = new PVector(random(width), random(height)) ;
    vel = new PVector(random(1,5), 0) ;
    lamb = loadImage("dalamb.png") ;
    alive = true ; 
  }
  
  
  // methods
  void display() {
    image(lamb, loc.x, loc.y) ;
  }
  
  void drive() {
    loc.add(vel) ;
    
    if (loc.x > width) {
      loc.x = 0 ;
    }
    
  }
  
  
}


