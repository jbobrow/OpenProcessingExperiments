
//Rose Vastola


Ship myship;
Zone myzone;
Maze maze1;
Maze maze2;
Maze maze3;
Maze maze4;
int gameState;

void setup() {
  size(500, 500);
  noStroke();
  myship= new Ship();
  myzone = new Zone(width - 50, 50, 45);
  maze1 = new Maze( 100, 50, 45);
  maze2 = new Maze( 300, 100, 85);
  maze3 = new Maze( 400, 200, 60);
  maze4 = new Maze( 150, 200, 60);
  gameState = 0;
}


void draw() {
  background(12);
  switch(gameState) {

  case 0:
    //something happens
    textAlign(CENTER);
    textSize(32);
    text("Click to play!", width/2, height/2);
    break;

  case 1:
    myship.move();
    myship.display();
    myzone.display();
    maze1.display();
    maze2.display();
    maze3.display();
    maze4.display();
    if (myzone.checkDistance(myship.pos)) {
      gameState = 2;
    }  
    if (maze1.isCollidingWithRectangle(myship.pos.x, myship.pos.y, 5)) { 
      gameState = 3;
    }
    if (maze2.isCollidingWithRectangle(myship.pos.x, myship.pos.y, 5)) { 
      gameState = 3;
    }
    if (maze3.isCollidingWithRectangle(myship.pos.x, myship.pos.y, 5)) { 
      gameState = 3;
    }
    if (maze4.isCollidingWithRectangle(myship.pos.x, myship.pos.y, 5)) { 
      gameState = 3;
    }
    /*if(maze2.checkDistance(myship.pos)){
     gameState = 3;
     }
     
     if(maze3.checkDistance(myship.pos)){
     gameState = 3;
     }
     
     if(maze4.checkDistance(myship.pos)){
     gameState = 3;
     }
     */
    break;

  case 2:
    // something else to happen
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Click to play again!", width/2, height/2);
    break;
  default:
    break;

  case 3:
    // something else to happen
    fill(255);
    textAlign(CENTER);
    textSize(24);
    text("Boom! you loose! Click to play again", width/2, height/2);
    break;
  }
}

void keyPressed() {
  switch(key) {
  case 'w': 
    myship.thrust(0.1);
    break;
  case 'a':
    myship.theta += 0.1;
    break;
  case 'd':
    myship.theta-= 0.1;
    break;
  default:
    break;
  case 's':
    myship.thrust(-0.1);
    break;
  }
}
void mouseClicked() {
  if (gameState == 0) {
    gameState = 1;
  } 
  else if ( gameState < 4) {  //changed to cover when gamestate is three when you hit a rectange
    myship= new Ship();
    gameState = 1;
  }
}


void keyReleased() {
  if (key == 'w') {
    myship.thrust(0);
  } 

  if (key == 's') {
    myship.thrust(0);
  }
}

class Maze {
  PVector pos;
  float radius;
  float rectangleX;
  float rectangleY;
  float rectangleWidth;
  float rectangleHeight;

  Maze(float tempX, float tempY, float tempR) {// the tempx comes in s a argument and we put it in the intaitally 
    pos = new PVector ( tempX, tempY);
    radius = tempR;
    println(radius);

    rectangleX = tempX;
    rectangleY = tempY;
    rectangleWidth = radius;
    rectangleHeight = 10;
  }

  void display() {
    fill(100, 40, 40);
    rect(pos.x, pos.y, radius, 10);  
    fill(255);
  }
  boolean checkDistance(PVector shipPos) {
    if (dist(pos.x, pos.y, shipPos.x, shipPos.y) < radius) {
      return true;
    }
    else {
      return false;
    }
  }
  //code adapted from:
  // code from http://www.openprocessing.org/sketch/20795 adapted by Rose Vastola
  boolean isCollidingWithRectangle(
  float circleX, 
  float circleY, 
  float radius)



  {
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

    if (circleDistanceX > (rectangleWidth/2 + radius)) { 
      return false;
    }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { 
      return false;
    }

    if (circleDistanceX <= (rectangleWidth/2)) { 
      return true;
    }
    if (circleDistanceY <= (rectangleHeight/2)) { 
      return true;
    }

    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
      pow(circleDistanceY - rectangleHeight/2, 2);

    return (cornerDistance_sq <= pow(radius, 2));
  }
}

class Ship {
  public PVector pos;
  PVector spd;
  PVector acc;
  float theta;

  Ship() {
    pos = new PVector (width/2, height/2);//will put this in the middle of teh screen
    spd = new PVector (); //default constructors for the pvector to assign to the the speec and acceleartion is becasue the default pvector 
    acc = new PVector ();//returns a new opv that returns a zero on xy and y varible.. if speed is and acc is set to zero that means the ship will move
    theta = 0;
  }

  void move() {
    //update position with speed
    //update speed with acceleration
    pos.add(spd);
    checkEdges();
    spd.add(acc);
  }

  void display() {
    //draw the ship at the postion I 
    //draw the ship shape in the correct orientation
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    triangle(25, 0, -5, 10, -5, -10);
    popMatrix();
  }


  void thrust(float force) {
    //set the acceleration based on the force and the theta
    //float variable 
    // what is going to go into the x, y, sign and co sign return numbers of 
    //one and negative one depending on what angle you give them
    acc.set(force*cos(theta), force*sin(theta));
  }

  void checkEdges() {
    // when the ship is off the screen loop it back to the other side 
    if (pos.x >width) {
      pos.x = 0;
    }
    else if (pos.x < 0) {
      pos.x=width;
    }
    else if (pos.x <0) {
      pos.x = width;
    }

    if (pos.y > height) {
      pos.y = 0;
    } 
    else if (pos.y < 0) {
      pos.y = height;
    }
  }
}

class Zone {
  PVector pos;
  float radius;


  Zone(float tempX, float tempY, float tempR) {// the tempx comes in s a argument and we put it in the intaitally 
    pos = new PVector ( tempX, tempY);
    radius = tempR;
  }

  void display() {
    ellipse(pos.x, pos.y, radius, radius);
  }
  boolean checkDistance(PVector shipPos) {
    if (dist(pos.x, pos.y, shipPos.x, shipPos.y) < radius) {
      return true;
    }
    else {
      return false;
    }
  }
}



