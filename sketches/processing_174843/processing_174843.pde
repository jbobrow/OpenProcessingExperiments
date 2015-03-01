
Car myCar1;
Car myCar2;
Car myCar3;
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;
Ball ball9;
Ball ball10;
int speed = 5;
int dir;
float x;  
int index = 0;


void setup(){
    cursor();

  size(600, 600);
  x = width; 

  
  ball1 = new Ball(35);
  ball2 = new Ball(35);
  ball3 = new Ball(35);
   ball4 = new Ball(35);
  ball5 = new Ball(35);
   ball6 = new Ball(35);
  ball7 = new Ball(35);
  ball8 = new Ball(35);
  ball9 = new Ball(35);
  ball10 = new Ball(35);

 


 myCar1 = new Car(50, (int)random(3,10));
 myCar2 = new Car(250, (int)random(3,10));
  myCar3 = new Car(450, (int)random(3,10));
  dir = 1;
  if(random(10) > 1){
    dir = -1;
  }

}

void draw(){


   int nmouse = 0;
  float n = mouseX;
  float d = mouseY;

 ellipse(n-20, d, 20, 20);
 fill(0);
 stroke(-50);
  if (mousePressed){
    cursor();
     
    }
  else {
    noCursor();
   
    }

 
 noStroke();
  ellipse(250, 250, 650, 650);
     fill(0);
stroke(-50);

  if(mousePressed){

   
    ball1.highlight();
    ball2.highlight(); 
    ball3.highlight();
    ball4.highlight();
    ball5.highlight();
  ball6.highlight();
    ball7.highlight();
    ball8.highlight();
    ball9.highlight();
    ball10.highlight();

  }
  
 // background(#4169E1    );
  background(0);
   
    fill(#2245F0);
    ellipse(300, 300, 600, 600);
 noStroke();
  ball1.move();
  ball2.move();
  ball3.move();
  ball4.move();
  ball5.move();
  ball6.move();
  ball7.move();
  ball8.move();
  ball9.move();
  ball10.move();


  if(myCar1.x < 0 || myCar1.x > width){
    dir = -dir;
    myCar1.wonGame();
  }
  if(myCar2.x < 0 || myCar2.x > width){
    dir = -dir;
    myCar2.wonGame();
  }
  if(myCar3.x < 0 || myCar3.x > width){
    dir = -dir;
    myCar3.wonGame();
  }
  if (ball1.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball1.changeDir();
  }
  if (ball2.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball2.changeDir();
  }
  if (ball1.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball1.changeDir();
  }
  if (ball2.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball2.changeDir();
  }
  if (ball1.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball1.changeDir();
  }
  if (ball2.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball2.changeDir();
  }
  
  if (ball3.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball3.changeDir();
  }
  if (ball3.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball3.changeDir();
  }
  if (ball3.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball3.changeDir();
  }
  
    if (ball4.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball4.changeDir();
  }
  if (ball4.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball4.changeDir();
  }
  if (ball4.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball4.changeDir();
  }
  
    if (ball5.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball5.changeDir();
  }
  if (ball5.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball5.changeDir();
  }
  if (ball5.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball5.changeDir();
  }
  
      if (ball6.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball6.changeDir();
  }
  if (ball6.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball6.changeDir();
  }
  if (ball6.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball6.changeDir();
  }
  
  
      if (ball7.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball7.changeDir();
  }
  if (ball7.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball7.changeDir();
  }
  if (ball7.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball7.changeDir();
  }
  
      if (ball8.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball8.changeDir();
  }
  if (ball8.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball8.changeDir();
  }
  if (ball8.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball8.changeDir();
  }
      if (ball9.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball9.changeDir();
  }
  if (ball9.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball9.changeDir();
  }
  if (ball9.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball9.changeDir();
  }
  
      if (ball10.intersect(myCar1)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball10.changeDir();
  }
  if (ball10.intersect(myCar2)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball10.changeDir();
  }
  if (ball10.intersect(myCar3)) { // New! An object can have a function that takes another object as an argument. This is one way to have objects communicate. In this case they are checking to see if they intersect.
    ball10.changeDir();
  }
  
  
  
  myCar1.move(dir);    
  myCar2.move(dir);    
  myCar3.move(dir); 
  myCar1.display();
  myCar2.display();
  myCar3.display();
  ball1.display();
  ball2.display();
  ball3.display();
  ball4.display();
  ball5.display();
  ball6.display();
  ball7.display();
  ball8.display();
  ball9.display();
  ball10.display();

}


 




class Car {
  int x;
  int y;
  float speed;
  color myFill;

  Car(int tempy, float tempspeed) {
    x = 100;
    y = tempy;
    speed = tempspeed;
    myFill = color(255, 255, 255);
  }

  void move(int dir) {
    x+=speed * dir;
    wonGame();
  }
  void display() {
    fill(myFill);
    rect(x, y, 100, 100);
    
  }
 void wonGame() {

   myFill = color(random(255), random(255), random(255), 100);
 }
   
   void draw(){
      if(x < 0 || x > 200){
      dir = -dir;
      }
      move(dir);
      display();
   }
}



class Ball {
  
  float r; 
  float x,y;
  float xspeed,yspeed;
  color c = color(100,50);

  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( -5,5);
    yspeed = random( -5,5);
  
}
  
  void changeDir(){
    xspeed *= - 1;
    yspeed *= - 1;
  }
  
  void move() {
    x += xspeed; 
    y += yspeed; 
        if (x > width || x < 0) {
      xspeed *= - 1;
    }
    
    // Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  void highlight() { 
    noStroke();
    c = color(random(255), random(255), random(255));
  }
  

  void display() {
    stroke(0);
    fill(c);
    ellipse(x,y,r*2,r*2);
    c = color(100,50);
    stroke(-50);
  }
  
 
  boolean intersect(Ball b) {
    
    float distance = dist(x,y,b.x,b.y); 
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  }
 boolean intersect(Car b) {
    float distance = dist(x,y,b.x,b.y); 
    if (distance < r + 50) {
      return true;
    } else {
      return false;
    }
      }
}



