
/* @pjs preload="stars.jpg"; font = "PressStart2P-Regular.ttf"; */
PImage space;
PImage stars;
PFont start;


// int x ;
//Car myCar1 ; 

ArrayList<Car> myCars ; 
PVector frogLocation ; 
int score = 0;
int myState = 0;

void setup() {
  space = loadImage("space.jpg");
  stars = loadImage("stars.jpg");
  start = createFont("PressStart2P-Regular.ttf", 100);
  
  size(500, 500) ; 
  //  myCar1 = new Car() ;

  myCars = new ArrayList() ;

  for (int i = 0; i < 10; i++) {
    myCars.add(new Car()) ;
  }

  frogLocation = new PVector(width/2, height-50) ;
}

void draw() {
  
  switch(myState) {
    case 0:
    background(0);
    image(stars, 0, 0, 700, 700);
    fill(#05B2FF);
    textFont(start, 25);
    text("Catch the robots!", 40, 250);
    break;
    
    case 1:
    if (score >= 10) {
     myState = 2; 
    }
    text("game is playing", width/2, height/2);
    game();
    break;
    
    case 2:
    background(0);
    image(stars, 0, 0, 700, 700);
    fill(#05B2FF);
    textFont(start, 25);
    text("You Won!", 150, 250);
    break;
  }
}

void mousePressed() {
  myState = (myState + 1) % 3;
}

void keyPressed() {
  println(keyCode) ; 

  if (keyCode == 39) {
    frogLocation.x += 30 ;
  }

  if (keyCode == 37) {
    frogLocation.x -= 30 ;
  }

  if (keyCode == 38) {
    frogLocation.y -= 30 ;
  }

  if (keyCode == 40) {
    frogLocation.y += 30 ;
  }
}


class Car {

  // attributes
  PVector location ;
  PVector velocity ; 
  color myColor ;
  float wide;  
  boolean alive;

  // constructor(s) 
  Car() {

    location = new PVector(random(width), random(height)) ; 
    velocity = new PVector(random(-3, 3), random(-3, 3)) ;
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 50);
    alive = true;
  }

  // methods
  void display() {  // how it looks
    fill(myColor) ; 
   // rect(location.x, location.y, wide, 25) ;
  //  text("hello", location.x, location.y+50) ;
  translate(location.x, location.y);
  //rect(0, 0, wide, 25);
  scale(wide/400);
  monster();
  }

  void drive() {
    location.add(velocity) ; 

    if (location.x > width) {
      location.x = 0 ;
    }

    if (location.x < 0) {
      location.x = width ;
    }

    if (location.y > height) {
      location.y = 0 ;
    }

    if (location.y < 0) {
      location.y = height ;
    }
  }
}

/* @pjs preload="space.jpg"; */


void game() {
  background(0);
  image(space, -400, 0);

  for (Car myCar : myCars) {
    pushMatrix();
    myCar.display() ;
    myCar.drive() ;
    popMatrix();
    //test distance of car to frog
    float d = (myCar.location).dist(frogLocation);

    if (d < myCar.wide) {
     // println(" boom! ");
      score++;
      myCar.alive = false;
    }
  }

  for ( int i = 0; i < myCars.size (); i++) {
    Car thisCar = (Car) myCars.get(i);
    if (thisCar.alive == false) {
      myCars.remove(i) ;
    }
  }

  // make my frog
  fill(#15B7FF) ; 
  ellipse(frogLocation.x, frogLocation.y, 30, 30) ;
  // image(myImage, frogLocation.x, frogLocation.y);

  fill(255);
  textFont(start, 25);
  text(score, 10, 30);
}

void monster() {
   //ears
  fill(#030E48);
  ellipse(208, 140, 50, 50);
  ellipse(273, 140, 50, 50);
    
  //head
  fill(#004083);
  rect(200, 73, 80, 160);
    
  //eyes
  fill(255);
  ellipse(222, 103, 20, 30);
  fill(0);
  ellipse(222, 103, 10, 10);
  fill(255);
  ellipse(255, 103, 20, 30);
  fill(0);
  ellipse(255, 103, 10, 10);
  
  //nose
  fill(#FFE600);
  triangle(229, 156, 238, 139, 247, 156);
  
  //mouth
  fill(#FF8D00);
  arc(240, 195, 50, 60, 0, PI, 2);
  
  //left antenna
  fill(#C700FF);
  rect(218, 40, 10, 33);
  rect(186, 40, 32, 10);
  fill(#10FC05);
  ellipse(180, 45, 15, 15);
  
  //right antenna
  fill(#C700FF);
  rect(250, 40, 10, 33);
  rect(260, 40, 32, 10);
  fill(#10FC05);
  ellipse(299, 45, 15, 15);
  
  //neck
  fill(#004083);
  rect(225, 233, 30, 20);
  
  //body
  fill(#004083);
  rect(192, 253, 100, 200);
  
  //left arm
  fill(#030E48);
  rect(105, 277, 87, 20);
  rect(105, 190, 20, 87);
  rect(92, 158, 10, 23);
  rect(130, 158, 10, 23);
  rect(92, 180, 48, 10);
  
  //right arm
  fill(#030E48);
  rect(292, 277, 87, 20);
  rect(360, 277, 20, 87);
  rect(346, 364, 48, 10);
  rect(346, 374, 10, 23);
  rect(384, 374, 10, 23);
  
  //legs
  rect(254, 453, 20, 87);
  rect(210, 453, 20, 87);
  
  //feet
  fill(#D82774);
  rect(193, 540, 37, 10);
  rect(254, 540, 37, 10);
 
}


