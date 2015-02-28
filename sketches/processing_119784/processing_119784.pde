
float angRadsA;
float angDegsA;
float angRadsB;
float angDegsB;
float sumAngles;

void setup() {
  size(530,600);
  background(255);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(4);
  noFill();
  if(mouseX<200) {
    //triangle(0, 0, 150, 0, 150, mouseY);
    stroke(255,0,0);
    line(150,0,150,mouseY);
    stroke(0,0,255);
    line(0,0,150,mouseY);
    stroke(0,100,0);
    line(0,0,150,0);
    drawLeftReference(mouseY);
    text("A",135,mouseY+10);
    text("B",20,15);
  } else if(mouseX>200) {
    //triangle(350,0,500,0,350,mouseY);
    stroke(0,0,255);
    line(500,0,350,mouseY);
    stroke(255,0,0);
    line(350,0,350,mouseY);
    stroke(0,100,0);
    line(350,0,500,0);
    drawRightReference(mouseY);
    text("A",355,mouseY+10);
    text("B",505,15);
  }
}

void drawLeftReference(float yValue) {
  stroke(0);
  strokeWeight(1);
  line(135,0,135,15);
  line(135,15,150,15);
  text("Triangle Reference", 165,15);
  fill(0,0,255);
  text("Hypotenuse = " + findHypot(mouseY), 165,35);
  fill(255,0,0);
  text("Adjacent = " + mouseY, 165,55);
  fill(0,100,0);
  text("Opposite = " + 150, 165,75);
  fill(0);
  angRadsA = acos(150/findHypot(mouseY));
  angDegsA = degrees(angRadsA);
  text("Angle B = " + angDegsA, 165,95);
  angRadsB = acos(yValue/findHypot(mouseY));
  angDegsB = degrees(angRadsB);
  text("Angle A = " + angDegsB, 165,115);
  text("Right Angle = 90", 165,135);
  sumAngles = angDegsA+angDegsB+90;
  text("All Angles = " + sumAngles, 165,155);
  
}
void drawRightReference(float yValue) {
  stroke(0);
  strokeWeight(1);
  line(350,15,365,15);
  line(365,0,365,15);
  text("Triangle Reference", 165,15);
  fill(0,0,255);
  text("Hypotenuse = " + findHypot(mouseY), 165,35);
  fill(255,0,0);
  text("Adjacent = " + mouseY, 165,55);
  fill(0,100,0);
  text("Opposite = " + 150, 165,75);
  fill(0);
  angRadsA = acos(150/findHypot(mouseY));
  angDegsA = degrees(angRadsA);
  text("Angle B = " + angDegsA, 165,95);
  angRadsB = acos(yValue/findHypot(mouseY));
  angDegsB = degrees(angRadsB);
  text("Angle A = " + angDegsB, 165,115);
  text("Right Angle = 90", 165,135);
  sumAngles = angDegsA+angDegsB+90;
  text("All Angles = " + sumAngles, 165,155);
  
}

float findHypot(float yVal) {
  yVal = sqrt((150*150)+(yVal*yVal));
  return yVal;
}


