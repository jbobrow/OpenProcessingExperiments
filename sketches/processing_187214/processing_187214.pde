
/**
 * Assignment #4 : Chart Sketching <br>
 * <br><br>
 *
 * Michelle Phung<br>
 * Feb 23, 2015<br><br>
 * <br><br>
 *
 * Introduction to Interactive Data Visualization<br>
 * New York University
 */
 
 int [] categories = new int [24];
 int [] SFhi;
 int [] SFlo;
 int [] NYhi;
 int [] NYlo;
 int centerOfSFCircleX; 
 int centerOfSFCircleY;  
 int centerOfNYCircleX;
 int centerOfNYCircleY; 
 int angle = 360 / categories.length;
 
 color SFcolor;
 color NYcolor;
 
 void setup () {
   size(780,605);
   frameRate(30);
   getData();
  
  SFcolor = color(238, 247, 244, 160);
  NYcolor = color(80, 80, 80, 160);
  centerOfSFCircleY = (height/ 2) -30; 
  centerOfNYCircleY = centerOfSFCircleY;
   
 }
 
void draw () {
  background(#7F97A3);
  float multiplier = 1.25;
  drawSF(multiplier);
  drawNY(multiplier);
  
  drawTableInfo();
}


void mouseMoved() {
  centerOfNYCircleX = mouseX;
  centerOfSFCircleX = width - mouseX;
}

void getData () {
     
   String [] SFhiStrings = loadStrings("SFhi.txt"),
     SFloStrings = loadStrings("SFlo.txt"),
     NYhiStrings = loadStrings("NYhi.txt"),
     NYloStrings = loadStrings("NYlo.txt");
     
   SFhi = atoiData(SFhiStrings);
   SFlo = atoiData(SFloStrings);
   NYhi = atoiData(NYhiStrings);
   NYlo = atoiData(NYloStrings);
};

int [] atoiData (String [] data) {
  
  int [] numbers  = new int[data.length];
  for (int i = 0; i < data.length ; i++) {
    numbers[i] = parseInt(data[i]);
  }
  return numbers;
};
 
color randomColor () {
  return color(random(255),random(255),random(255), 120);
}
void drawSF (float mult) {
  for (int i = 0; i < categories.length; i++) {
    if (i % 2 == 0) { 
      fill(SFcolor);
      drawBar(centerOfSFCircleX, centerOfSFCircleY, i, SFlo[i/2]*mult); 
    } else {
      drawBar(centerOfSFCircleX, centerOfSFCircleY, i, SFhi[(i-1)/2]*mult); 
    }
  }
  textSize(32);
  text("SF", centerOfSFCircleX - 100, centerOfSFCircleY - 120);
}

void drawNY (float mult) {
  for (int i = 0; i < categories.length; i++) {
    if (i % 2 == 0) { 
      fill(NYcolor);
      drawBar(centerOfNYCircleX, centerOfNYCircleY, i, NYlo[i/2]*mult); 
    } else {
      drawBar(centerOfNYCircleX, centerOfNYCircleY, i, NYhi[(i-1)/2]*mult); 
    }
  }
  textSize(32);
  text("NY", centerOfNYCircleX + 100, centerOfNYCircleY - 80);
}

void drawTableInfo () {
  textSize(12);
  text("Each of the two circles above represent one year.\nEach month has two bars: the average high temperate, and average low temperature for that month.\n\nStarting from the point on the circles where the 3 would be on a clock,\nthe first bar at that position is January's average high temperature.\nMoving one bar counter-clockwise is January's average low temperature.\nContinue going counter-clockwise to go forward in time.\nThe next bar would be February's average high temperate, followed by February's average low temperature for that city.", 70, height - 130);
}

void drawBar (float centerx, float centery, int i, float h) {
  int r = 40; //innerDistanceFromCenter
  int R = h + r; //outerDistanceFromCenter
  int angle = (360 / categories.length) ;
  int angleOffset = 1;
  
  int innerAngle = angleOffset;
  int middleAngle = angle - (2 * innerAngle);

  int ax = floor(r * cos(getRad(innerAngle))),
      ay = floor(r * sin(getRad(innerAngle))),
      bx = floor(R * cos(getRad(innerAngle))),
      by = floor(R * sin(getRad(innerAngle))),
      cx = floor(R * cos(getRad(middleAngle))),
      cy = floor(R * sin(getRad(middleAngle))),
      dx = floor(r * cos(getRad(middleAngle))),
      dy = floor(r * sin(getRad(middleAngle)))
      ;
      
  noStroke();
  pushMatrix();
  translate(centerx,  centery);
  rotate(getRad(angle) * i);
  beginShape();
  vertex(ax, ay);
  vertex(bx, by);
  vertex(cx, cy);
  vertex(dx, dy);
  endShape();
  popMatrix();
}
 
float getRad (float deg) {
  return map(deg, 0, 360, 0, 2 * PI);
}


