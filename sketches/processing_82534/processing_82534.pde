
ArrayList<PVector> points;


void setup() {
  size(600, 600);

  points = new ArrayList<PVector>();

  for (int i = 0; i < 10; i++) {         // Create ten random points
    PVector p = new PVector(random(0, width), random(0, height));
    points.add(p);
  }
}


void draw() {
  background(40);

  noFill();
  stroke(128);

  beginShape();

  for (int i = 0; i < points.size(); i++) {      // Go through all points and draw them as a shape
    PVector p = points.get(i);
    vertex(p.x, p.y);
  }

  endShape();
  

  float progress = map(mouseX, 0, width, 0, points.size() - 1);

  int index = floor(progress);     // On which segment are we in the path?

  PVector firstP = points.get(index);     
  PVector secondP = points.get(index + 1);
  
  float px = lerp(firstP.x, secondP.x, progress - index);
  float py = lerp(firstP.y, secondP.y, progress - index);
  
  
  fill(255);
  noStroke();
  ellipse(px, py, 20, 20);     // Draw the point we were looking for
}



