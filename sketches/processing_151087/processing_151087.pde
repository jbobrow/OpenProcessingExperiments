

float x, y;

void setup() {
  size(500, 500);
  background(255);
  smooth();
}


void draw() {
  background(255);
  draw_grid(); // draw the background grid
  draw_circ(); // draw the background trigo circle


  translate(width/2, height/2);
  fill(0);
  draw_angles(); // draw remarkable angles on the trigo circle

  // use mouse position as the expression of an angle
  // and calculate its cartesian coordinates
  x= cos(radians(map(mouseX*2, 0, width, 360, 00)))*150; 
  y= sin(radians(map(mouseX*2, 0, height, 360, 00)))*150;

  // calculate back the angle (a little tricky)
  float angle ;
  if (y<0) angle = acos(map(x, -150, 150, -1, 1));
  else angle = - acos(map(x, -150, 150, -1, 1));

  // projection of the angle on x-axis, when normalized it gives the cos value of the angle
  stroke(0, 255, 255);
  strokeWeight(5);
  line (0, 0, x, 0);
  // projection of the angle on y-axis, when normalized it gives the sin value of the angle
  stroke(255, 0, 255);
  strokeWeight(5);
  line (x, 0, x, y);

  // draw the angle
  stroke(255, 255, 0);
  strokeWeight(2);
  line (0, 0, x, y);
  // point of intersection between angle and circle
  noStroke();
  fill(0);
  ellipse(x, y, 10, 10);

  resetMatrix();
  
  // display info
  fill(0);
  text("x = " +int(x), 10, 10);
  fill(0);
  text("y = " +int(y), 10, 30);
  fill(0);
  text("angle radians =" + angle, 10, 50);
  text("angle degrees =" + int(degrees(angle)), 10, 70);
  fill(0, 255, 255);
  text("cos =" +cos(angle), 10, 90);
  fill(255, 0, 255);
  text("sin =" +sin(angle), 10, 110);
}



void draw_grid() {
  int i = 0;
  while (i<width) {
    stroke(125, 80);
    strokeWeight(1);
    line(i, height, i, 0);
    line(0, i, width, i);
    i=i+50;
  }
  strokeWeight(2);
  stroke(180);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
}

void draw_circ() {
  noFill();
  stroke(180, 0, 0);
  strokeWeight(2);
  ellipse(width/2, height/2, 300, 300);
}


void draw_angles() {
  float ex = 150*cos(0);
  float wy =  150 * sin (0); 
  ellipse(ex, wy, 10, 10);
  text("0", ex + 10, wy);

  ex = 150*cos(-PI/6);
  wy =  150 * sin (-PI/6); 
  ellipse(ex, wy, 10, 10);
  text("PI/6", ex + 10, wy);

  ex = 150*cos(-PI/4);
  wy =  150 * sin (-PI/4);
  ellipse(ex, wy, 10, 10);
  text("PI/4", ex + 10, wy);

  ex = 150*cos(-PI/3);
  wy =  150 * sin (-PI/3);
  ellipse(ex, wy, 10, 10);
  text("PI/3", ex + 10, wy);

  ex = 150*cos(-PI/2);
  wy =  150 * sin (-PI/2);
  ellipse(ex, wy, 10, 10);
  text("PI/2", ex + 10, wy);

  ex = 150*cos(-PI);
  wy =  150 * sin (-PI);
  ellipse(ex, wy, 10, 10);
  text("PI", ex + 10, wy);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("trigo.png");
  }
}

