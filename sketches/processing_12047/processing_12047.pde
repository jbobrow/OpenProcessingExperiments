
int canvasWidth = 400;
int canvasHeight = 400;

ArrayList points;

void setup() {
  size(canvasWidth, canvasHeight);
  background(255);
  noFill();
  points = new ArrayList();
}

void draw() {
  smooth();
  strokeWeight(3);
  for(int i=0; i<points.size(); i++) {
    Point p = (Point) points.get(i);
    println(p.x+" "+p.y);
  }
}

void redrawShape() {
  if(points.size()>=4) {
    Point p0 = (Point) points.get(0);
    
    beginShape();
    vertex(p0.x, p0.y);
    for(int i=1; i<points.size(); i++) {
      Point p1 = (Point) points.get(i);
      i++;
      Point p2 = (Point) points.get(i);
      i++;
      Point p3 = (Point) points.get(i);
      
      bezierVertex(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
      
      
      stroke(255,0,0);
      line(p0.x,p0.y,p1.x,p1.y);
      line(p2.x,p2.y,p3.x,p3.y);
      stroke(0);
      p0 = p3;
    }
    endShape();
  }
}

void mousePressed() {
  point(mouseX, mouseY);
  points.add(new Point(mouseX, mouseY));
  if(points.size()%3==1)
    redrawShape();
}

void keyPressed() {
  if (key==' ') {
    points = new ArrayList();
    redrawShape();
  }
}

class Point { 
  float x, y; 
  Point (float x1, float y1) {  
    x = x1;
    y = y1; 
  }
}


