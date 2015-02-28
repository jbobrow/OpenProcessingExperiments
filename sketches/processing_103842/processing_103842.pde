
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 8-5: Rewrite the gravity example from Chapter 5 using objects with a Ball class. 
// Include two instances of a Ball object.

// Two ball objects
Ball ball1;
Ball ball2;
Ball ball3;

// Global gravity variable
float gravity = 0.1;  

  void setup() { 
  size(500,500); 
  smooth();
  
  // Create ball objects
  ball1 = new Ball(50,0,16);
  ball2 = new Ball(100,50,32);
  ball3 = new Ball(300, 0, 100);
} 

void draw() { 
  background(255); 
  
  // Display ball objects
  ball1.display();
  ball2.display();
  ball3.display();


  // Move ball objects
  ball1.update();
  ball2.update();
  ball3.update();

} 

class Ball {

  float x;       // x location of square 
  float y;       // y location of square 
  float speed;   // speed of square 
  float w;       // size

  // Ball constuctor
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }


  void display() {
    // Display the square 
    fill(175); 
    stroke(0); 
    ellipse(x,y,w,w); 
  }

  void update() {
    // Add speed to location
    y = y + speed; 

    // Add gravity to speed
    speed = speed + gravity; 

    // If square reaches the bottom 
    // Reverse speed 
    if (y > height) { 
      speed = speed * -0.95;  
    } 
  }
}
