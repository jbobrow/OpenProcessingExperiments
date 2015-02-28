
class Ball {

  float x;       // x location of square 
  float y;       // y location of square 
  float speed;   // speed of square 
  float w;       // size
  int r = int(random(100, 255));
  int g = int(random(50, 150));
  int b = int(random(200, 255));

  // Ball constuctor
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }


  void display() {
    // Display the square 
    fill(r, g, b, 10); 
    stroke(255, 100); 
    ellipse(x,y,w,w); 
  }

  void update() {
    // Add speed to location
    y = y + speed; 

    // Add gravity to speed
    speed = speed + gravity; 

    // If square reaches the bottom 
    // Reverse speed 
    if (y < 0) { 
      speed = speed * -0.95;  
    } 
  }
}

