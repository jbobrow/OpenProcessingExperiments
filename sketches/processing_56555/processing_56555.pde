
float c = 100;
float d = 100;
float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;
float bodyHeight = 150;
float bodyWidth = 90;
float r = 5;

void setup() {
  size(600, 600);
  smooth();
  strokeWeight(2);
}

void draw() {
  c = c + random(-5, 5);
  d = d + random(-1, 1);
  
background(240);

//neck
fill(200);
rect(c + 200, d, 20, 45);

//head
fill(130);
rect(c + 160, d - 60, 90, 75);

//eyes
fill(255);
ellipse(c + 183, d - 20, r*4, r*4);
fill(0);
ellipse(c + 183, d - 20, random(10), random(10));
fill(255);
ellipse(c + 215, d - 20, r*6, r*6);
fill(0);
ellipse(c + 215, d - 20, random(20), random(20));

//body
fill(185);
rect(c + 150, d + 45, bodyWidth, bodyHeight);

//panel
frameRate(5);
fill(225);
rect(c + 165, d + 60, 60, 120);
fill(random(255), random(255), random(255));
ellipse(c + 210, d + 75, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 210, d + 85, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 210, d + 95, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 210, d + 105, 5, 5);
fill(random(255), random(255), random(255));
rect(c + 209, d + 115, 5, 15);
line(c + 185, d + 75, c + 200, d + 75);
line(c + 200, d + 75, c + 185, d + 85);
line(c + 185, d + 85, c + 185, d + 95);
line(c + 185, d + 95, c + 200, d + 95);
line(c + 200, d + 95, c + 185, d + 120);
fill(random(255), random(255), random(255));
ellipse(c + 180, d + 105, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 180, d + 115, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 180, d + 125, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 180, d + 135, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 180, d + 145, 5, 5);
fill(random(255), random(255), random(255));
rect(c + 180, d + 155, 40, 10);
fill(random(255), random(255), random(255));
rect(c + 187, d + 134, 23, 14);
fill(random(255), random(255), random(255));
ellipse(c + 191, d + 125, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 202, d + 125, 5, 5);
fill(random(255), random(255), random(255));
ellipse(c + 217, d + 145, 5, 5);

angle = angle + speed * angleDirection;
if ((angle > QUARTER_PI) || (angle < HALF_PI)) {
  angleDirection = angleDirection * -1;
}
//left arm
fill(40, 40, 103);
rect(c + 240, d + 55, 50, 20);
rotate(angle * 2.0);
rect(c + 285, d + 70, 20, 60);
fill(215);
ellipse(c + 295, d + 65, 30, 30);
ellipse(c + 295, d + 120, 40, 40);
line(c + 295, d + 140, c + 295, d + 157);
line(c + 287, d + 138, c + 275, d + 155);
line(c + 303, d + 138, c + 315, d + 155);

//right arm
fill(40, 40, 103);
rect(c + 150, d + 65, -30, -20);
rect(c + 120, d + 45, -20, -60);
fill(215);
ellipse(c + 110, d + 55, 30, 30);
ellipse(c + 110, d - 15, 40, 40);
line(c + 110, d - 35, c + 110, d - 52);
line(c + 102, d - 33, c + 90, d - 50);
line(c + 118, d - 33, c +130, d - 50);

//left leg
fill(130);
rect(c + 210, d + 190, bodyWidth/3, bodyHeight);
fill(220);
ellipse(c + 225, d + 265, 40, 40);
fill(5, 11, 44);
rect(c + 205, d + 335, bodyWidth - 50, bodyWidth - 70);
fill(205);
rect(c + 202, d + 355, 46, 25);
fill(30, 9, 95);
rect(c + 208, d + 380, 34, 20);
fill(200);
triangle(c + 225, d + 400, c + 250, d + 430, c + 200, d + 430);
ellipse(c + 225, d + 400, 10, 10);

//right
fill(130);
rect(c + 150, d + 190, bodyWidth/3, bodyHeight);
fill(220);
ellipse(c + 165, d + 265, 40, 40);
fill(5, 11, 44);
rect(c + 145, d + 335, bodyWidth - 50, bodyWidth - 70);
fill(205);
rect(c + 142, d + 355, 46, 25);
fill(30, 9, 95);
rect(c + 145, d + 380, 34, 20);
fill(200);
triangle(c + 165, d + 400, c + 190, d + 430, c + 140, d + 430);
ellipse(c + 165, d + 400, 10, 10);
}

