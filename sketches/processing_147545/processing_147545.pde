
int nCircles = 10;
Circle[] circles = {};   

void setup() {
  size(800, 500); 
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  newCircles();
}

void draw() {
  background(255);
  for (int i=0; i < circles.length; i++) {
    if (!keyPressed || (key != 'n')) {
      circles[i].drawMe();
    }  
    if (!keyPressed || (key != 'b')) {
      circles[i].moveMe();
    }  
    if (!keyPressed || (key != 'm')) {
      circles[i].linkMe();
    }
  }
}

void newCircles() {
  for (int i=0; i < nCircles; i++) { 
    circles = (Circle[]) append(circles, new Circle(circles.length));
  }
}

void mouseReleased() {
  newCircles();
}


class Circle {

  int id; // identificatore univoco
  float x, y; // coordinate del centro
  float radius; // raggio
  color centercol, fillcol; // colori del centro e del contenuto 
  float alpha; // trasparenza
  float xmove, ymove; // vettore di movimento (direzione e velocità )
  
  Circle(int _id) {
    id = _id;
    x = random(width);
    y = random(height);
    radius = random(10, 100); 
    centercol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alpha = random(255);
    xmove = random(-2, 2);   
    ymove = random(-2, 2);  
  }
  
  void drawMe() { 
    noStroke(); 
    fill(fillcol, alpha);
    ellipse(x, y, radius*2, radius*2);
    stroke(centercol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  
  void moveMe() {
    x += xmove;
    y += ymove;
    if (x > (width + radius))   x = 0 - radius; 
    if (x < (0 - radius))       x = width + radius; 
    if (y > (height + radius))  y = 0 - radius; 
    if (y < (0 - radius))       y = height + radius; 
  }
  
  void linkMe() {
    for (int i = id + 1; i < circles.length; i++) {
      float dis = dist(x, y, circles[i].x, circles[i].y); 
      float overlap = dis - radius - circles[i].radius; 
      if (overlap < 0) { 
        stroke(0);
        line(x, y, circles[i].x, circles[i].y);
      }
    } 
  }
  
}




