
// Array Function:
// Append()
// shorten(), concat(), subset(), append(), splice(), expand()
// changing the order of array: sort(), reverse()

Ball[] balls = new Ball[1];
float gravity = 1.0;


void setup() {
  size(512, 512);
  smooth();
  
  // Initialize ball index to 0
  balls[0] = new Ball(250, 6, 15, color(255, 255, 100));
}

void draw() {
  background(0);
  
  // update the display all ball
  for(int i = 0; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
  }
}

void mousePressed() {
  // A new ball object
  float cr = mouseX*1;
  float cg = mouseY*1;
  float cb = dist(0, 0, mouseX, mouseY);
  float change = dist(0, 0, mouseX/30, mouseY/30);
  Ball b = new Ball(mouseX, mouseY, 10 + change, color(cr, cg, cb)); // 1) make new object at the mouse location
  
  // Append the array
  balls = (Ball[]) append (balls, b); // 2) Append() function - append add element 
                                      // at the end of the array. Append take two argument
                                      // 1 array you want to append to
                                      // 2 thing you want to append
                                      // You have to reassign the result of the append()
                                      // function to the original array. In addition,
                                      // the append() function requires that you explicitly
                                      // state the type of data in the array again by putting
                                      // the array data type in parenttheses "(Ball)", this is
                                     // known as "casting".  
}

class Ball {
  float x;
  float y;
  float speed;
  float w;
  color c;
  
  Ball(float xpos, float ypos, float tempW, color cc) {
    x = xpos;
    y = ypos;
    speed = 0;
    w = tempW;
    c = cc;
  }
  
  void gravity() {
    // add gravity to speed
    speed = speed + gravity;
  }
  
  void move() {
    // add speed to y location
    y = y + speed;
    // if square reach the buttom
    // reverse speed
    if (y > height ) {
      speed = speed * -0.95;
      y = height;
    }
  }
  
  void display() {
    // display the circle
    fill(c);
    noStroke();
    ellipse(x, y, w, w);
  }
}

