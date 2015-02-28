
/*****************************************
 * Assignment 03
 * Name:         Henry Bradford
 * E-mail:       hbradfor@haverford.edu
 * Course:       CS 110 - Section 01
 * Submitted:    10/3/12
 * 
 * Frog pond: three frogs float in a pond among
 * lily pads, all watching the mouse. When the
 * mouse moves over a fly, a frog notices and 
 * sticks out its tongue to catch the fly.
***********************************************/

//flora, fauna
int numberOfLilypads = 1;
int numberOfFlies = 1;
int numberOfFrogs = 1;

//flora-fauna features
float flyWidth = random(5.0,10.0);
float flyHeight = flyWidth;
float frogWidth = random(80.0,100.0);
float frogHeight = .5*frogWidth;

//positions
//flies
float lx1 = random(10.0,490.0);
float lx2 = random(10.0,490.0);
float lx3 = random(10.0,490.0);
float ly1 = random(10.0,490.0);
float ly2 = random(10.0,490.0);
float ly3 = random(10.0,490.0);
//frogs
float rx1 = random(80.0,420.0);
float rx2 = random(80.0,420.0);
float rx3 = random(80.0,420.0);
float ry1 = random(80.0,420.0);
float ry2 = random(80.0,420.0);
float ry3 = random(80.0,420.0);

//general characteristics
void setup ()
{
  size(500, 500);
  background(20, 20, 250);
  smooth();
}

//let there be frog pond
void draw ()
{
  
   //frogs
  drawFrogs();
  
  //frog eyes
  //1 L
  fill(255);
  ellipse(rx1-10, ry1-5, 20,20);
  fill(0);
  float LpupilX1 = constrain (mouseX, rx1-13,rx1-7);
  float LpupilY1 = constrain (mouseY, ry1-8,ry1-2);
  ellipse(LpupilX1,LpupilY1, 10,10);
  
  //1 R
  fill(255);
  ellipse(rx1+10, ry1-5, 20,20);
  fill(0);
  float RpupilX1 = constrain (mouseX, rx1+7,rx1+13);
  float RpupilY1 = constrain (mouseY, ry1-8,ry1-2);
  ellipse(RpupilX1,RpupilY1, 10,10);
  
  //2 L
  fill(255);
  ellipse(rx2-10, ry2-5, 20,20);
  fill(0);
  float LpupilX2 = constrain (mouseX, rx2-13,rx2-7);
  float LpupilY2 = constrain (mouseY, ry2-8,ry2-2);
  ellipse(LpupilX2,LpupilY2, 10,10);
  
  //2 R
  fill(255);
  ellipse(rx2+10, ry2-5, 20,20);
  fill(0);
  float RpupilX2 = constrain (mouseX, rx2+7,rx2+13);
  float RpupilY2 = constrain (mouseY, ry2-8,ry2-2);
  ellipse(RpupilX2,RpupilY2, 10,10);
  
  //3 L
  fill(255);
  ellipse(rx3-10, ry3-5, 20,20);
  fill(0);
  float LpupilX3 = constrain (mouseX, rx3-13,rx3-7);
  float LpupilY3 = constrain (mouseY, ry3-8,ry3-2);
  ellipse(LpupilX3,LpupilY3, 10,10);
  
  //3 R
  fill(255);
  ellipse(rx3+10, ry3-5, 20,20);
  fill(0);
  float RpupilX3 = constrain (mouseX, rx3+7,rx3+13);
  float RpupilY3 = constrain (mouseY, ry3-8,ry3-2);
  ellipse(RpupilX3,RpupilY3, 10,10);
  
  //flies
  drawFlies();
  
  //frog tongues
  //tongue 1
  if (mouseX >= lx1 - (.5*flyWidth) && mouseX <= lx1 + (.5*flyWidth) && mouseY <= ly1 + (.5*flyHeight) && mouseY >= ly1 - (.5*flyHeight)) {
    stroke(255,176,208);
    strokeWeight(4);
    line(rx1,ry1+10, lx1,ly1);
  }
 
 //tongue 2
  if (mouseX >= lx2 - (.5*flyWidth) && mouseX <= lx2 + (.5*flyWidth) && mouseY <= ly2 + (.5*flyHeight) && mouseY >= ly2 - (.5*flyHeight)) {
    stroke(255,176,208);
    strokeWeight(4);
    line(rx2,ry2+10, lx2,ly2);
  }
  
  //tongue 3
  if (mouseX >= lx3 - (.5*flyWidth) && mouseX <= lx3 + (.5*flyWidth) && mouseY <= ly3 + (.5*flyHeight) && mouseY >= ly3 - (.5*flyHeight)) {
    stroke(255,176,208);
    strokeWeight(4);
    line(rx3,ry3+10, lx3,ly3);
  }
  
  //flora
  while (numberOfLilypads < 20) {
    noStroke();
    fill(0, 255, 0);
    ellipse(random(0, 500), random(0, 500), 40, 40);
    numberOfLilypads = numberOfLilypads +1;
  }

}

//fly function
void drawFlies() {
    fill(0);
    ellipse(lx1,ly1, flyWidth, flyHeight);
    ellipse(lx2,ly2, flyWidth, flyHeight);
    ellipse(lx3,ly3, flyWidth, flyHeight);
    
}

//frog function
void drawFrogs() {
    noStroke();
    fill(0,150,0);
    ellipse(rx1, ry1, frogWidth, frogHeight);
    ellipse(rx2, ry2, frogWidth, frogHeight);
    ellipse(rx3, ry3, frogWidth, frogHeight);
}
