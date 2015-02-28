
// Example: Two Car objects
Car myCar1;
Car myCar2; // Two objects!
Car myCar3; 
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;
Car myCar8;
Car myCar9;
Car myCar10;
Car myCar11;
Car myCar12;

void setup() {
  size(400, 400);
  // set background color to white
  background(255);
  
  myCar1 = new Car(color(255,0,0),0,100,2); 
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(6,255,6),0,50,3);
  myCar4 = new Car(color(5,145,77),0,75,4);
  myCar5 = new Car(color(152,51,5),0,120,3);
  myCar6 = new Car(color(1,255,142),0,160,1);
  myCar7 = new Car(color(125,125,126),0,180,4);
  myCar8 = new Car(color(244,20,100),0,240,3);
  myCar9 = new Car(color(10,10,100),0,340,3);
  myCar10 = new Car(color(10,10,10),0,267,2);
  myCar11 = new Car(color(10,167,69),0,290,6);
  myCar12 = new Car(color(112,200,30),0,305,2);
              
}
//big ball
int dx = 5;
int dy = 4;

int x = 50;
int y = 50;

//rectangle

int rectY = 50;
int rectX = 150;

int drectx = 2;
int drecty = 3;


//more balls
int ballx = 200;
int bally = 300;

int dballx = 6;
int dbally = 7;


//last ball
int lastballx = 360;
int lastbally = 360;

int dlastx = 4;
int dlasty = 5;


void draw() {

  //pong rect
  fill(255);
  background(255);
  myCar1.drive();
  myCar1.display();
  myCar2.drive();
  myCar2.display();
  myCar3.drive();
  myCar3.display();
  myCar4.drive();
  myCar4.display();
  myCar5.drive();
  myCar5.display();
  myCar6.drive();
  myCar6.display();
  myCar7.drive();
  myCar7.display();
  myCar8.drive();
  myCar8.display();
  myCar9.drive();
  myCar9.display();
  myCar10.drive();
  myCar10.display();
  myCar11.drive();
  myCar11.display();
  myCar12.drive();
  myCar12.display();

  //ball
  for (int i=0; i<1; i++) {
    fill(255, 100, 200);
    ellipse(x, y+ i, 65, 65);
  }

  for (int i=0; i<1; i++) {
    fill(150, 150, 200);
    ellipse(x, y+ i, 55, 55);
  }

  for (int i=0; i<1; i++) {
    fill(0, 0, 225);
    ellipse(x, y+ i, 45, 45);
  }

  for (int i=0; i<1; i++) {
    fill(6, 255, 6);
    ellipse(x, y+ i, 35, 35);
  }

  for (int i=0; i<1; i++) {
    fill(255, 255, 6);
    ellipse(x, y+ i, 25, 25);
  }


  for (int i=0; i<1; i++) {
    fill(255, 6, 6);
    ellipse(x, y+ i, 15, 15);
    
    

    
  }

  //rectangle
  for (int i=0; i<1; i++) {
    fill(6, 255, 6);
    rect(rectX, rectY+ i, 25, 25, 5);
  }


  //more balls
  for (int i=0; i<1; i++) {
    fill(0, 0, 255);
    ellipse(ballx, bally+ i, 20, 20);
  //a ball within a ball
  for (int k=0; k<1; k++) {
    fill(255, 255, 6);
    ellipse(ballx, bally+ i, 10, 10);
    }
  }

  //last ball
  for (int i=0; i<1; i++) {
    fill(255, 0, 0);
    ellipse(lastballx, lastbally+i, 35, 35);
    
  for (int D=0; D<1; D++) {
    fill(6, 255, 6);
    ellipse(lastballx, lastbally+ i, 25, 25);
    
  for (int Z=0; Z<1; Z++) {
    fill(255, 255, 6);
    ellipse(lastballx, lastbally+ i, 15, 15);
  }
  }
  }

  //big ass ball
  x = x + dx;
  y = y + dy;

  //individual rect
  rectX = rectX + drectx;
  rectY = rectY + drecty;

  //more balls
  bally = bally + dbally;
  ballx = ballx + dballx;

  //last ball
  lastbally = lastbally + dlasty;
  lastballx = lastballx + dlastx;



  //for the big ball
  if ( x < 10 || x > 380) {
    dx = -1 * dx;
  }
  if ( y < 10 || y > 385) {
    dy = -1 * dy;
  }


  //more balls

  if ( ballx < 10 || ballx > 380) {
    dballx = -1 * dballx;
  }
  if ( bally < 10 || bally > 385) {
    dbally = -1 * dbally;
  }

  //for the individual rect

  if ( rectX < 10 || rectX > 380) {
    drectx = -1 * drectx;
  }
  if ( rectY < 10 || rectY > 385) {
    drecty = -1 * drecty;
  }

  //last ball
  if ( lastballx < 10 || lastballx > 380) {
    dlastx = -1 * dlastx;
  }
  if ( lastbally < 10 || lastbally > 385) {
    dlasty = -1 * dlasty;
  }
}

class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
