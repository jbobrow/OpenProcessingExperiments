
int numBalls = 200;
Ball[] b = new Ball[numBalls]; //declare the object
int right, left, top, bottom, margin, spacing,buffer;
float rotate;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  for (int i = 0; i <numBalls; i++) {
    b[i] = new Ball(random(width), random(height), 30);
  }
  spacing = 100;
  buffer = spacing + 60;
  margin = 100;
  right = width - margin-300;
  left = 0 + margin-300;
  top = 0 + margin-300;
  bottom = height - margin-300;
}

void draw() {
  background(255);
  translate(width/2,height/2);
  rotate(rotate+=.008);
  println(rotate);
  for (int i = 0; i <numBalls; i++) {
    b[i].display();
    b[i].grow();
    b[i].col();
    b[i].move();
  }
  
  /*
  //box
  stroke(255, 0, 0);
  line(100, 100, width-100, 100);
  line(200, 200, width-200, 200);
  line(100, 500, height-100, 500);
  line(200, 400, width-200, 400); 
  line(200, 200, 200, 400);
  line(400, 200, 400, 400);
  line(100, 100, 100, 500);
  line(500, 100, 500, 500);
  */



  noStroke();
}
class Ball {
  float x, y, vx, vy, friction;
  float diameter;
  boolean grow;

  Ball(float xpos, float ypos, float dia) {
    x = xpos;
    y = ypos;
    diameter = dia;
    vx = random(1, 2);
    vy= random(1, 2);
    friction=-.9;
  }
  void display() {
    ellipse(x, y, diameter, diameter); 
    //println(grow + " " + diameter);
  }

  void move() {
    x += vx;
    y += vy;
    
    //rigth outer wall
    if (x + diameter/2 > right) {
      x = right - diameter/2;
      vx *= friction;
    }
    //left inner wal*
    if (x + diameter/2 > left + spacing &&  x + diameter/2 < left + buffer && y + diameter/2 > top + spacing && y + diameter/2 < bottom - spacing) {
      x = left + spacing - diameter/2;
      vx *= friction;
    }

    //left outer wall
    if (x -diameter/2 < left ) {
      x = left + diameter/2;
      vx *= friction;
    }
    //right innner wall
    if (x -diameter/2 < right-spacing && x -diameter/2 > right-buffer && y -diameter/2 > top+spacing && y -diameter/2 < bottom-spacing) {
      x = right-spacing + diameter/2;
      vx *= friction;
    }

    // top wall
    if (y -diameter/2 < top ) {
      y = top + diameter/2;
      vy *= friction;
    }
    //inner bottom wall
    if (y -diameter/2 < bottom-spacing && y -diameter/2 > bottom-buffer && x -diameter/2 > left+spacing && x -diameter/2 < right-spacing) {
      y = bottom-spacing + diameter/2;
      vy *= friction;
    }

    //bottom wall
    if (y + diameter/2 > bottom ) {
      y = bottom - diameter/2;
      vy *= friction;
    }
    //top inner wall
    if (y + diameter/2 > top+spacing && y + diameter/2 < top + buffer && x + diameter/2 > left+spacing && x + diameter/2 < right-spacing) {
      y = top+spacing - diameter/2;
      vy *= friction;
    }
  }
  void grow() {

    if (grow) {
      diameter+=random(1, 2);
    }
    if (!grow) {
      diameter-=2;
    }
    if (diameter > random(50, 80)) {
      grow = false;
    }
    if (diameter < random(10, 30)) {
      grow = true;
    }
  }
  void col() {
    fill(map(diameter, 30, 80, 40, 255),0,0);
  }
}



