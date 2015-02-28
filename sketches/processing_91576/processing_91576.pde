
/**
 * Generative Art Using Random Variables.
 *
 * Block class is a good example of a simple object
 * class with properties and actions.
 *
 * Phillip Corcoran
 */
Block block;

void setup() {
  size(floor(random(200, 500)), floor(random(200, 500)));
  block = new Block(color(random(255), random(255), random(255)), random(500), random(500), 2);
}

void draw() {
  background(102);
  block.drive();
  block.display();
  variableEllipse(floor(random(0, 500)), floor(random(0, 500)), floor(random(0, 500)), floor(random(0, 500)));
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}


class Block {
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Block(color tempC, float tempXpos, float tempYpos, float tempXspeed) {    
    c = tempC;   
    xpos = tempXpos;   
    ypos = tempYpos;   
    xspeed = tempXspeed;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 40, 20);
  }

  void drive() {
    int r1;
    int r2;
    if (xpos < width && xpos != width) {
      xpos = xpos + xspeed;  
      ypos = ypos + xspeed;
      //println("1[" + xpos + "," + ypos + "]");
    } 
    else {
      r1 = floor(random(0, width));
      r2 = floor(random(0, height));

      if (r1 >= 0 && r2 <= height) {
        xpos = r1; 
        ypos = r2;
        //println("2[" + r1 + "," + r2 + "]");
      }
    }
  }
}



