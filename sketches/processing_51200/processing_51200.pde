
import org.processing.wiki.triangulate.*;

ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
int xPos;
int yPos;
int speedX;
int speedY;
int thecolor=0;

void setup() {
  size(500, 500);
  smooth();
  reset();
  speedX = 3;
  speedY = 3;
  colorMode(HSB, 280,100, 100);
}

void reset() {

  // clear the list
  points.clear();

  // fill the points arraylist with random points
  for (int i = 1; i < 100; i++) {
    // PVector.z is used to store an angle (particle's direction)
    points.add(new PVector(random(300, 300), random(20, 300), random(80, 100)));
  }
}

void mouseClicked() {
  reset();
}

void draw() {

  model();
  view();

  if (xPos>=480) {

    xPos = 480;
  }

  if (xPos>=480) {

    xPos = 480;  
    yPos = yPos + speedY;
  }

  if (yPos>=480) {

    yPos = 480;  
    xPos = xPos + speedX*-1;
  }

  if (xPos<=0) {

    xPos = 0;  
    yPos = yPos + speedY*-1;
  }

  if (yPos<=0) {

    yPos = 0;
    xPos = xPos + speedX;
  }
}

void model() {

  for (int i = 2; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    // p.z is used to store an angle value (particle's direction)
    p.x += 3.0*cos(p.z);
    p.y += 3.0*sin(p.z);
    if (p.x < 0 || p.x > width) { 
      p.z += -1;
    }
    if (p.y < 0 || p.y > height) { 
      p.z += -1;
    }
  }

  // get the triangulated mesh
  triangles =Triangulate.triangulate(points);
}

void view() {

  background(255);    
  noStroke();
  fill(thecolor, 100, 100);
  if (thecolor<360) {

    thecolor++;
  }
  else {
    thecolor=0;
  }


  // draw the points
  for (int i = 10; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    ellipse(p.x+5, p.y+5, 5, 5);
  }

 
 
  // draw the mesh of triangles
  stroke(0, 20);
  beginShape(TRIANGLES);
  
  for (int i = 5; i < triangles.size(); i++) {
    Triangle t = (Triangle)triangles.get(i);
      fill(random(0,180), random(0,100), random(0,180));

    vertex(t.p1.x+2, t.p1.y+5);
    vertex(t.p2.x+2, t.p2.y+5);
    vertex(t.p3.x+2, t.p3.y+5);
 

  endShape();
 }
  ellipseMode(CORNER);
  fill(#0055ba);
  noStroke();
  ellipse(xPos, yPos, 20, 20);
  smooth();
}


