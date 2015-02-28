
/* @pjs font = "BubblegumSans-Regular.ttf" ; */

int myState=0;
ArrayList myCars;
float frogX;
float frogY;
PImage myImage;
PImage day;
PImage background;
PFont myFont;


void setup(){
  size(500,500);
  rectMode(CENTER);
  
  frogX = width/2;
  frogY = height-50;
  
 myImage=loadImage("myBunny.png");
 day=loadImage("day.jpg");
 background=loadImage("grass.jpg");
 myFont=createFont("BubblegumSans-Regular.ttf", 200);
  
  myCars = new ArrayList() ; 
  
 for (int i = 0; i<30; i++) { 
 myCars.add(new Car()) ;
 }
}

void draw(){
  
  switch(myState){
    case 0:
    image(day, 0, 0);
    textFont(myFont, 45);
    fill (#A95AEA);
    text("Help the bunny collect eggs", 10, 50);
    text("to hide for Easter!", 10, 100);
    textFont(myFont, 29);
    fill (000);
    text("Use the arrow keys to move the", 10,150); 
    text("bunny around the screen.", 10, 200);
    fill (000);
    text("Touch an egg with the", 10, 250);
    text("bunny's hand to collect it.",10, 300);
    textFont(myFont, 20);
    fill (000);
    text("Click the screen to begin the game", 10, 480);
    
    break;
    
    case 1:
  
  image(background, 0, 0, width, height);
  
  
  for (int i = 0; i<myCars.size(); i++) {
    Car car = (Car) myCars.get(i);
    car.display(); 
    car.drive();

    PVector frogLoc = new PVector(frogX, frogY);
    float d = (car.loc).dist(frogLoc);
    
    if (d < 40) { 
      println("Yay!");
      car.alive = false;
    }
 }
  
   for (int i = 0; i<myCars.size(); i++) {
    Car car = (Car) myCars.get(i);
  
  
  if(car.alive == false) {
    myCars.remove(i);
  }
 
 }
  
  image (myImage, frogX-30, frogY-100, 130,130);
  break;
} 

}

void mousePressed() {
  myState++;
  if (myState > 1) {
    myState = 0;
  }
}

void keyPressed() {
  println("key pressed =" + keyCode); //keyCode shows what key was pressed
  
  if (keyCode == 39) { //right arrow key
    frogX = frogX + 20 ;
  }
  
  if (keyCode == 37) { //left arrow key
    frogX = frogX - 20;
  }
  
   if (keyCode == 38) { //up arrow key
    frogY = frogY - 20 ;
  }
  
  if (keyCode == 40) { //down arrow key
    frogY = frogY + 20;
  }
  
}
 class Car {
 
//attributes
PVector loc; 
PVector vel; 
color myColor;
boolean alive;


//constructor
Car() {
 loc = new PVector(random(width), random(height));
 vel = new PVector(random(1,5), 0); 
 myColor = color (random(255), random(255), random(255));
 alive = true;
}


//methods
  void display() {
    fill(myColor);
    ellipse(loc.x,loc.y, 30, 45);
    fill(255);
    ellipse(loc.x-6,loc.y-11, 12, 12);
    fill(255);
    ellipse(loc.x+8,loc.y+1, 12, 12);
    fill(255);
    ellipse(loc.x-5,loc.y+12, 12, 12);
  }
  
  void drive(){
    
    loc.add(vel); 
    
   if (loc.x > width) {
    loc.x = 0;}
    
   if (loc.y > height) {
    loc.y = 0;}
    
   if (loc.x < 0) {
    loc.x = width;}
    
   if (loc.y < 0) {
   loc.y = height;}
  } 
  
}


