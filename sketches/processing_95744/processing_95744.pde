
/* @pjs font="racingsansone.ttf"; */

String mouse = "Left click to continue";
int myState = 0 ;
ArrayList myCars ;
PImage space;
PImage ship;
PImage rock;
PImage planet;
PFont race;
float frogX ;
float frogY ;

void setup()  {
  race = createFont("racingsansone.ttf", 25);
  textFont(race);
  
  rock = loadImage("asteroid.png");
  planet = loadImage("planet.png");
  ship = loadImage("ship.png");
 space = loadImage("space.jpg");
 
 size(500,500);
 rectMode(CENTER);

frogX = width/2 ;
frogY = height-50;

myCars = new ArrayList() ;

for (int i = 0 ; i < 10; i++) {
 myCars.add(new Car()) ; 
}
}




void draw()  {

  switch(myState){
case 0:
image(space,0,0);


String x2 = "No one predicted it. No one could have seen it coming, but one morning life as we knew it would forever change.";
String x3 = "It started with a light that flashed across the sky brighter than the sun.";
String x4 = "Then a great darkness that enveloped its light forever extinguishing it from our universe.";


fill(120);
rect(248, 260,500,450);


fill(54,47,45);
text(x2, 2,80,500,500);
text(x3, 2,180,500,500);
text(x4, 2, 280,500,500);
fill(255);
text(mouse, 2, 480,500,500);








break;

case 1:
image(space,0,0);
String x5 = "Many called it the end of days, but a few knew what it truly was.";
String x6 = "The end of the human race.";
String x7 = "You are the ship Odyssey 540ea. Or Oddy for short. You carry upon you the last strands of human DNA known to the universe.";


fill(120);
rect(248, 260,500,450);
fill(54,47,45);
text(x5, 2,80,500,500);
text(x6,2,180,500,500);
 text(x7,2,270,500,500);
fill(255);
text(mouse, 2, 480,500,500);

break;

case 2:
image(space,0,0);
String x8 = "Your job is simple. Find a habitable planet to rebuild the human race while also avoiding dangers along the way.";
String y ="You are humanity's last best hope...";
String dir = "Use the arrow keys on your keyboard to guide your ship to safety to the nearby planet, Deathoplocus 9!";

fill(120);
rect(248, 260,500,450);
fill(54,47,45);
text(x8,2,80,500,500);
text(y,2,200,500,500);
fill(255);
 text(dir,2, 350,500,500);
text(mouse, 2, 480,500,500);
break;

case 3:
  
image(space,0,0);
image(planet,80,0);
  //  background(255,125,65);
  
// move my cars
    for (int i = 0 ; i < myCars.size() ; i++)  {
    Car car = (Car) myCars.get(i) ;
    car.display() ;
    car.drive() ; 
    
    PVector frogLoc = new PVector(frogX, frogY) ;
    float d = (car.loc).dist(frogLoc) ;
    
    if (d < 10)  {
    // println("Boom!"); 
     car.alive = false ;
    } // END OF IF
    } // EMD OF FOR
  
  
  
  
  for (int i = 0 ; i < myCars.size() ; i++)  {
    Car car = (Car) myCars.get(i) ;
  
  // CHECK IF CAR IS ALIVE
  if (car.alive == false)  {
   myCars.remove(i); 
    
  }
  
  }

  // CHECK TO SEE HOW MANY CARS WE HAVE
  
  
  // DRAW MY FROG
  fill(0,150,0);
  image(ship, frogX, frogY);
  // rect(frogX, frogY, 40, 50);

 break;
  }

} // END OF DRAW  

void mousePressed()  {
  myState++  ;
  if (myState > 3)  {
    myState = 3 ;
  }

} 


void keyPressed()  {
// println("key pressed " + keyCode); 
  
  
  if (keyCode == 39)  {
   frogX = frogX + 10; 
    }
  
  if (keyCode == 37)  {
    frogX = frogX - 10 ;
    }

if (keyCode == 40)  {
 frogY = frogY + 10 ; 
  }

if (keyCode == 38)  {
 frogY = frogY - 10 ;
}

} // END KEYPRESSED


class Car  {
  
  //  ATRIBUTES
  
  PVector loc ;
  PVector vel ;
  color myColor ;
  boolean alive ;
  
  //  CONSTRUCTOR
  Car()  {
    
     vel = new PVector(random(1,5), 0);
     loc = new PVector(random(width), random(height));
      myColor = color(random(255), random(255), random(255));
      alive = true ;
      // myImage
      
  } // END OF CAR CONSTRUCTOR
  
  //  METHODS

  void drive()  {
    loc.add(vel);
    
    if (loc.x > 500)  {
      loc.x = 0;
    } // END OF IF
    
    
  } // END OF DRIVE
  
  void display()  {
//  fill(myColor);
  image(rock,loc.x,loc.y);
//  ellipse(loc.x,loc.y,50,25); 
} //  END OF DISPLAY
  
  

} // END OF CAR


