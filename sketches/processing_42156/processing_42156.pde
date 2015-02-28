
int num = 50; // number of objects
int s =20; // size of objects in px

color[] c = new color[num]; // array for object colors
int [] x = new int [num]; // array for x coordinate
int [] y = new int [num]; // array for y

/*
setup method called once per sketch
 */
void setup() {
  size(500, 500);
  smooth();
  // initialize objects to random locations and colors
  for (int i = 0; i <num; i++) {
    x[i] = int(random(width));
    y[i] = int(random(height));
    c[i] = color(random(256), random(256), random(256));
  }
}

/*
draw method called once per frame
 */
void draw () {
  background(255); // white background
  // for each object ...
  for (int i = 0; i <num; i++) {
    // increment x to move objects to right 1px
    x[i]++;
    // if x is over right edge
    if (x[i]>width+s) {
      // reposition at left beyond edge
      x[i]=-s;
      // randomize y
      y[i]=int(random(height));
      // randomize color
      c[i]=color(random(256), random(256), random(256));
    }
    // draw loli
    lollipop(x[i], y[i], c[i]);
  }
}

/*
lollipop drawing function
 @param xx
 x coordinate
 @param yy
 y coordinate
 @parma col
 color of loli
 */
void lollipop(int xx, int yy, color col) {
  noStroke();
  // the loli
  fill(col);
  ellipse(xx, yy, s, s);
  // the stick
  stroke(0);
  strokeWeight(2);
  line(xx, yy, xx, yy+s);
}


