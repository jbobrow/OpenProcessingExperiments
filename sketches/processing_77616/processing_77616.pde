
int angleStart = 0;
int angleEnd = 3;
int lipsX = 100;
int lipsY = 175;


void setup () {
  size(500, 500);
  smooth();
  noStroke();
  fill(250, 50, 50);
}
void draw () {
  background(250);
  ellipse (mouseX+100, mouseY+100,400, 400);
  fill(250);
  ellipse (mouseX+100, mouseY+100, 390, 390);
  fill(250, 50, 50);
  ellipse(mouseX, mouseY, 20, 20);
  rect(mouseX+85, mouseY+100, 20, 20);
  ellipse(mouseX+175, mouseY, 20, 20);
  arc(mouseX+lipsX, mouseY+lipsY, 100, 100, angleStart, angleEnd);
 fill(250);
  arc(mouseX+lipsX, mouseY+lipsY, 75, 75, angleStart, angleEnd);
  fill(250, 50, 50);

  if (mousePressed) {
    angleStart = 3;
    angleEnd = 6;
    lipsX= 100;
    lipsY= 220;
  } else {
    angleStart=0;
    angleEnd=3;
    lipsX=100;
    lipsY=175;
  }

 }



