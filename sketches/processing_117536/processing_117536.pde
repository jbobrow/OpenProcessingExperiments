
// create two random points i & j

PVector i = new PVector (random(-200, 200), random(-200, 200));
PVector j = new PVector (random(-200, 200), random(-200, 200));


float theta=atan((j.y-i.y)/(j.x-i.x)); // calculate angle of line between i & j
float dist = 20; // Thickness of rectangle

void setup() {
  size(500, 500, P3D);
  background(255);
}

void draw() {

  translate(width/2, height/2);

// create corner coordinates set distance (dist) from i & j perpendicular from the line using angle (90+theta)

  float a = i.x + dist * cos((radians(90))+theta);
  float b = i.y + dist * sin((radians(90))+theta);
  float c = i.x + dist * cos((radians(-90))+theta);
  float d = i.y + dist * sin((radians(-90))+theta);
  float e = j.x + dist * cos((radians(90))+theta);
  float f = j.y + dist * sin((radians(90))+theta);
  float g = j.x + dist * cos((radians(-90))+theta);
  float h = j.y + dist * sin((radians(-90))+theta);

  stroke(255, 0, 0);
  line(i.x, i.y, j.x, j.y);

  stroke(0);

  beginShape();
  vertex(a, b);
  vertex(c, d);
  vertex(g, h);
  vertex(e, f);
  endShape(CLOSE);



  if (keyPressed) {
    if (key=='n') {
      println((degrees(theta))+90);
    }
  }
}



