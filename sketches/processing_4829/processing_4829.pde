
/**
 circle_driver is a sketch to illustrate the use of variables
 (including system variables like frameCount, key, and keyCode),
 and conditionals (if statement and constrain function).
 
 - Use the arrow keys to move the circle around.
 - Use the '[' and ']' keys to decrease and increase the circle's
   speed, which is indicated by the red bar.
 - Use the '+' and '-' keys to increase and decrease the circle's
   diameter.
*/

int x = 50;
int y = 50;
int diameter = 10;
int speed = 1;

void setup() {
  size(300, 300);
  frameRate(30);
  smooth();
}

void draw() {
  background(frameCount % 256);

  // speedometer
  noStroke();
  fill(255, 0, 0);
  rect(0, 0, speed * 30, 10);
  
  // circle
  strokeWeight(diameter/5);
  stroke(50);
  fill(150);
  ellipse(x, y, diameter, diameter);
}

void keyPressed() {
  println("Keycode: " + keyCode + ", Key: " + key);

  // direction keys
  if (keyCode == 38) { // up
    y = y - speed;
  } else if (keyCode == 40) { // down
    y = y + speed;
  }
  if (keyCode == 37) { // left
    x = x - speed;
  } else if (keyCode == 39) { // right
    x = x + speed;
  }

  // speed
  else if (key == '[') { // slow down
    speed = speed - 1;  
  } else if (key == ']') { // speed up
    speed = speed + 1;
  }
  
  // change size
  else if (key == '+') { // enlarge
    diameter = diameter + 1;
  } else if (key == '-') { // shrink
    diameter = diameter - 1;
  }
  
  // constrain variables
  x = constrain(x, 0, width);
  y = constrain(y, 0, height);
  speed = constrain(speed, 1, 10);
  diameter = constrain(diameter, 2, 50);
}


