
ArrayList<PVector> points;


void setup() {
  size(500, 500);

  frameRate(5);     // Make the sketch slower
  
  points = new ArrayList<PVector>();
}


void draw() {
  background(0);
  points.add(new PVector(mouseX, mouseY));    // Add a new point at the mouses' location to the list

  stroke(255);
  noFill();

  beginShape();

  for (int i =0 ; i < points.size(); i++) {
    PVector p = points.get(i);
    curveVertex(p.x, p.y);
  }

  endShape();
}  


void mouseClicked() {
    points.clear();
}




