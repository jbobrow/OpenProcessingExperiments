
/* @pjs preload = "stagePac.jpg", font = "OldeEnglish.ttf"; */

ArrayList myCars ; 
PImage stagePac ;
PFont oldeenglish ;
int myState = 0 ;
String[] myStrings = {
  "This thug life will be the death of me", "Can't a brother get a little peace?", "I ain't a killer but don't push me", "Nothin but a gangsta party"
} 
;

void setup() {
  size(650, 500);
  stagePac = loadImage("stagePac.jpg");
  oldeenglish = createFont("OldeEnglish.ttf", 42);
  

  myCars = new ArrayList() ;
  for (int i = 0 ; i < 10 ; i++) {
    myCars.add(new Car()) ;
  }
}

void draw() {
  switch(myState) {
  case 0:
    background(0, 0, 0);
    textFont(oldeenglish);
    text("2Pac Back:", 35, 200);
    text("An Ode to 2Pac's Hologram", 35, height/2);
    text("Kim Kizyma", 35, 350);

    break ;

  case 1:
    background(0);
    image(stagePac, 0, 0);

    for (int i = 0 ; i < 10 ; i++) {
      Car thisCar = (Car) myCars.get(i) ;
      thisCar.display() ;
      thisCar.drive() ;
    }
    break ;
  }
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 1) {
    myState = 0 ;
  }
}
class Car {

  //attributes
  PVector position ;
  PVector velocity ;
  float mySize ; 
  //String myPhrase ; old one "thug life"
  color myColor ;  
  String myPhrase ;

  //constructor
  Car() {
    position = new PVector(random(width), random(height)) ;
    velocity = new PVector(random(-2, 2), random(-2, 2)) ;
    mySize = int(random(20, 50));
    myColor = color(#FFFCFC);
    myPhrase = myStrings[int(random(4))] ;

  }

  //methods
  void display() {
    fill(myColor) ;
    textSize(mySize) ;
    text(myPhrase, position.x, position.y) ;
  }

  void drive() {
    position.add(velocity) ;
    if (position.x > width) {
      position.x = 0 ;
    }

    if (position.y > height) {
      position.y = 0 ;
    }

    if (position.x < 0) {
      position.x = width ;
    }

    if (position.y < 0) {
      position.y = height ;
    }
  }
}


