
float x, y, pointX, pointY, pointX2, pointY2;
int bColor, bStroke, speed;

void setup() {
  size(500,500);
  frameRate(30);
  bColor = 255;
  stroke(0);
  speed = 4;
}

void draw() {
  background(bColor);
   
  x = width/2;
  y = height/2;
  pointX = x/8 * sin(radians(frameCount)*speed ) + x;
  pointY = y/8 * cos(radians(frameCount)*speed ) + y;

  pointX2 = x/8 * cos(radians(frameCount)*speed ) + x;
  pointY2 = y/8 * sin(radians(frameCount)*speed ) + y;
  
  noFill();
  stroke(bStroke);
  strokeWeight(5);
  point(pointX,pointY);
  point(pointX2,pointY2);
  
  strokeWeight(0.1);
  ellipse(x,y,x/4,y/4);
  
  strokeWeight(5);
  
  if (dist(pointX,pointY,pointX2,pointY2) <= 2) {
    float boomX,boomY;
    boomX = pointX;
    boomY = pointY;
    
    if (bColor == 255) {
      bColor = 0;
      bStroke = 255;
      ellipse(boomX,boomY,50,50);
    } else {
      bColor = 255;
      bStroke = 0;
      ellipse(boomX,boomY,50,50);
    }
    
    //println(bColor);
    println(get(10,10,1,1));
  }
  
  
}
