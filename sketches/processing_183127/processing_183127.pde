
class Ball {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random(15,-10);
    yspeed = random(15,5);
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > 270 || x < 30 ) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > 420 || y < 30) {
      yspeed *= - 1;
    }
  }
  
  // Draw the ball
  void display() {
    noStroke();
    fill(#c6ed2c);
    ellipse(x,y,r,r);
  }
}

// Two ball variables
Ball ball1;
Ball ball2;

void setup() {
  size(300,450);
  smooth();
  
  // Initialize balls
  ball1 = new Ball(32);
  ball2 = new Ball(32);
}

void draw() {
  background(#0000bf);
  strokeWeight(30);
  stroke(#ff0066);
  line(0,0,0,450);
  line(0,450,300,450);
  line(300,450,300,0);
  line(300,0,0,0);
  
  //air dots
  noStroke();
  color(#ffffff);
  smooth();
  ellipse(50,50,4,4);
  ellipse(50,100,4,4);
  ellipse(50,150,4,4);
  ellipse(50,200,4,4);
  ellipse(50,250,4,4);
  ellipse(50,300,4,4);
  ellipse(50,350,4,4);
  ellipse(50,400,4,4);
  ellipse(100,50,4,4);
  ellipse(100,100,4,4);
  ellipse(100,150,4,4);
  ellipse(100,200,4,4);
  ellipse(100,250,4,4);
  ellipse(100,300,4,4);
  ellipse(100,350,4,4);
  ellipse(100,400,4,4); 
  ellipse(150,50,4,4);
  ellipse(150,100,4,4);
  ellipse(150,150,4,4);
  ellipse(150,200,4,4);
  ellipse(150,250,4,4);
  ellipse(150,300,4,4);
  ellipse(150,350,4,4);
  ellipse(150,400,4,4);  
  ellipse(200,50,4,4);
  ellipse(200,100,4,4);
  ellipse(200,150,4,4);
  ellipse(200,200,4,4);
  ellipse(200,250,4,4);
  ellipse(200,300,4,4);
  ellipse(200,350,4,4);
  ellipse(200,400,4,4);
  ellipse(250,50,4,4);
  ellipse(250,100,4,4);
  ellipse(250,150,4,4);
  ellipse(250,200,4,4);
  ellipse(250,250,4,4);
  ellipse(250,300,4,4);
  ellipse(250,350,4,4);
  ellipse(250,400,4,4);
  
    //pits
  strokeWeight(45);
  stroke(#c600ee);
  line(120,0,180,0);
  line(120,450,180,450);
  strokeWeight(3);
  stroke(#ffffff);
  noFill();
  line(0,225,300,225);
  ellipse(150,225,75,75);
  
  // Move and display balls
  ball1.move();
  ball2.move();
  ball1.display();
  ball2.display();
}


