
/* @pjs font="Tangerine_Bold.ttf"; */



PVector BasPos;
PImage bucket; 
int myState = 0;
PFont type ;
float wide; 
PImage cloud;


ArrayList myCars ; 



void setup() {
  size (500, 500) ;

  BasPos = new PVector(width/2, height/2) ;
  bucket = loadImage("bucket.jpg") ;
  cloud = loadImage("cloud.JPG");
  //type = loadFont("Courier-48.vlw");
  type = createFont("Tangerine_Bold.ttf") ;
  textFont(type, 70);
  

  myCars = new ArrayList() ;

  // giving birth to new cars!
  for (int i = 0 ; i < 10 ; i++) {
    myCars.add(new Car()) ;
  }
}


void draw () {

  switch(myState) {
  case 0:
    background(#797B7E);
    image(cloud,0,0,500,500) ;
    fill(#0A0A0A);
    text("April Showers", 100, 200);
    text("Click to Play!", 100, 300);
    break;

  case 1:

    background(#797B7E) ;

    fill(#515355);
    ellipse(660, 10, 150, 90);
    ellipse(660, 80, 150, 90);
    ellipse(450, 20, 150, 90);
    ellipse(450, 80, 150, 90);
    ellipse(400, 20, 150, 90);
    ellipse(400, 80, 150, 90);
    ellipse(250, 20, 150, 90);
    ellipse(250, 80, 150, 90);
    ellipse(160, 20, 150, 90);
    ellipse(160, 80, 150, 90);
    ellipse(30, 20, 150, 90);
    ellipse(30, 80, 150, 90);

    fill(#75787C) ;
    ellipse(600, 20, 150, 90);
    ellipse(600, 80, 150, 90);
    ellipse(520, 20, 150, 90);
    ellipse(520, 80, 150, 90);
    ellipse(310, 20, 150, 90);
    ellipse(310, 80, 150, 90);
    ellipse(80, 20, 150, 90);
    ellipse(80, 80, 150, 90);

    fill(#20711F);
    rect(0, 480, 500, 30);

    image(bucket, BasPos.x, 340, 140, 140);


    for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ; 
      tempCar.display() ;
      tempCar.drive() ;
      float d = (tempCar.pos).dist(BasPos);
      if (d<50) {
        println("boom!");
        tempCar.alive = false ;
      }
    }
      for (int i = 0 ; i < myCars.size() ; i++) {
      Car tempCar = (Car) myCars.get(i) ;  
        if (tempCar.alive ==false) {
          myCars.remove(i) ;
        }}
      
      if (myCars.size() <= 0) {
      myState = 2 ;
       }  
        
   
    break;

  case 2:
   background(#797B7E) ;

    fill(#515355);
    ellipse(660, 10, 150, 90);
    ellipse(660, 80, 150, 90);
    ellipse(450, 20, 150, 90);
    ellipse(450, 80, 150, 90);
    ellipse(400, 20, 150, 90);
    ellipse(400, 80, 150, 90);
    ellipse(250, 20, 150, 90);
    ellipse(250, 80, 150, 90);
    ellipse(160, 20, 150, 90);
    ellipse(160, 80, 150, 90);
    ellipse(30, 20, 150, 90);
    ellipse(30, 80, 150, 90);

    fill(#75787C) ;
    ellipse(600, 20, 150, 90);
    ellipse(600, 80, 150, 90);
    ellipse(520, 20, 150, 90);
    ellipse(520, 80, 150, 90);
    ellipse(310, 20, 150, 90);
    ellipse(310, 80, 150, 90);
    ellipse(80, 20, 150, 90);
    ellipse(80, 80, 150, 90);

    fill(#20711F);
    rect(0, 480, 500, 30);

    image(bucket, BasPos.x, 340, 140, 140);
    fill(#010A00);
    text("Click to Play Again!", 30, 200);

    break;
  }
}


void keyPressed() {
  switch(keyCode) {

  case 37://left arrow
    BasPos.x = BasPos.x-20;
    break; 

  case 39: //right arrow
    BasPos.x = BasPos.x+20 ;
    break;
  }
}


void mousePressed() {

  switch(myState) {
  case 0: // going from begin screen to game
    myState = 1 ;
    break ; 

  case 2: // 


    myCars.clear() ; // clear out the cars
    for (int i = 0 ; i < 10 ; i++) {
      myCars.add(new Car()) ;
    }

    myState = 1 ; 
    break ;

  case 1: 
    myState = 2;
    break;
  }
}















class Car {
  
//attributes 
PVector vel ;
PVector pos;
float wide;
boolean alive;
//float x ;
//float y ;

//constructor
Car() {
  vel = new PVector(1,3) ;
  pos = new PVector(random(width), random(height)) ;
  wide = random(20,20);
  alive = true ;

}
  //methods
  
  void display() {
    fill(#96C2F7) ;
    noStroke();
    ellipse(pos.x, pos.y, wide,40) ;  
 }
  

 void drive() {
  pos.add(vel) ;
   if(pos.x>width) {
     pos.x = 0 ;
   }
   
   if (pos.x < 0) {
     pos.x = width;
   }
   
   if(pos.y>height) {
     pos.y = 0 ;
   }
   
   if (pos.y < 0) {
     pos.y = height;
   }
   

  }
}
  

  

  




