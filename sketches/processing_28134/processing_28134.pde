
ArrayList<Integer> pointsX = new ArrayList<Integer>();
ArrayList<Integer> pointsY = new ArrayList<Integer>();
ArrayList points;
 
float x1, y1, x2, y2;
float cx1, cy1, cx2, cy2;
float vx1, vy1, vx2, vy2;
float px, py, pt;
int h, steps;
float x = 0;
PVector v1, v2;

 
void setup() {
  background(255);
 
  size(700, 700, P3D);
  smooth();
  points = new ArrayList();
  stroke(255);
    v1 = new PVector(40, 20, 0);
  v2 = new PVector(25, 50, 0);

}
 
void draw() {
   h = (int) map(sin(x1/width)/cos(y1/height), -1, 1, 64, 255);
   
 
  fill(0, 8);
  
  noFill();
 
  stroke(h, 128, 255, 4);
  for (int i = 0; i <= steps; i++) {
	pt = i / float(steps);
	px = bezierPoint(x1, cx1, cy1, x2, pt);
	py = bezierPoint(y1, cx2, cy2, y2, pt);
	ellipse(px, py, cx1, cy1);
	ellipse(px, py, cx2, cy2);
   
  // Draw curves
  stroke(h, 255, 255, 64);
  bezier(x1, y1, cx1, cx2, cy1, cy2, x2, y2);
 
  // Velocity of each curve point
  if ((x1 < 0) || (x1 > width)) vx1 = -vx1;
  if ((x2 < 0) || (x2 > width)) vx2 = -vx2;
  if ((y1 < 0) || (y1 > height)) vy1 = -vy1;
  if ((y2 < 0) || (y2 > height)) vy2 = -vy2;
  strokeWeight(random(3));
  translate(width/2, 0);
  
  
    for(int b=0;b<pointsX.size()-1;b++) {
    
    int e = pointsX.get(b);
    int y = pointsY.get(b);
    
    x += (random(-2,2));
    y += (random(-2,2));
    
    pointsX.set(b, e);
    pointsY.set(b, y);
    
    line(pointsX.get(b), pointsY.get(b), pointsX.get(b+1), pointsY.get(b+1));
    
     rotate(frameCount/4);
 
  if(keyPressed && key == ' ') {
	x = x + 0.5;
  }
 
  rotateY(x);
 
  for(int t = points.size() - 1; t >= 0; t--) {
	Point dots = (Point) points.get(t);
	dots.display();
  }
}
}
}
void mouseDragged() {
  points.add(new Point());
  Point pointz = (Point) points.get(points.size() - 1);
  pointz.setValues(pmouseX - width/2, pmouseY, mouseX - width/2, mouseY);
 pointsX.add(mouseX);
    pointsY.add(mouseY);
    
    rotate(-TWO_PI/2);
    
         for (int g=0; g<18; g+=1) {
  float shade = map(g,18,0,50,100);
  stroke(0,shade);

}
}
void keyPressed() {
  if(key == 'a') {
	setup();
  }
   stroke(0, 4);

}

void keyReleased() {
  x = 0;
}


//


//points

class Point {
  float a, b, x, y;
   
  Point() {
  }
   
  void setValues(float apos, float bpos, float xpos, float ypos) {
	a = apos;
	b = bpos;
	x = xpos;
	y = ypos;
  }
   
  void display() {
	line(a, b, x, y);
  }
}

