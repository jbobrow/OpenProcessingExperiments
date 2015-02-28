
/*
Katie Manduca
 
 My goal was to make a piece of artwork based on an input stream of date from an EEG headset. 
 Changes in mental state, as seen in changing readings from the headset, would create a dynamic artform. 
 To achieve this, I first created a 3D sphere of points. The sphere consisted of a number of circles
 spun around the Y axis. This meant that I could give each circle an input stream from an EEG sensor, and 
 the total sphere would be distorted to reflect the EEG reading. A higher reading from the sensor resulted
 in a larger diameter of the circle, as well as less transparent and larger dots. The color of each 
 circle was determined by the rotation around the Y axis, which allows the viewer to see the different
 circles. This also means that sensors that are closer together have similar colors.
 */

// how many dots make up a circle
int NUM_DIVISIONS = 200;
// how many circles make up a sphere
int NUM_SENSORS = 14;
// keep track of the value from each sensor
float[] sensors;
// names of the sensors
String[] names = {
  "AF3", "F7", "F3", "FC5", "T7", "P7", "O1", "O2", "P8", "T8", "FC6", "F4", "F8", "AF4"
};
// variables to read input data
Table table;
int row;


/**
 set up the canvas and read the input data
 **/
void setup() {
  // set up 3D canvas
  size(600, 600, P3D);
  // set the hue range to 2 PI
  colorMode(HSB, TWO_PI, 100, 100);
  background(0, 0, 0);
  noFill();
  // slow down the frame rate to ease the strobe effect
  frameRate(3);

  // read input data
  sensors = new float[NUM_SENSORS];
  row = 1;
  table = loadTable("math_clean.csv", "header");
  //table = loadTable("dance_clean.csv", "header");
}

/**
 draw sphere based on a single reading from input data
 **/
void draw() {
  // update background
  background(0, 0, 0);
  // center the shape in the canvas and rotate for better view
  translate(width/2, height/2);
  rotateZ(PI/6);
  rotateX(PI/6);

  // read next reading from EEG data
  for (int i = 0; i < NUM_SENSORS; i++) {
    sensors[i] = table.getRow(row).getFloat(i);
  }
  row++;

  // draw the sphere
  Point[] points;
  float r, w, a;
  for (int i = 0; i < NUM_SENSORS; i++) {
    // rotate around the Y axis and draw a circle for each sensor
    rotateY(TWO_PI/NUM_SENSORS);
    // check for missing values
    if (sensors[i] == 0 )
      sensors[i] = 4500;

    // choose the radius, the weight, and the alpha value for the circle based on the value
    r = map(sensors[i], 3500, 5000, 20, 300);
    w = map(sensors[i], 3500, 5000, 1, 6);
    a = map(sensors[i], 3500, 5000, 20, 80);
    // create the circle
    points = circle(r, w);
    for (Point p : points) {
      p.setColor(color(i * TWO_PI/NUM_SENSORS, 100, 100, a));
      //p.setColor(color(sin(map(sensors[i], 0, 100, 0, TWO_PI)) + 1, 100, 100));
      p.paint();
    }
  }
}

/**
 creates a circle of points with radius r and stroke weight w centered at the current origin
 returns an array of points making up the circle
 **/
Point[] circle(float r, float w) {
  Point[] c = new Point[NUM_DIVISIONS];
  float angle = TWO_PI / NUM_DIVISIONS;

  for (int i = 0; i < NUM_DIVISIONS; i++) {
    float x1 = cos(angle * i) * r;
    float y1 = sin(angle * i) * r;

    c[i] = new Point(x1, y1, 0);
    c[i].setWeight(w);
  }
  return c;
}

/**
 helper function for 3D debugging
 draws the X, Y, and Z axes on the screen
 **/
void drawAxis() {
  stroke(255, 0, 0);
  line(0, 0, 0, 10, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 10, 0);
  stroke(0);
  line(0, 0, 0, 0, 0, 10);
}

/**
 helper class containing the information for each point making up the sphere
 **/
class Point {

  // each point has x, y, z coordinates as well as color and weight properties
  float x;
  float y;
  float z;
  color c;
  float weight;

  //constructor based on location, default color is light blue
  Point(float x1, float y1, float z1) {
    x = x1;
    y = y1;
    z = z1;
    c = color(0, 100, 200);
    weight = 3;
  }

  // draw the point to the screen
  void paint() {
    stroke(c);
    strokeWeight(weight);
    point(x, y, z);
  }

  // set the weight of the point
  void setWeight(float w) {
    weight = w;
  }

  // set the color of the point
  void setColor(color c1) {
    c = c1;
  }
}



