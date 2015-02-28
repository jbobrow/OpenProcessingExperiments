
/*
 * Recursive Hypotenuse
 * by Herbert Spencer
 * February 2014
 */

float ang;  // this is the global angle
int levels; // this is the amount of tree levels or how many times we will call the recursive function

void setup() {
  size(700, 700);
  noStroke();
  smooth();
  levels = 3;       // start with something small
  mouseX = width/2; // place the mouse in the middle
}

void draw() {
  // white background
  background(255);

  // the global angle can be modified by de 'x' movement of the mouse
  ang = map(mouseX, 0, width, -HALF_PI, 0); 

  // this is where we call the recursive function
  hypotenuse(width/2 - 50, height, width/2 + 50, height, levels);
}

// this is the recursive function
// it requeres 4 floats and 1 int. The floats represent the position of 2 points, which define the hypotenuse
// the level defines how many times are we calling this function recursevely

void hypotenuse(float x1, float y1, float x2, float y2, int level) {

  // determine the length, which is the distance between the points. We'll call it 'side', the side of the square
  float side = dist(x1, y1, x2, y2);

  // determine the angle between the two points... not so tricky
  float t = atan2(y2- y1, x2 - x1);

  // reset the coordinate system, just to be polite
  pushMatrix();
  {
    // translate our axis to the first point, our new (0,0)
    translate(x1, y1);

    // align space to the hypothenuse, using the angle we've just calculated
    rotate(t);

    // draw the square
    fill(col(level), 90); // nice color with transparency
    rect(0, -side, side, side);

    // translate to the new hypothenuse
    translate(0, -side);

    // determine the lengths of the triangle sides given a global angle 'ang'. 
    // 'a, b, c'; where 'c' is the hypotenuse. We have 'c', it's the distance between the first two points, ok?

    float a = cos(ang) * side;
    float b = sin(ang) * side;

    // draw the triangle
    noStroke();
    fill(col(level), 150);
    beginShape();
    {
      vertex(0, 0);                       // first vertex
      vertex(cos(ang) * a, sin(ang) * a); // tricky second vertex
      vertex(side, 0);                    // third vertex
    }
    endShape();

    // this is a method to eventually escape from this recursive fuction
    if (level > 0) {
      hypotenuse(0, 0, cos(ang) * a, sin(ang) * a, level-1);
      hypotenuse(cos(ang) * a, sin(ang) * a, side, 0, level-1);
    }
  }
  popMatrix();
}

void keyPressed() {

  // you can toggle the levels by hitting keys a-z
  if (key == 'a') {
    levels++;
  }
  if (key == 'z') {
    levels--;
  }

  // so we keep levels reasonable...
  levels = constrain(levels, 0, 16);

  // output to console how many levels do we have at the moment
  println("levels = "+levels);
}

color col(int level){
  int n = levels - level;
  float r = 18;
  float g = 134 + 11 * n;
  float b = 255 - 19 * n;
  color c = color(r,g,b);
  return c;
}


