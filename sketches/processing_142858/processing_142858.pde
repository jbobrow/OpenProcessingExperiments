
int myState = 0 ;
int points = 0 ;
ArrayList myBoats ; 
float fishX ;
float fishY ; 
int M = 0 ;

void setup() {
  size(500, 500) ;
  rectMode(CENTER) ;
  
  fishX = width/2 ;
  fishY = height/2 ; 

  myBoats = new ArrayList() ;  // make a new arrayList

  for (int i = 0 ; i < 20; i++) {
    myBoats.add(new Boat()) ;
   
  }
}


void draw() {
  
  switch(myState) {
    
    case 0:
    background(0);
    textSize(40) ;
     text("Welcome to Fishy Fishy", 20, 100);
      text("See How Long You Can" , 20, 200);
        text("Last in Fishy Seconds" , 40, 260);
        textSize(20) ;
        text("move with arrow keys and click mouse to continue",10,400) ;
        text("be ready to act quick!", 150, 430) ;
    break;
    
    case 1:
      background(0,0,255) ;
      
// moves my Boats
  for (int i = 0 ; i < myBoats.size() ; i++) {
    Boat Boat = (Boat) myBoats.get(i) ;
    Boat.display() ;
    Boat.drive() ;
 
    PVector fishLoca = new PVector(fishX, fishY) ;
   float d =  (Boat.loca).dist(fishLoca) ;
    //float d = (Boat.loca).dist(BoatLoca) ;
    
    if (d < 20) {
      println("BOOM!!!" ) ; 
      Boat.live = false ;
    }
    
  }
  
  
  
   for (int i = 0 ; i < myBoats.size() ; i++) {
    Boat boat = (Boat) myBoats.get(i) ;
    
    // check if Boat is alive
    if (boat.live == false){
      myBoats.remove(i) ;
      myState = 2 ;
    }
    
   } 
    
  // draw my Fishy
  fill(#DEE3AC) ;  
    rect(fishX, fishY+12,15,10) ;
    ellipse(fishX-7, fishY, 5,7) ;
    ellipse(fishX+7, fishY, 5,7) ;
  fill(#41892E) ; 
  ellipse(fishX, fishY, 15, 30) ; 
 
  fill(255);
  ellipse(fishX+5, fishY-12, 8,8);
  ellipse(fishX-5, fishY-12, 8,8);
   fill(0);
  ellipse(fishX+3, fishY-12, 3,3);
  ellipse(fishX-3, fishY-12, 3,3);
  fill(#DEE3AC) ;
  ellipse(fishX, fishY, 5,7) ;
  
  fill(255);
  text(points, width-50, 25) ;
  textSize(30);
  points = points + 1 ;
  break;
  
  case 2:
  background(0) ;
  text("Score:", 200, 300);
  text("You Lose!",200, 100) ;
  text("better luck next time", 100, 200) ;
  text(points,300,300);
  break;
  
}
}

void mousePressed() {
  
 if(myState == 2) {
  myState = 0;
 for(int i = 0 ; i <20; i++) {
    //myBoats.add(new Boat());
    points = 0 ;
  }
 }
  if(myState == 0) {
  myState = 1;
  }  
}


void keyPressed() {
//  println("key pressed = " + keyCode) ;
 
 if (keyCode == 39) {  // right
  fishX = fishX + 20 ;
 }

 if (keyCode == 37) {  // left
   fishX = fishX - 20 ;
 }
 
  if (keyCode == 38) {
  fishY = fishY - 20 ;
 }

 if (keyCode == 40) {  // down
   fishY = fishY + 20 ;
 }
 
}

class Boat {
  
    //attributes
    PVector loca ;
    PVector vel ;
    color myColor ;
    boolean live ;
    PImage pic ; 
    
    // constructor
    Boat() {
      loca = new PVector(random(width), random(height)) ;
      vel = new PVector(random(1,5),0) ;
      myColor = color(random(255), random(255), random(255)) ;
      live = true ;
       pic = loadImage("bboat.png") ;
    }
    
    //methods
    void display() {
      fill(myColor) ;
      image(pic,loca.x,loca.y,50,50) ;
    }
    
    void drive() {
      loca.add(vel) ;
      
      if(loca.x > width) {
        loca.x = 0 ;
      }
    }
    
}
      
      
  


