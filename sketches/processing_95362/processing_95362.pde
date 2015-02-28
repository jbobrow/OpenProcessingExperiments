
/*@pjs font = "AtomicAge-Regular.ttf, Monofett.ttf" ; */
ArrayList myCars ;
int screen = 0 ;
float frogX ;
float frogY ;
PImage ship ;
PImage field ;
PFont atomic ;
PFont mono ;
int x = 0 ;
PImage swarm ;
void setup() {

  size(950, 500);
  atomic = createFont("AtomicAge-Regular.ttf", 30);

  mono = createFont("Monofett.ttf", 30);

  frogX = 820;

  frogY = height/2    ;

  ship = loadImage("gamepcecopy.png");

  field = loadImage("gamebckgd.png");

  myCars = new ArrayList() ;

    swarm = loadImage("swarmers1_vectorized.png");

  for (int i = 0 ; i < 100; i++ ) { //or i=i+2
    myCars.add(new Car()) ;
  }
}

void draw() {

  switch(screen) {
  case 0:
    background(0);
    tint(255, 126);
    image(swarm, 25, height/4, 500, 400);
    noTint();
    textFont(atomic, 60);
    fill(#FFFFFF);
    text("Pesky Dragons Beta", 20, 100);
    textFont(atomic, 24);
    fill(#FFFFFF);
    text("Use the up and down arrow keys to", 495, 250);
    text("clean up all these little dragons to see the image", 280, 310);
    text("also: pressing the spacebar shoots the dragons (supposedly)", 100, 370);
    textFont(mono, 40);
    fill(random(200), random(115), random(50));
    text("press 'S' to begin...", 400, 480);
    
    break;

  case 1:
    background(255) ;
    image(field, 0, 0, 1050, 500);

    for (int i = 0 ; i < myCars.size(); i++) {
      Car car = (Car) myCars.get (i) ; //new code
      car.display();
      car.drive();  


      PVector frogLoc = new PVector (frogX, frogY) ; 
      float d = (car.loc).dist(frogLoc) ;

      if (d < 100) {
        println("BOOW!!");
        car.alive = false ;
      }
    }


    for (int i = 0 ; i < myCars.size(); i++) {
      Car car = (Car) myCars.get (i) ; //new code


      //check if car is alive
      if (car.alive == false) {
        myCars.remove(i) ;
      }
    }

    //check amt of cars


    //draw game piece 

    image(ship, frogX, frogY);
    
     x=x-5;
    
    if (x > width) {
    x= 0 ;
  }
  

    break;
  }
}

  void keyPressed() {
    //println("key pressed = " + keyCode);
    if (key == 'S' || key == 's') {
      screen = screen + 1;
    }
    if (screen > 1) {
      screen = 1;
    }
    if (keyCode == 38) {
      frogY = frogY - 70 ;
    }
    if (keyCode == 40) {
      println(keyCode);
      frogY = frogY + 70 ;
    }
    if (keyCode == 32) {
      fill(#0000FF);
      rect(x, frogY, 10, 5);
    }
  }


//for thursday
/*add screen that pops up when swarm member reaches the other side saying game over*/
/*add new wave with space bar, add instructions (on screen), pause with p*/
/*load fonts in*/

//update: got most of it done need work on the bullets, start over function, and adding a score function 
class Car {

//attributes
PVector loc ;
PVector vel ;
color color1 ;
boolean alive ;
PImage swarm ;


//constructor
Car() {
  loc = new PVector(random(width), random(height));
  vel = new PVector(random(1, 5), 0) ;
  color1 = color(random(255), random(100), random(50));
  alive = true ;
  swarm = loadImage("swarmers1_vectorized.png");
  
}
//methods
void display() {
  fill(color1);
  image(swarm,loc.x,loc.y, 100, 100);
 
  
  
  }

void drive() {
  //loc.x = loc.x + vel.x ;
  loc.add(vel) ;
  
   if (loc.x > width) {
    loc.x = 0;
    
   /* y = y + v;
    if (y > 500) {
      y = 0;*/
       
    
    
    }

  }
  
}




