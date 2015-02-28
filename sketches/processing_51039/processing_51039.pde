
//This is how I figured out how to do "lineAngle":  http://processing.org/discourse/yabb2/YaBB.pl?num=1261157915

void setup () {
  rectMode(CENTER);
  size(800,800);
  smooth();
  background(255);
  for(int i = 0; i < width; i += 80) {
    for(int j = 0; j < height; j += 80) {
      int circX = i+40;
      int circY = j+40;
      strokeWeight(2);
      fill(120);
      rect(circX,circY,random(20,40),80);
      fill(random(10,200),random(90,250),random(20,120));
      strokeWeight(2);
      ellipse(circX,circY,70,70);
      strokeWeight(3);
      lineAngle(circX,circY,(radians(random(0,359))),20);
      strokeWeight(2);
      lineAngle(circX,circY,(radians(random(0,359))),30);
      strokeWeight(4);
      line(circX+32,circY,circX+28,circY);
      line(circX,circY+32,circX,circY+28);
      line(circX-32,circY,circX-28,circY);
      line(circX,circY-32,circX,circY-28);
      /*
      strokeWeight(4);
      float xRad = radians(random(0,360))*5;
      strokeWeight(1);
      float yRad = radians(60)*15;
      line(i+40,j+40,(i+40)-xRad,(j+40)-yRad);
      */
    }
  } 
}

void lineAngle(int x, int y, float angle, float length)
{
  line(x, y, x+cos(angle)*length, y-sin(angle)*length);
}

/*
void draw () {
  background(255);
  strokeWeight(2);
  fill(10,random(150,170),random(120,140));
  for(int i = 0; i < width; i += 80) {
    for(int j = 0; j < height; j += 80) {
      ellipse(i+40,j+40,70,70);
    }
  } 
}
*/

