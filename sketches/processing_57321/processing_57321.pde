
void setup() {
  size(800, 600);
  smooth();
  strokeWeight(2);
}  
void draw() {
  background(255);
  drawRobot(200, 100, 90, 150, 0, 40, 5);
  drawRobot(-20, 100, 90, 180, 30, 40, 4);
  drawRobot(420, 140, 90, 150, -15, 45, 6);
  drawRobot(620, 80, 90, 150, 40, 25, 5);
}
  
void drawRobot (int x, int y, int bodyWidth, int bodyHeight, int xh, int c, int r) {
  
//original integers
//int x = 200;
//int y = 100;
//int bodyWidth = 90;
//int bodyHeight = 150;
//int xh = change placement of head by y co-ordinate;
//int c = knees
//int r = 5;

//neck
fill(200);
rect(x + 100, y - xh, 20, bodyHeight - 10);

//head
fill(130);
rect(x + 60, y - 60 - xh, 90, 75);

//eyes
fill(255);
ellipse(x + 83, y - 20 - xh, r*4, r*4);
fill(0);
ellipse(x + 83 , y - 20 - xh, r*2, r*2);
fill(255);
ellipse(x + 115, y - 20 - xh, r*6, r*6);
fill(0);
ellipse(x + 115, y - 20 - xh, r, r);

//body
fill(185);
rect(x + 50, y + 45, bodyWidth, bodyHeight + xh);

//left arm
fill(40, 40, 103);
rect(x + 140, y + 55, 50, 20);
rect(x + 185, y + 70, 20, 60);
fill(215);
ellipse(x + 192, y + 65, r*6, r*6);
ellipse(x + 192, y + 120, r*8, r*8);
line(x + 191, y + 140, x + 191, y + 157);
line(x + 183, y + 138, x + 171, y + 155);
line(x + 199, y + 138, x + 211, y + 155);

//right arm
fill(40, 40, 103);
rect(x + 50, y + 65, -30, -20);
rect(x + 20, y + 45, -20, -60);
fill(215);
ellipse(x + 10, y + 55, r*6, r*6);
ellipse(x + 10, y - 15, r*8, r*8);
line(x + 10, y - 35, x + 10, y - 52);
line(x + 2, y - 33, x - 10, y - 50);
line(x + 18, y - 33, x + 30, y - 50);

//left leg
fill(130);
rect(x + 110, y + 195 + xh, 30, 140 - xh);
fill(220);
ellipse(x + 125, y + 265 + xh, c, c);
fill(5, 11, 44);
rect(x + 105, y + 335, 40, 20);
fill(205);
rect(x + 102, y + 355, 46, 25);
fill(30, 9, 95);
rect(x + 108, y + 380, 34, 20);
fill(200);
triangle(x + 125, y + 400, x + 150, y + 430, x + 100, y + 430);
ellipse(x + 125, y + 400, r*2, r*2);

//right
fill(130);
rect(x + 50, y + 195 + xh, 30, 140 - xh);
fill(220);
ellipse(x + 65, y + 265 + xh, c, c);
fill(5, 11, 44);
rect(x + 45, y + 335, 40, 20);
fill(205);
rect(x + 42, y + 355, 46, 25);
fill(30, 9, 95);
rect(x + 48, y + 380, 34, 20);
fill(200);
triangle(x + 65, y + 400, x + 90, y + 430, x + 40, y + 430);
ellipse(x + 65, y + 400, r*2, r*2);


//panel
fill(225);
rect(x + 65, y + 60, 60, 120 + xh/2);
fill(245, 86, 12);
for(int b = 75; b < 106; b = b + 10) {
  ellipse(x + 110, b + y + xh/2, 5, 5);
}
fill(190);
rect(x + 109, y + 115 + xh/2, 5, 15);
line(x + 85, y + 75 + xh/2, x + 100, y + 75 + xh/2);
line(x + 100, y + 75 + xh/2, x + 85, y + 85 + xh/2);
line(x + 85, y + 85 + xh/2, x + 85, y + 95 + xh/2);
line(x + 85, y + 95 + xh/2, x + 100, y + 95 + xh/2);
line(x + 100, y + 95 + xh/2, x + 85, y + 120 + xh/2);
fill(0, 0, 200);
for (int b = 105; b < 146; b = b + 10) {
    fill(0, 255, 0);
    ellipse(x + 80, b + y + xh/2, 5, 5);
  }
fill(200);
rect(x + 80, y + 155 + xh/2, 40, 10);
fill(40, 40, 103);
rect(x + 87, y + 134 + xh/2, 23, 14);
fill(245, 86, 12);
ellipse(x + 91, y + 125 + xh/2, 5, 5);
fill(0, 200, 0);
ellipse(x + 102, y + 125 + xh/2, 5, 5);
fill(0, 0, 190);
ellipse(x + 117, y + 145 + xh/2, 5, 5);
}

