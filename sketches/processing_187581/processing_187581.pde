
void setup()
{
  size(800, 600);
  background(255);
  textAlign(CENTER);
  fill(50);
  textSize(20);
  text("Click any point in space to begin.", width/2, height/2);
  //textAlign(0,0);
  maxMag = sqrt(pow(width,2) + pow(height,2));
}

int p1x = 0, p1y = 0, p2x, p2y, clickNum; //x & y coordinates for two points on vector, number of clicks to record if initial or final point
boolean vectorDrag = false;
int theta;
float mag;
float maxMag;


void draw()
{
  if (vectorDrag) {
    background(0);
    strokeWeight(5);
    point(p1x, p1y);
    stroke(255);
    
    //Draw the dynamic vector
    drawArrow(p1x, p1y, mouseX, mouseY, 0, 3, true);
    strokeWeight(5);
    stroke(0, 255, 255);
    
    line(p1x, p1y, mouseX, p1y); //horizontal component
    textSize(20);
    fill(0, 255, 255);
    text("" + abs(mouseX - p1x), (p1x + mouseX) / 2, p1y + 25);
    
    
    stroke(255, 153, 51);
    line(mouseX, p1y, mouseX, mouseY); //vertical component
    fill(255, 153, 51);
    if(mouseX > p1x)
      text("" + abs(mouseY - p1y), mouseX + 25, (mouseY + p1y) / 2);
    else
      text("" + abs(mouseY - p1y), mouseX - 50, (mouseY + p1y) / 2);
    
    //update the new magnitude
    mag = sqrt(pow(mouseX - p1x, 2) + pow(mouseY - p1y, 2)); 
    
    //Draw the sliding magnitude rectangle. 
    stroke(255,0,0);
    fill(255,0,0);
    rect(0, 0, mag*(mag/maxMag), 20);
    
    //Dynamic magnitude text inside the rectangle
    fill(255);
    textAlign(0,0);
    text("||m|| = " + round(mag), 10, 20);
    
    //Draw the sliding theta rectangle. 
    stroke(160,160,160);
    fill(160,160,160);
    rect(0, 30, theta*width/360.0, 20);
    stroke(255);
    
    //Updating theta
    fill(255);
    theta = arctan(p1x, p1y, mouseX, mouseY);
    text("theta = " + theta + "°", 10, 45);
  }
}

int arctan(int x1, int y1, int x2, int y2) //Returns theta in degrees between two points
{
  int dx = x2 - x1;
  int dy = y2 - y1;
  int theta = int(degrees(atan2(dy, dx))); // atan2 returns from PI to -PI
  if(theta < 0) //In QI or QII, flip polarity of atan2
    return -theta;
  else
    return 180 + (180 + -1*theta);
}

void mouseClicked()
{
  if (clickNum % 2 == 0) 
  {
    background(255);
    vectorDrag = true;
    p1x = mouseX;
    p1y = mouseY;
    strokeWeight(20);
    point(p1x, p1y);
    clickNum++;
  } else {
    vectorDrag = false;
    p2x = mouseX;
    p2y = mouseY;
    strokeWeight(5);
    drawArrow(p1x, p1y, p2x, p2y, 0, 3, true);
    mag = int(sqrt(pow(p2x - p1x, 2) + pow(p2y - p1y, 2)));
    clickNum++;
  }
}


void drawArrow(float x0, float y0, float x1, float y1, float beginHeadSize, float endHeadSize, boolean filled) {

  PVector d = new PVector(x1 - x0, y1 - y0);
  d.normalize();

  float coeff = 1.5;

  strokeCap(ROUND);

  line(x0+d.x*beginHeadSize*coeff/(filled?1.0f:1.75f), 
  y0+d.y*beginHeadSize*coeff/(filled?1.0f:1.75f), 
  x1-d.x*endHeadSize*coeff/(filled?1.0f:1.75f), 
  y1-d.y*endHeadSize*coeff/(filled?1.0f:1.75f));

  float angle = atan2(d.y, d.x);

  if (filled) {
    // begin head
    pushMatrix();
    translate(x0, y0);
    rotate(angle+PI);
    triangle(-beginHeadSize*coeff, -beginHeadSize, 
    -beginHeadSize*coeff, beginHeadSize, 
    0, 0);
    popMatrix();
    // end head
    pushMatrix();
    translate(x1, y1);
    rotate(angle);
    triangle(-endHeadSize*coeff, -endHeadSize, 
    -endHeadSize*coeff, endHeadSize, 
    0, 0);
    popMatrix();
  } else {
    // begin head
    pushMatrix();
    translate(x0, y0);
    rotate(angle+PI);
    strokeCap(ROUND);
    line(-beginHeadSize*coeff, -beginHeadSize, 0, 0);
    line(-beginHeadSize*coeff, beginHeadSize, 0, 0);
    popMatrix();
    // end head
    pushMatrix();
    translate(x1, y1);
    rotate(angle);
    strokeCap(ROUND);
    line(-endHeadSize*coeff, -endHeadSize, 0, 0);
    line(-endHeadSize*coeff, endHeadSize, 0, 0);
    popMatrix();
  }
}



