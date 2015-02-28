
/* @pjs font="Eraser.ttf"; */
 


int myState=0;

ArrayList myCars ;
float frog1 ;
float frog2 ;
 PImage v1;
  PImage carpet;
PFont myFont;
 PImage d1;
 
void setup () {
  size(507, 700) ;
  v1 = loadImage("vacuum3.png") ;
   carpet = loadImage("carpet.jpg") ;
   myFont = createFont("Eraser.ttf", 20);
   d1 = loadImage("dust1.png") ;
 
frog1 = 210 ;
  frog2 = 570 ;
  rectMode(CENTER);
  myCars = new ArrayList() ; // make a new arrayList
   for (int i = 0 ; i < 20 ; i++) {
   myCars.add(new Car()) ;
 
 
}
}
 
void draw () {
    switch(myState){
    case 0:
    background(#a39676) ;
  image(v1, 50, 400, 200, 200) ;
    image(d1, 300, 530, 50, 50) ;
     image(d1, 370, 480, 50, 50) ;
      image(d1, 400, 540, 50, 50) ;
    textFont(myFont, 45);
    fill (#9b5221);
  text("ANCIENT", 150, 70);
   text("VACUUM", 143, 120);
   text("RAIDER", 160, 170);
   fill (#1515e5);
   text("3!!!", 210, 220);
      fill (000);
   textFont(myFont, 14);
    text("THOUSANDS of years ago there was a great carpet storm,", 10, 300);
    text("but one vacuum master stood to the challenge.", 50, 320);
    text("Be that vacuum master and maintain the sacred carpet!", 13, 340);
    textFont(myFont, 20);

    
    text("(use arrow keys to move vaccum)", 50, 650);


    textFont(myFont, 20);
    fill (000);
    text("(click the screen to play/pause)", 57, 680);
     
    break;
     
    case 1:

  image(carpet, 0, 0, 507, 700) ;
fill(#d39748) ;

fill(#2b1a03) ;

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
   break;
  }
}

void mousePressed() {
  myState++;
  if (myState > 1) {
    myState = 0;
  }
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
  PVector size;

  
  // constructor 
  Car() {
    size = new PVector (random (15,65), random(20,30));

    loc = new PVector(random(width), random(height)) ;
    vel = new PVector(random(2,6), 0) ;
   d1 = loadImage("dust1.png") ;
    myColor = color(random(255), random(255), random(255)) ;
    alive = true ;
   
  }
  //methods
  void display() {
    fill(myColor) ;
  
image (d1, loc.x, loc.y, size.x, size.y);


   
    
  }
 void drive () {
loc.add(vel) ;
  
   
   if(loc.x > width) {
  loc.x = 0 ;
   }
}

}




