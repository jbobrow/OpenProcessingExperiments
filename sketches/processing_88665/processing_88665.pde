
// A PVector holds three values, and allow operations 
// such as adding and multiplying vectors.

PVector pos;     // ship's position
PVector speed;   // ship's speed
PVector accel;   // ship's acceleration
float direction; // ship's direction

void setup() {
  size(400, 400);
  pos = new PVector(width/2, height/2, 0);
  speed = new PVector();
  accel = new PVector();
}

void draw() {
  // check for input
  checkKeys();
  
  background(0);
  drawText();
  
  
  speed.add(accel);  // add the current acceleration to the current speed
  pos.add(speed);    // add the current speed to the current position
  
  drawShip();

  accel.set(0, 0, 0);                     // reset the acceleration
  if (speed.mag() != 0) speed.mult(0.99); // decay speed (drag effect)
  
  
  // wrap the ship's position around the screen 
  if (pos.x<0) {
      pos.x = pos.x+width;
    }
    if (pos.x>width) {
      pos.x = 0;
    }
    if (pos.y<0) {
      pos.y = pos.y+height;
    }
    if (pos.y>height) {
      pos.y = 0;
    }
}

void checkKeys() {
  
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      direction-=0.1;
    }
    else if (keyCode == RIGHT) {
      direction+=0.1;
    }
    else if (keyCode == UP) {
      float totalAccel = 0.2;                 // how much the ship accelerates
      accel.x = totalAccel * sin(direction);  // total acceleration's X component
      accel.y = -totalAccel * cos(direction); // total acceleration's Y component
    }
  }
}

void drawShip() {
  pushMatrix();
  
  // use the ship's position and direction when drawing it
  translate(pos.x, pos.y);
  rotate(direction);
  
  noStroke();
  
  // draw the ship as a white triangle
  fill(255);  
  triangle(-10, 20, 10, 20, 0, -20); 
  
  // if the ship is accelerating, draw the thruster
  if (accel.mag() != 0) {
    // use a random color value so that the thruster is flickering 
    float thrusterCol = random(0,255);
    fill(thrusterCol, thrusterCol/2, 0);
    triangle(-5, 22, 5, 22, 0, 40); 
  }

  popMatrix();  
}

void drawText() {
  fill(150);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Spaceship inertia a la Asteroids\nUse LEFT and RIGHT arrows to rotate.\nUse UP arrow to thrust.", width/2, height/2); 
}
