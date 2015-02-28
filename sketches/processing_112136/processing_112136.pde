

Point p1,p2;
int r,g,b;

void setup() {

  size(800, 600);
  background(0);
  noSmooth();

  p1 = new Point((int)random(width), (int)random(height));
  p2 = new Point((int)random(width), (int)random(height));

}

void draw() {
 
  background(66);
  line(p1.x, p1.y, p2.x, p2.y);
  
  int i;
  
  for(i = 0; i < p1.trails.length; i++) {
    
    line(p1.trails[i][0], p1.trails[i][1], p2.trails[i][0], p2.trails[i][1]);
  }
  
  move(p1); 
  move(p2);
  
  storeTrail(p1);
  storeTrail(p2);
}

void mousePressed() {
  
  background(0);
  p1.x = (int) random(width);
  p1.y = (int) random(height);  
  p2.x = (int) random(width);
  p2.y = (int) random(height); 
}

void move(Point p) {
  
  if (p.x >= width || p.x <= 0) {
    
    p.sx = -p.sx;
    changeColour();
  }  
  
  if (p.y >= height || p.y <= 0) {
    
    p.sy = -p.sy;
    changeColour();
  }
  
  p.x += p.sx;
  p.y += p.sy;
}

void changeColour() {

  r = (int) random(255);
  g = (int) random(255);
  b = (int) random(255);
  stroke(r,g,b);
} 

void storeTrail(Point p) {

  p.trails[0][0] = p.x;
  p.trails[0][1] = p.y;
  
  //move all values down one place in the array
  int i;
  
  for (i = p.trails.length -1; i > 0; i--) {
    
    p.trails[i][0] = p.trails[i - 1][0];
    p.trails[i][1] = p.trails[i - 1][1];
  }
  
}

class Point {

  public int x;
  public int y;
  public int sx;
  public int sy;
  public int trails[][];
    
  Point (int x, int y) {
    
    this.x = x;
    this.y = y;
    trails = new int[100][2];
    sx = 3;
    sy = 4;
  }
}


