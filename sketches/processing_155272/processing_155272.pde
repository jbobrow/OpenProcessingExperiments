
/*  @author Jackson Westeen
    http://jacksonwesteen.com
     
    GPS Visualizer - Maps GPS coordinates onto a perfect sphere.
    [WGS84 (latitude / longitude) to Cartesian Coordinates (x,y,z) conversion]
    Runs in Java & Processing.js, no porting necessary ;)
    
    Controls:
      Just watch.
 */


int n;
float[][] points;
float lat, lon, r, t;
PVector coord;

void setup() {
  size(640, 480, P3D);
  coord = new PVector();
  
  n = 30;        // number of points
  r = 200;       // sphere's radius
  t = 0;         // rotation accumulator
  
  // populate globe w/ random GPS coordinates
  points = new float[n][2];
  for (int i=0; i<points.length; i++) {
    points[i][0] = random(-90, 90);    // latitude
    points[i][1] = random(-180, 180);  // longitude
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(12 * radians(t += (TWO_PI / 365)));
  
  // earth
  noFill();
  stroke(0,127,255);
  strokeWeight(1);
  sphere(r);
  
  // points
  fill(255,0,0);
  stroke(255,0,0);
  strokeWeight(10);
  
  for (int i=1; i<points.length; i++) {
    // wgs84 -> cartesian coordinate conversion
    lat = radians(points[i][0]);
    lon = radians(points[i][1]);
    coord.x = r * cos(lat) * cos(lon);
    coord.y = r * cos(lat) * sin(lon);
    coord.z = r * sin(lat);
    point(coord.x, coord.y, coord.z);
  }
}


