
// ten balls to start.
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
Ball ball11;
Ball ball12;
Ball ball13;
Ball ball14;
Ball ball15;
Ball ball16;
Ball ball17;
Ball ball18;
Ball ball19;
Ball ball20;

//Global gravity variable
float gravity = 0.1;  

// starting to create a screen wide desktop with 2000 width maybe 1200 high
void setup() {
  size(1500,750);
  smooth();
  background(255);
  
  ball1 = new Ball(100,0,25);
  ball2 = new Ball(50,50,50);
  ball3 = new Ball(150,10,75);
  ball4 = new Ball(1200,20,10);
  ball5 = new Ball(750,50,99);
  ball6 = new Ball(300,350,50);
  ball7 = new Ball(365,0,50);
  ball8 = new Ball(410,30,950);
  ball9 = new Ball(560,20,50);
  ball10 = new Ball(1000,0,50);
  ball11 = new Ball(1100,0,25);
  ball12 = new Ball(1050,50,50);
  ball13 = new Ball(1150,10,75);
  ball14 = new Ball(1800,20,10);
  ball15 = new Ball(1750,50,2);
  ball16 = new Ball(1300,350,50);
  ball17 = new Ball(1365,0,50);
  ball18 = new Ball(1410,30,50);
  ball19 = new Ball(1560,20,150);
  ball20 = new Ball(1900,0,50);

}

void draw() {
    background(0);

  // Display the ball objects (10 right now)
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
  ball11.display();
  ball12.display();
  ball13.display();
  ball14.display();
  ball15.display();
  ball16.display();
  ball17.display();
  ball18.display();
  ball19.display();
  ball20.display();
  
  // Moving the balls
  ball1.update();
  ball2.update();
  ball3.update();
  ball4.update();
  ball5.update();
  ball6.update();
  ball7.update();
  ball8.update();
  ball9.update();
  ball10.update();
  ball11.update();
  ball12.update();
  ball13.update();
  ball14.update();
  ball15.update();
  ball16.update();
  ball17.update();
  ball18.update();
  ball19.update();
  ball20.update();
}

class Ball {
  float x;       // x location of square 
  float y;       // y location of square 
  float speed;   // speed of square 
  float w;       // size
 
  // Ball Constructor??
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed =0;
  }
  
  void display() {
    fill (random(255),random(100),random(245),50);
    noStroke();
    ellipse(x,y,w,w);
  }
  
  void update() {
  
    // Add speed to location.
    y = y + speed;
  
    // Add gravity to speed.
    speed = speed + gravity;
  
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
      speed = speed * -0.95;  
    }
  }
}

