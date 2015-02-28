
int _num = 300;
Circle[] _circleArr = {};    // an array of circles

void setup() {
  size(700,500);
  background(255);
  smooth();
  strokeWeight(5);
  fill(185,222,245);
  _num = int(5 + random(10));
  drawCircles(_num);
}

void draw() {
  noStroke();
  fill(255, 3);
  rect(0,0,width, height);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}
void keyPressed() {
  if(key== 's') {
    saveFrame("screenshot-####.tiff");
  }
}

void mouseReleased() {
  _num = int(10 + random(20));
  _circleArr = (Circle[])expand(_circleArr, 0);
  drawCircles(_num);
  println(_circleArr.length);
}

void drawCircles(int num) {
  // draw _num number of circles at random points
  for (int i=0; i<num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}




class Circle {
  // object 
  float x, y;
  float radius;
  int rd, gr,bl, thick; 
  float alph;
  float xmove, ymove;
  float fillcol;
  
 
  Circle () {
    x = random(width);
    y = random(height);
    radius = random(20) + 10;

   
    alph = random(255);
    xmove = random(6) - 3;  // gives random number between -6 and 3
    ymove = random(6) - 3;
  }
  

  void drawMe() {
     thick = int(random(5) + 2);
    
 
    if ((rd == 0) || (rd == 255)) {
      rd = int(random(255));
      gr = int(random(255));
      bl = int(random(255));
    } else {
      if (rd > 125) {
        rd=255; gr=255; bl=255;
      } else {
        rd=0; gr=0; bl=0;
      }
    }
  }
  
 
  
  void updateMe() {
     strokeWeight(thick); 
    stroke(rd, gr, bl);
    fill(fillcol, 2);
    ellipse(x, y, radius*2, radius*2);
    x += xmove;
    y += ymove;
    // wrap it if if goes offscreen
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
    
    // basic collision detection
    // loop through all other circles and see if they are intersecting

    
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {   
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis - radius - otherCirc.radius;
        if (overlap < 0) {   
          float intx, inty;
          if (x < otherCirc.x) {
            intx = x + (otherCirc.x - x)/4;
          } else {
            intx = otherCirc.x + (x - otherCirc.x)/4;
          }
          if (y < otherCirc.y) {
            inty = y + (otherCirc.y - y)/4;
          } else {
            inty = otherCirc.y + (y - otherCirc.y)/4;
          }
          stroke(51,120,162);
          fill(222,238,247,50);
          overlap *= -10;  // make it into a positive number
          ellipse(intx, inty, overlap, overlap);
        }
      }
    }
    
    drawMe();
  }
}


