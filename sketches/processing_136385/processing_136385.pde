
//willbecekr
 
int value = 0;  //declare initial value as 0
int x; // declare integer x
int c = 0;
float a = 0.0;
float inc = TWO_PI/25.0;

void setup () {
  size (1000, 1000); // setup canvas size to 500 x 500
  background (255); // setup background to white
}
 
 
void draw() {

  background (255);
  for (float x = 0; x< width; x++) { // loop to initiate the drawing method as long as x smaller than width
    stroke(random(255),random(255),random(255));
    strokeWeight(1);
    float y = value/height; // initiate y as value/height
    fill (value, 0, 0, value); //pass the numeric value of "value" to fill color
    translate (sin(a)*40.0, y); // translate the curves according to mouse position x
    a = a + inc+x;
    rotate (noise (360)); // animate by rotating canvas using noise method
    // start drawing the control vertices
    beginShape();
    curveVertex(250, 500);
    curveVertex(200, 500);
    curveVertex(100, 350);
    curveVertex(200, 200);
    // ending vertex controlled by mouse position in X axis
    // random values are chosen every time the code is started
    curveVertex(random(value), random(value));
    curveVertex(random(value), random (value));
    endShape();
 
    // "primary" / displayed line (this is what you'll actually see)

    stroke(random(255),random(255),random(255));
    strokeWeight(1);
 
    beginShape();
    curveVertex(250, height);
    curveVertex(200, 500);
    curveVertex(100, 350);
    curveVertex(200, 200);
    curveVertex(sin(a)*40.0,random(100,300), 60);
    endShape();
    // draw ellipses to display the points that the curve is based on
    fill (sin(a)*40.0,sin(a)*40.0,random(255));

    c = c+1;
  }
}
