
int _num=200;
Rectangle[] _rectArr = {};

void setup() {
  size(700,500);
  background(255);
  smooth();
  strokeWeight(5);
  fill(185,222,245);
  _num = int(20 + random(50));
  drawRectangles(_num);

}

void draw() {
  noStroke();
  fill(255,3);
  rect(0,0,width,height);
  for (int i=0; i<_rectArr.length; i++) {
    Rectangle thisRect = _rectArr[i];
    thisRect.updateMe();
  }
}
void keyPressed() {
  if(key== 's') {
    saveFrame("screenshot-####.tiff");
  }
}

void mousePressed() {
  _num = int(50 + random(100));
  _rectArr = (Rectangle[])expand(_rectArr,0);
  drawRectangles(_num);
  println(_rectArr.length);
}

void drawRectangles(int num) {
  for (int i=0; i<num; i++) {
    Rectangle thisRect = new Rectangle();
    thisRect.drawMe();
    _rectArr = (Rectangle[])append(_rectArr, thisRect);
  }
}

class Rectangle {
  float x,y;
  float radius;
  color linec, fillc;
  float alpha;
  float xmove, ymove;
  
  Rectangle() {
    x = random(width);
    y = random(height);
    radius = random(20)+5;
    linec = int(random(255));  
    fillc = int(random(255));
    alpha = random(0);
    xmove = random(6) - 3;  // gives random number between -6 and 3
    ymove = random(6) - 3;
  }
  
  void drawMe() {
    noStroke();
    fill(fillc, 2);
    rect(x, y, radius*2, radius*2);
  }
  
   void updateMe() {
    x += xmove;
    y += ymove;
    // wrap it if if goes offscreen
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
    
    //  collision detection
 
    
    for (int i=0; i<_rectArr.length; i++) {
      Rectangle otherRect = _rectArr[i];
      if (otherRect != this) {   
        // calculate the distance between them
        float dis = dist(x, y, otherRect.x, otherRect.y);
        float overlap = dis - radius - otherRect.radius/2;
        if (overlap < 10) {   
          // central point between our two touching rectangles
          float intx, inty;
          if (x < otherRect.x) {
            intx = x + (otherRect.x - x)/4;
          } else {
            intx = otherRect.x + (x - otherRect.x)/4;
          }
          if (y < otherRect.y) {
            inty = y + (otherRect.y - y)/4;
          } else {
            inty = otherRect.y + (y - otherRect.y)/4;
          }
          stroke(0);
          fill(222,238,247,50);
          overlap *= -5;  // make it into a positive number
          rect(intx, inty, -overlap, -overlap);
        }
      }
    }
    
    drawMe();
  }
}


