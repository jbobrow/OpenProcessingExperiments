
/* @pjs preload="cheesebackground.png"; */

int state = 0 ;
int counter = 0 ;

ArrayList myCheese ;
ArrayList myCheese2 ;

PVector mousePos ;

void setup() {

  size(500, 500) ;

  mousePos = new PVector(width/2, height/2) ;  

  myCheese = new ArrayList() ; 

  for (int i = 0 ; i < 75 ; i++) {
    myCheese.add(new Cheese()) ;
  }
}


void draw() {

  background(#990033) ;
 PImage bg = loadImage("cheesebackground.png");
image(bg, 0, 0) ; 

  switch(state) {
  case 0:
    fill(#CBCCCA) ;
    textSize(23) ;
    text("Click to start", 185, 250) ;
    fill(#FFFFFF) ;
    textSize(20) ;
    text("Can you eat all the cheese before time runs out?", 16, 150) ;
    break;

  case 1:

    for (int i = 0 ; i < myCheese.size() ; i++) {   
      Cheese tempCheese = (Cheese) myCheese.get(i) ; 
      tempCheese.display() ;
      tempCheese.move() ;   

      float d = (tempCheese.pos).dist(mousePos) ;
      if (d < tempCheese.wide) {
        tempCheese.alive = false ;
      }
    }

    for (int i = 0 ; i < myCheese.size() ; i++) {
      Cheese tempCheese = (Cheese) myCheese.get(i) ;

      if (tempCheese.alive == false) {
        myCheese.remove(i) ;
      }
    }

    // draw mouse
    fill(150) ;
    stroke(150) ;
    ellipse(mousePos.x, mousePos.y, 40, 40) ;
    ellipse((mousePos.x + 13), (mousePos.y - 22), 20, 20) ;
    ellipse((mousePos.x - 13), (mousePos.y - 22), 20, 20) ;
    fill(#FFFFFF) ;
    stroke(#000000) ;
    ellipse((mousePos.x + 7), (mousePos.y - 5), 10, 15) ;
    ellipse((mousePos.x - 7), (mousePos.y - 5), 10, 15) ;
    fill(#FF99CC) ;
    ellipse((mousePos.x), (mousePos.y + 10), 5, 5) ;

    //counter = 0 ;
    counter ++ ;

    if (counter == 1765) {
      state = 2 ;
      
      for (int i = 0 ; i < 75 ; i++) {
    myCheese.add(new Cheese()) ;
  }
    }

    if (myCheese.size() == 0) {
      state = 3 ;
      
      for (int i = 0 ; i < 75 ; i++) {
    myCheese.add(new Cheese()) ;
  }

      // myCheese2 = new ArrayList() ;

      //for (int i = 0 ; i < 75 ; i++){
      //myCheese2.add(new Cheese()) ;
      // }
    }

    //  if (Cheese = 0){
    //  state = state + 1 ; 
    //  }




    break ;

  case 2:
    fill(#FFFFFF) ;
    textSize(30) ;
    text("You ran out of time!", 87, 150) ;
    textSize(20) ;
    fill(#CBCCCA) ;
    text("Click to play again", 175, 200) ;
    counter = 0 ;



    break ;

  case 3:
    fill(#FFFFFF) ;
    textSize(30) ;
    text("You Win!", 185, 200) ;
    textSize(20) ;
    fill(#CBCCCA) ;
    text("Click to play again", 87, 150) ;
    counter = 0 ;
    break ;
  }
}


void mousePressed() {
  if (state == 0) {
    state = 1 ;
  }

  if (state == 2) {
    state = 1 ;
  }

  if (state == 3) {
    state = 1 ;
  }
}

void keyPressed() {

  switch(keyCode) { 
  case 37: // left arrow
    mousePos.x = mousePos.x - 35 ;

    if (mousePos.x < 0) {
      mousePos.x = 0 ;
    }

    break ; 

  case 38: // up
    mousePos.y = mousePos.y - 35 ;

    if (mousePos.y < 0) {
      mousePos.y = 0 ;
    }
    break ;

  case 39: // right
    mousePos.x = mousePos.x + 35 ;

    if (mousePos.x > width) {
      mousePos.x = width ;
    }
    break ;

  case 40: // down
    mousePos.y = mousePos.y + 35 ; 

    if (mousePos.y > height) {
      mousePos.y = height ;
    }
    break ;
  }
}

class Cheese {

  // attributes  
  color myColor ;
  PVector vel ; 
  PVector pos ;
  float wide ;
  boolean alive ;

  // PVector myPosition.z ;

  // Constructor
  Cheese() {
    vel = new PVector(random(-2, 2), random(-2, 2)) ;
    pos = new PVector(random(width), random(height)) ; 
    myColor = color(random(255), random(255), random(255)) ;
    wide = random(30, 45) ;
    alive = true ;
  }

  // Methods
  void display() { 
    fill(#FFF333) ;
    rect(pos.x, pos.y, wide, 35) ; 
    fill(#FFCC00) ;
    ellipse(pos.x + 10, pos.y + 10, 10, 12);
    ellipse(pos.x + 20, pos.y + 5, 4, 4) ;
    ellipse(pos.x + 25, pos.y + 15, 7, 7) ;
    ellipse(pos.x + 17, pos.y + 27, 9, 7) ;
  }

  void move() {
    pos.add(vel) ; 
    if (pos.x > width) {
      pos.x = 0 ;
    }

    if (pos.x < 0) {
      pos.x = width ;
    }

    if (pos.y > height) {
      pos.y = 0 ;
    }

    if (pos.y < 0) {
      pos.y = height ;
    }
  }
}



