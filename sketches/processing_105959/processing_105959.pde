
int cWidth = 12;
int cHeight = cWidth;
Circle[] circles = new Circle[cWidth*cHeight];
int radius = 80;
float dD;

void setup(){
  frameRate(30);
  size(1000,700);
  for(int i = 0; i < cWidth; i++) {
    for(int q = 0; q < cHeight; q++) {
      int index = i*cWidth + q; 
      circles[index] = new Circle((i*radius), (q*radius), radius);
    }
  }
}

void draw(){
  background(0);
  for(int i = 0; i < circles.length; i++) {
    dD = dist(mouseX,mouseY,circles[i].x, circles[i].y);
    circles[i].colorCheck();
    circles[i].display();
  }
}
class Circle {
  
  int x;
  int y;
  int d;
  float fillColor;
  
  Circle(int xLoc, int yLoc, int diameter) {
    x = xLoc;
    y = yLoc;
    d = diameter;
    
  }
  
  void colorCheck() {
    fillColor = 255 - (dist(mouseX, mouseY, x, y));
    if (fillColor <= 0) { fillColor = 0; };
  }
  
  void display() {
    fill(fillColor);
    noStroke();
    ellipse(x,y,dD,dD);
  }
}


