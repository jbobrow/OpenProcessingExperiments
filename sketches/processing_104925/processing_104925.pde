
//edit to resize
  int myWidth = 400;
  int myHeight = 400;

void setup(){
  size(myWidth, myHeight);
  background(150);
  noStroke();
}

/*
Polygon function by processing.org
http://processing.org/tutorials/anatomy/
*/
void polygon(int n, float centerX, float centerY, float w, float h, float startAngle)
{
  float angle = TWO_PI/ n;
  w /= 2;
  h /= 2;
  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(centerX + w * cos(startAngle + angle * i),
    centerY + h * sin(startAngle + angle * i));
  }
  endShape(CLOSE);
}

void draw() {
  //background color fade
  fill(150,150,150,10);
  rect(0,0,myWidth,myHeight);
  //draw polygon
  fill(myWidth/2,myHeight/2,255,100);
  float polySize = random(myHeight);
  polygon(int(random(10)),myWidth/2, myHeight/2, polySize, polySize,45);
  //draw second shape
  fill(255,255,255,50);
  ellipse(myWidth/2, myHeight/2, polySize/2, polySize/2);
}



