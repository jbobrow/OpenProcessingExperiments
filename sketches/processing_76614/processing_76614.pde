
//five for the olypic rings
int _num = 5;
//creates empty array to be filled (like dictionary in python)
Circle[] _CircleArray = {};   

//window setup
void setup() {
  size(500,500); 
  background(255);
  //so that it's not a bunch of planes
  smooth();
  //creates an emergent background in black with such large circles
  strokeWeight(100);
  fill(150, 50);
  drawCircles();
}

void draw() {
  background(255);
  for (int i=0; i<_CircleArray.length; i++) {
    Circle CurrentCirc = _CircleArray[i];
    CurrentCirc.UpdateCirc();
  }
}

void mouseReleased(){
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) { 
    Circle CurrentCirc = new Circle();
    CurrentCirc.DrawCirc();
    _CircleArray = (Circle[])append(_CircleArray, CurrentCirc);
  }
}


class Circle {
  
  float x, y;
  float radius; 
  color linecol, fillcol; 
  float alph;
  float xmove, ymove;
  
  // actual creation of circle 
  Circle () {
    x = random(width);
    y = random(height);
    radius = random(200) + 10; 
    linecol = color(random(255), random(255), random(255));
    xmove = random(10) - 5;   
    ymove = random(10) - 5;  
  }
  
  // to screen
  void DrawCirc() { 
    noStroke(); 
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  
  // movement method
  void UpdateCirc() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
    
   for (int i=0; i<_CircleArray.length; i++) {
      Circle otherCirc = _CircleArray[i];
      if (otherCirc != this) {  
        float dis = dist(x, y, otherCirc.x, otherCirc.y); 
        //calcs overlap
        float overlap = dis - radius - otherCirc.radius; 
        //negavitve overlap=touching
        if (overlap < 0) { 
          float midx, midy;
          if (x < otherCirc.x) {
            midx = x + (otherCirc.x - x)/2;
          } else {
            midx = otherCirc.x + (x - otherCirc.x)/2;
          }
          if (y < otherCirc.y) {
            midy = y + (otherCirc.y - y)/2;
          } else {
            midy = otherCirc.y + (y - otherCirc.y)/2;
          }
          stroke(0, 100);
          noFill();
          overlap *= -1; 
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
    
    DrawCirc();
  }


}




