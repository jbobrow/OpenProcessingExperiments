
ArrayList myCars ;
float frog1 ;
float frog2 ;
 PImage v1;
  PImage carpet;
PFont myFont;


void setup () {
  size(507, 700) ;
  v1 = loadImage("vacuum3.png") ;
   carpet = loadImage("carpet.jpg") ;
   myFont = loadFont("Verdana-BoldItalic-46.vlw");

frog1 = 210 ; 
  frog2 = 570 ;
  rectMode(CENTER);
  myCars = new ArrayList() ; // make a new arrayList
   for (int i = 0 ; i < 20 ; i++) {
   myCars.add(new Car()) ;


}
}

void draw () {
  image(carpet, 0, 0, 507, 700) ;
fill(#d39748) ;
rect(200, 0, 900, 130);

fill(#2b1a03) ;
textFont (myFont, 12);
text("Thousands of years ago, there was a vacuum and there was dust..." ,20, 13);
  textFont (myFont, 15);
  text("The dust bunnies are getting away, get them!" ,100, 30);
  textFont (myFont, 15);
  text("(use the arrows to move)" ,50, 50);
    // move my cars
    for(int i = 0 ; i < myCars.size() ; i++) {
      Car car = (Car) myCars.get(i) ;
   car.display() ;
    car.drive() ;
    
    PVector frogLoc = new PVector(frog1, frog2) ; 
   float d = (car.loc).dist(frogLoc) ;
   
   if (d < 20) {
     println("BOOM!") ;
     car.alive = false ;
   }
   
}


for(int i = 0 ; i < myCars.size() ; i++) {
      Car car = (Car) myCars.get(i) ;
      
      //check ii=f car is alive
      if(car.alive == false){
        myCars.remove(i) ;
      }
}


// draw my Frog
fill(0, 150, 0) ;
image(v1, frog1 - 20, frog2 - 100, 120, 120) ;
    }
    
    void keyPressed(){
      //println("key pressed = " + keyCode) ;
      
      if (keyCode == 39) {
        frog1 = frog1 + 30 ;
      
     
    }
    
    if (keyCode == 37) {
        frog1 = frog1 - 30 ;
      
    }
    
    if (keyCode == 38) {
        frog2 = frog2 - 30 ;
      
    }
    
    if (keyCode == 40) {
        frog2 = frog2 + 30 ;
      
    }
   }
    
    
    


class Car {
  //attribute
 
 PVector vel ;
 PVector loc ;
 PImage d1;
  color myColor ;
  boolean alive ;
  
  
  // constructor 
  Car() {
    loc = new PVector(random(width), random(height)) ;
    vel = new PVector(random(1,5), 0) ;
   d1 = loadImage("dust1.png") ;
    myColor = color(random(255), random(255), random(255)) ;
    alive = true ;
   
  }
  //methods
  void display() {
    fill(myColor) ;
imageMode (CORNER) ; 
image (d1, loc.x, loc.y, 50, 25);


   
    
  }
 void drive () {
loc.add(vel) ;
  
   
   if(loc.x > width) {
  loc.x = 0 ;
   }
}

}



