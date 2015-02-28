
// 1) allow the user to change the ball size by typing the number keys
// 2) -extra credit- 
//    use the UP and DOWn arows to change the vert speed
//    use the LEFT and RIGHT arrows to change the horiz speed

Ball b1; // Declare the object
class Ball { // Define the class
  float xpos, ypos, diam, radius; // x position, y position, diameter, radius
  float dx, dy; // horiz speed, vert speed


  Ball(float x, float y, float ds, float h, float v) { // Constructor for the object 
    xpos = x;
    ypos = y;
    diam = ds;
    dx = h;
    dy = v;
  } 
  void display() { // Method (function) to display the object
     fill(255,80);
     stroke(0);
    ellipse(xpos, ypos, diam, diam);
    
  } // end display
  void animate() { // move by itself and bounce off sides
    // calculate radius from diameter
    radius = diam/2;
    
    // change xpos
    xpos += dx;
    if (xpos>width-radius || xpos<0+radius) {
      dx *= -1;
    }
    //change ypos
    ypos += dy;
    if (ypos>height-radius || ypos<0+radius) {
      dy *= -1;
    }
  } // end animate
  
  }

void setup() {
  size(400, 300);
  b1 = new Ball(100, 100, 50, 3, -1); // Construct the object
   
}

void draw() {  
  background(255);
  
  b1.display();
  b1.animate();
  
  }
void keyPressed() {
  if(b1.xpos >= width-b1.diam){
    b1.xpos = width/2;
  }
  if(b1.ypos >= height-b1.diam){
    b1.ypos = height/2;
  }
  if(b1.xpos <= 0+b1.diam){
    b1.xpos = width/2;
  }
  if(b1.ypos <= 0+b1.diam){
    b1.ypos = height/2;
  }
  
  if (key == '1') {
      b1.diam = 25;

  } 
  if (key == '2'){
      b1.diam = 50;
}
  if (key == '3'){
    b1.diam = 75;
}
  if (key == '4'){
      b1.diam = 100;
}
  if (key == '5'){
      b1.diam = 125;
}
  if (key == '6'){
      b1.diam = 150;
  }
if (keyCode == LEFT){
  b1.dx = b1.dx *.5;
}

if (keyCode == RIGHT){
  b1.dx = b1.dx *2;
}

if (keyCode == UP){
  b1.dy = b1.dy *2;
}

if (keyCode == DOWN){
  b1.dy = b1.dy *.5;
}
}
