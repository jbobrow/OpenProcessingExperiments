
/* @pjs preload="BG-0.jpg", "BG-1.jpg", "BG-2.jpg", "BG-3.jpg", "StarBurst2.png"; */
PImage backGround0;
PImage backGround1;
PImage backGround2;
PImage backGround3;
PImage Grof;



//Car myCar1;
ArrayList<Car> myCars ;
PVector frogLocation;
int score = 0;
int myState = 0;
int myCounter = 20 * 60 ;
int myCounter1 = myCounter;
int myCounter2 = 0 ;
int quantity = 10 ;

void setup() {
size(500,500);
backGround0 = loadImage("BG-0.jpg");
backGround1 = loadImage("BG-1.jpg");
backGround2 = loadImage("BG-2.jpg");
backGround3 = loadImage("BG-3.jpg");
Grof = loadImage("StarBurst2.png");

 // myCar1= new Car();
  myCars = new ArrayList();
for (int i=0;i<quantity;i++) {
  myCars.add(new Car());
}
frogLocation = new PVector (width/2,height-50);
}


void draw () {
  switch(myState) {
    
 case 0:
 image(backGround0,0,0);
 break;
 
 case 1:
 //playing the game
  myCounter--;
//  println(myCounter);
 if (myCounter < 0) {
 myState = 2;
 }
 if (score == quantity) {
 myState = 3 ;
 }
 
  //background(#B820F5);
  //  fill(0);
  //  textSize(36);
  //text ("HEY, LET'S PLAY...",50,50);
  image(backGround1,0,0);
 game();
 break ;
 
 case 2:
 // background(255,0,0);
 
  image(backGround2,0,0);
  
 
  break ;

 
 
   case 3: // you won
  //background(255,255,0);
   fill(#309c3a);
   textSize(36);  
 
 image(backGround3,0,0);
  myCounter2 = myCounter1-myCounter ;
  text ("Your Score is",25,250);
  text (myCounter2,275,250);
 
    break ;

 }

}

void mousePressed() {
 
 myState = (myState+1) % 4;

 
 } 

void keyPressed() {
println(keyCode);
  if (keyCode == 39) {
  frogLocation.x+= 50;
}
  if (keyCode == 37) {
  frogLocation.x-= 50 ;
}
if (keyCode == 38) {
  frogLocation.y-= 50 ;
}
if (keyCode == 40) {
  frogLocation.y+= 50 ;
}
}

class Car {

  // attributes
PVector location ; 
PVector velocity ;
color myColor ;
float wide;
boolean alive ;
  
  
  // constructor  
Car() {

      location = new PVector(random(width),random(height));
      velocity = new PVector(random(-3,3),random(-3,3));
      wide = random(30,80);
      //wide = 60 ;
      alive = true;
      
      
}  
  
  
  // methods

void display() {
 
 translate(location.x,location.y);
 scale(wide/200);
 monster();
  
}
void drive() {
  location.add(velocity);
  
 
  if (location.x<0) {
    location.x = width;
    }
   if (location.x>width) {
    location.x = 0;
    }
   
   if (location.y>height) {
    location.y = 0;
    } 
    
    if (location.y<0) {
    location.y = height;
    }
   } 
}


void game() {
//background(100);
 
 // iterate thru car array
 for(Car myCar : myCars) {
   pushMatrix();
   myCar.display() ;
   myCar.drive() ; 
   popMatrix();
   
   
   // test distance of car to frog
   PVector offset = new PVector(60, 20) ; 
   offset.mult(myCar.wide/200) ;   
   PVector fixed = PVector.add(myCar.location, offset) ; 
   float d = fixed.dist(frogLocation);
  // println(d) ; 
   if(d<(myCar.wide)) {
   score++ ;
   myCar.alive = false ;
   
   }
 }
 
 // iterate thru car array and delete dead cars
 for(int i = 0; i < myCars.size(); i++) {
 Car thisCar = (Car) myCars.get(i) ;
 if (thisCar.alive == false) {
 myCars.remove(i);
 
 }
 
 }
 
 // make the frog
 
  //myImage();
  image(Grof,frogLocation.x,frogLocation.y);
  text(score,10,30);




}
void monster() {
//  fill(0) ;   
//  rect(0, 0, 100, 100) ; 

  // THE pattern
fill(#8DC9D3);
//for (int y=0; y<height ; y++){
//for (int x=0; x<width ; x++){
// ellipse(20*x,20*y,30,30);
 //   }
 // }
  // end of pattern

  // The HEAD
  fill(0);
  ellipse(264,120,160,180);
  
  
  
  fill(255, 0, 0) ;
 beginShape();
    vertex(212,72);
    vertex(320,72);
    vertex(360,122);
    //vertex(320,172);
    vertex(360,122);
    vertex(212,172); 
    vertex(320,172);
    vertex(172,122);
    vertex(212,72);
   
    vertex(172,122);
    //vertex(212,172);
    //vertex(320,72);
  endShape();
  
  // eye
  fill(#89E548);
ellipse(266,104,55,15);
fill(0);
ellipse(266,104,15,15);


// The Torso
fill(0);
quad(218,195,311,195,333,334,190,334);
fill(#DB2CF0);
ellipse(266,220,10,25);
ellipse(266,260,10,25);
ellipse(266,300,10,25);


// Arms
fill(125);
triangle(319,236,438,310,326,281);
triangle(210,236,94,310,200,281);

// Legs
rect(200,334,20,100);
rect(255,334,20,100);
rect(307,334,20,100);

fill(95);
ellipse(211,438,40,40);
ellipse(265,438,40,40);
ellipse(318,438,40,40);
fill(0);
ellipse(211,438,10,10);
ellipse(265,438,10,10);
ellipse(318,438,10,10);



  // this is a helper area to show your mouse coordinates
  // to help you know where to place objects
  // you can comment this out when you're done with your 
  // monster

 // fill(255) ; 
 // rect(0, 0, 70, 20) ;
 // fill(0) ; 
 // text(mouseX + ", " + mouseY, 10, 15) ;
 }


