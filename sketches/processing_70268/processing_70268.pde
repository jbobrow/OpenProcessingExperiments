
/*

Information on spirograph mathematics & functions obtained here:
http://yourideahere.umbc.edu/ARTISTS/jamesdaly/Spirograph/SpiroGraph.html

"A Spirograph is formed by rolling a circle inside or outside of another circle. The pen is placed at any point on the rolling circle. If the radius of fixed circle is R, the radius of moving circle is r, and the offset of the pen point in the moving circle is O, then the equation of the resulting curve is defined by:
 
x = (R+r)*cos(t) - (r+O)*cos(((R+r)/r)*t) 
y = (R+r)*sin(t) - (r+O)*sin(((R+r)/r)*t)"

*/

float r;
float R;
float O;

int resolution = 2000;

void setup() {

  smooth();
  stroke(0);


  size(800, 800);
}

void draw() {

  background(255);

  translate(width/2, height/2);

  r = map(mouseX, 0, width, 0, 1);
  R = map(mouseY, 0, height, 100, 200);
  O = map(mouseX+mouseY, 0, width+height, 10, 100);

  float px = 0;
  float py = 0;

  for (int i = 0; i < resolution; i++) {
    //for (int i = 0; i < TWO_PI; i+= 0.1) {
    float theta = map(i, 0, resolution, 0, TWO_PI);

    float x = (R+r)*cos(theta) - (r+O)*cos(((R+r)/r)*theta);
    float y = (R+r)*sin(theta) - (r+O)*sin(((R+r)/r)*theta);

    //point (x, y);
    if (px != 0 && py != 0)
      line(x, y, px, py);

    px = x;
    py = y;
  }
}


