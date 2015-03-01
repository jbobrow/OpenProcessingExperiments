

// int x ;
//Car myCar1 ; 

ArrayList<Car> myCars ; 
PVector frogLocation ; 
int score= 0;
int myState = 0;
int myCounter = 35 * 60; // 5 seconds
PImage myB ; 

void setup() {
  size(500, 500) ; 
  myB = loadImage("myBackground.jpg") ; 
  
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
    background(0, 0, 255);
    fill(#FFFFFF);
    text("hello world", 20, 20);
    break;

  case 1:
    //playing the game
    myCounter--;
 //   println(myCounter);
    game();
    if (myCounter < 0) {    //then go to cae 2
      myState=2;
    }
    if (score>30) {
      myState=3;
    }
   

    break;


  case 2:
    //lost
    background(255, 0, 0);
    fill(#FFFFFF);
    text("you lost, loser. Better luck next time", 20, 20);
    break;

  case 3: //you won
    background(255);
    fill(#1730FF);
    text("WINNER!!!", 20, 20);
    break;
  }
}

void mousePressed() {
  myState = (myState+1) % 3 ;
}

void keyPressed() {
//  println(keyCode) ; 

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
    wide= random (.10, .30);
    alive= true;
  }

  // methods, just change this for project, put something in for rect
  void display() {  // how it looks
    fill(myColor) ; 
    // rect(location.x, location.y, wide, 25) ;
    // text("hello", location.x, location.y+50) ;

    translate(location.x, location.y);
    //rect(0,0,wide,25);
    scale(wide);
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

void game() {
 // background(100) ;
 image(myB, 0, 0,width,height) ; 

  //iterate thru car array
  for (Car myCar : myCars) {
    pushMatrix();
    myCar.display() ;
    myCar.drive() ;
    popMatrix();

    //test distance of car to frog
  //  PVector offset = new PVector(myCar.width/2, myCar.height/2) ;
    float d= myCar.location.dist(frogLocation);
//println(d) ; 
    if (d < 70) { //myCar.wide) {
      println("boom!");
      score++;
      myCar.alive=false;
    }
  }

  //iterate thru car array and delete dead cars
  for (int i=0; i< myCars.size (); i++) {
    Car thisCar= myCars.get(i);
    if (thisCar.alive == false) {
      myCars.remove(i);
    }

    // make my frog
    fill(#FFFFFF ) ; 
    ellipse(frogLocation.x, frogLocation.y, 30, 30) ;
    //image(myImage, frogLocation.x, frogLocation.y);

    fill (255);
    text(score, 10, 30);
  }
}




void monster() {


  fill(#FF0000);
  ellipse(150, 130, 120, 120);

  fill(#FF0000);
  ellipse(330, 125, 120, 120);

  fill(#0A0A0A);
  ellipse(150, 130, 80, 80);

  fill(#0A0A0A);
  ellipse(330, 125, 80, 80);

  // mouth 
  fill(#030303) ;
  arc(250, 325, 200, 100, 0, PI - 0);

  //teeth
  fill(#FF0000) ;
  triangle(190, 325, 240, 450, 220, 325) ;
  fill(#FF0000) ;
  triangle(265, 325, 264, 450, 295, 325) ;


  //eyebrows  
  fill(#0A0A0A) ;
  rect(130, 64, 60, 15) ;
  fill(#0A0A0A) ;
  rect(295, 62, 60, 15) ;

  fill(#0A0A0A); 
  rect(185, 75, 20, 20);
  fill(#0A0A0A); 
  rect(277, 73, 20, 20);

  fill(#0A0A0A); 
  rect(201, 95, 15, 15);
  fill(#0A0A0A); 
  rect(265, 94, 15, 15);

  fill(#0A0A0A); 
  rect(120, 52, 15, 15);
  fill(#0A0A0A); 
  rect(350, 50, 15, 15);

  //nostrils
  stroke(0);
  strokeWeight(5);
  line(215, 235, 240, 290);
  line(280, 235, 260, 290);
}




