
ArrayList<Car> carslane1;
ArrayList<Car> carslane2;
ArrayList<Car> carslane3;
ArrayList<Car> carslane4;
Frog frog;
int numCarsPerLane;
float xpos_frog;
float ypos_frog;
float frog_w;
float frog_h;
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
final static int BOOST = 16;
boolean paused;
boolean collision;
boolean restart;
int score; 
int result;
PFont f;

void setup() {
  numCarsPerLane = 3; // number of cars in each lane
  score = 0; //sets score to 0
  restart = false; 
  f = createFont("Arial", 50, true); // sets font
  size(500, 500); 
  collision = false;
  result = 0;
  paused = false; 
  carslane1 = new ArrayList<Car>(); // creates empty arraylists for each lane of cars
  carslane2 = new ArrayList<Car>();
  carslane3 = new ArrayList<Car>();
  carslane4 = new ArrayList<Car>();
  
  //adds cars to arraylists
  for (int i = 0; i < numCarsPerLane; i++) {
    carslane1.add(new Car(color(random(255), random(255), random(255)), i * (600/numCarsPerLane), random(90, 110), 3.5));
    carslane2.add(new Car(color(random(255), random(255), random(255)), 500 - (i * (600/numCarsPerLane)), random(190, 210), -2));
    carslane3.add(new Car(color(random(255), random(255), random(255)), i * (600/numCarsPerLane), random(290, 310), 2.5));
    carslane4.add(new Car(color(random(255), random(255), random(255)), 500 - (i * (600/numCarsPerLane)), random(390, 420), -1.5));
  }
  frog = new Frog((float)width/2, (float)height - height/20, (float)1.5);
}

void draw() {
  if (paused == true) return; // if paused stop drawing
  //restarts game and increases score (if level is completed)
  if (restart == true) { 
    if (ypos_frog <= 30) {
      paused = false;
      xpos_frog = width/2;
      ypos_frog = (height - height/20);
      frog.display();
      frog.move();
      restart =false;
      collision = false;
      score++;
    }
  }
  //restarts game and resets score (if death)
  if (restart == true) {
    if (collision == true) {
      paused = false;
      xpos_frog = width/2;
      ypos_frog = (height - height/20);
      frog.display();
      frog.move();
      restart =false;
      collision = false;
      score = 0;
    }
  } 
  
  // draws road 
  fill(255);
  background(75);
  rect(50, 150, 100, 10);
  rect(250, 150, 100, 10);
  rect(450, 150, 100, 10);
  rect(50, 250, 100, 10);
  rect(250, 250, 100, 10);
  rect(450, 250, 100, 10);
  rect(50, 350, 100, 10);
  rect(250, 350, 100, 10);
  rect(450, 350, 100, 10);
  fill(100, 255, 100);
  rect(0, 0, 1000, 75);
  rect(0, 500, 1000, 75);


  // Draw cars

  for (int i = 0; i < carslane1.size(); i++) {
    Car car = carslane1.get(i);
    car.drive();
    car.display();
    car.accelerate1();
  }
  for (int i = 0; i < carslane2.size(); i++) {
    Car car = carslane2.get(i);
    car.drive();
    car.display();
    car.accelerate2();
  }
  for (int i = 0; i < carslane3.size(); i++) {
    Car car = carslane3.get(i);
    car.drive();
    car.display();
    car.accelerate3();
  }
  for (int i = 0; i < carslane4.size(); i++) { 
    Car car = carslane4.get(i);
    car.drive();
    car.display();
    car.accelerate4();
  }

  // Draw Frog
  frog.move();
  frog.display();
   
  // if end zone reached (if level completed) pause game and print message)
  if (ypos_frog <= 30) { 
    paused = true;
    background(255);
    textFont(f, 36);
    fill(0);
    text("LEVEL COMPLETE!", 75, 250);
    textFont(f, 12);
    fill(0);
    text("(press 'R' to continue)", 175, 300);
    paused = false;
  }       

  // if collision occurs (death) pause game and print message
  if (collision == true) {
    paused = true;
    stroke(0);
    background(255, 0, 0);
    textFont(f, 36);
    fill(255);
    text("YOU DIED", 160, 200);
    textFont(f, 12);
    text("(press 'R' to Restart)", 185, 300);
    textFont(f, 20);
    text(" You reached level :  " , 152, 270);
    textFont(f, 70); 
    fill(255);
    text(score + 1, 350, 285);
    paused = false;
  }
  
  //print score in top corner
  textFont(f, 36);
  fill(255, 0, 0);
  text("LEVEL: " + (score+1), 0, 28);
}

// cars
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float car_w;
  float car_h;
  float accel;

  Car (color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    car_w = 100;
    car_h = 50;
    accel = 0.2;
  }
  
  // increases speed of each lane of cars (each lane is at a different speed)
  void accelerate1() {
    xspeed = 1.5;
    xspeed = xspeed + (accel * score);
  }
  void accelerate2() {
    xspeed = -0.5;
    xspeed = xspeed - (accel * score);
  }
  void accelerate3() {
    xspeed = 1;
    xspeed = xspeed + (accel * score);
  }
  void accelerate4() {
    xspeed = -1;
    xspeed = xspeed - (accel * score);
  }


  //draw car
  void display() { 
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 100, 50);  
    fill(0);
    ellipseMode(CENTER); 
    ellipse(xpos - 30, ypos - 25, 30, 15);
    ellipse(xpos - 30, ypos + 25, 30, 15);
    ellipse(xpos + 30, ypos - 25, 30, 15);
    ellipse(xpos + 30, ypos + 25, 30, 15);
  }
  
  // move cars
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width + 50) {                             // when cars reach the end send 
      xpos = - 50;                                       // them back to the beginning and
      c = color(random(255), random(255), random(255));  // change colour
    }
    if (xpos < - 50) {
      xpos = width + 50;
      c = color(random(255), random(255), random(255));
    }  
    if (rectCircleIntersect(xpos, ypos, car_w, car_h, xpos_frog, ypos_frog, 10) == true) {
      paused = true;
      background(255);
      collision = true;
    }
  } 
  // collision detection
  boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

    float dx = abs(cx - rx);
    float dy = abs(cy - ry);

    if ( (dx <= (rw/2 + cr)) && (dy <= (rh/2 + cr)) ) { 
      return true;
    }
    else { 
      return false;
    }
  }
}

class Frog {
  color c = color(0, 255, 0);
  float speed; 

  Frog(float tempXpos, float tempYpos, float tempSpeed) {     
    xpos_frog = tempXpos;
    ypos_frog = tempYpos;
    speed = tempSpeed;
    frog_w = 20;
    frog_h = 20;
    result = 0;
  }
  // draw frog
  void display() {
    smooth();
    fill(20, 255, 100);
    ellipseMode(CENTER);
    ellipse(xpos_frog, ypos_frog, 20, 20);  
    ellipseMode(CENTER);
    fill(255);
    ellipse(xpos_frog + 5, ypos_frog - 7, 9, 9);
    ellipse(xpos_frog - 5, ypos_frog - 7, 9, 9);
    fill(0);   
    ellipse(xpos_frog + 5, ypos_frog - 7, 3, 3);
    ellipse(xpos_frog - 5, ypos_frog - 7, 3, 3);
  } 
  // move frog 
  void move() {
    switch(result) {
    case NORTH: 
      ypos_frog = ypos_frog - speed; 
      break;
    case EAST: 
      xpos_frog = xpos_frog + speed; 
      break;
    case SOUTH: 
      ypos_frog = ypos_frog + speed; 
      break;
    case WEST: 
      xpos_frog = xpos_frog - speed; 
      break;
    case NORTH|EAST: 
      ypos_frog = ypos_frog - speed;  
      xpos_frog = xpos_frog + speed; 
      break;
    case NORTH|WEST: 
      ypos_frog = ypos_frog - speed; 
      xpos_frog = xpos_frog - speed; 
      break;
    case SOUTH|EAST:  
      ypos_frog = ypos_frog + speed;  
      xpos_frog = xpos_frog + speed; 
      break;
    case SOUTH|WEST:  
      ypos_frog = ypos_frog + speed; 
      xpos_frog = xpos_frog - speed; 
      break;
    case BOOST|NORTH:
      ypos_frog = ypos_frog - 3;
      break;
    case BOOST|NORTH|EAST: 
      ypos_frog = ypos_frog - 3;  
      xpos_frog = xpos_frog + 3; 
      break;
    case BOOST|NORTH|WEST: 
      ypos_frog = ypos_frog - 3; 
      xpos_frog = xpos_frog - 3;
    }
  }
}

void keyPressed() {
  switch(key) {
    case('w'):
    case('W'):
    result |=NORTH;
    break;
    case('d'):
    case('D'):
    result |=EAST;
    break;
    case('s'):
    case('S'):
    result |=SOUTH;
    break;
    case('a'):
    case('A'):
    result |=WEST;
    break;
    case('r'):
    restart = true;
    break;
    case(' '):
    result |=BOOST;
    break;
  }
}
void keyReleased() {  
  switch(key) {
    case('w'):
    case('W'):
    result ^=NORTH;
    break;
    case('d'):
    case('D'):
    result ^=EAST;
    break;
    case('s'):
    case('S'):
    result ^=SOUTH;
    break;
    case('a'):
    case('A'):
    result ^=WEST;
    break;
    case(' '):
    result ^=BOOST;
    break;
  }
}



