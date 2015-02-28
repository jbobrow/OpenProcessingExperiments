
int x = 200;
int y = 145;
int bodyHeight = 170;
int bodyWidth = 90;
int r = 7;

size(600, 650);
smooth();
strokeWeight(2);
background(240);

//neck
fill(200);
rect(x + 100, y - 45, 20, 45);

//head
fill(130);
rect(x + 60, y - 105, 90, 75);

//eyes
fill(255);
ellipse(x + 83, y - 65, r*4, r*4);
fill(0);
ellipse(x + 83, y - 65, r*2, r*2);
fill(255);
ellipse(x + 115, y - 65, r*6, r*6);
fill(0);
ellipse(x + 115, y - 65, r, r);

//body
fill(185);
rect(x + 50, y, bodyWidth, bodyHeight);

//left arm
fill(40, 40, 103);
rect(340, 155, 50, 20);
rect(385, 170, 20, 60);
fill(215);
ellipse(395, 165, r*6, r*6);
ellipse(395, 220, r*8, r*8);
line(395, 240, 395, 257);
line(387, 238, 375, 255);
line(403, 238, 415, 255);

//right arm
fill(40, 40, 103);
rect(250, 165, -30, -20);
rect(220, 145, -20, -60);
fill(215);
ellipse(210, 155, r*6, r*6);
ellipse(210, 85, r*8, r*8);
line(210, 65, 210, 48);
line(202, 67, 190, 50);
line(218, 67, 230, 50);

//left leg
fill(130);
rect(x + 110, 295, bodyWidth/3, bodyHeight - 10);
fill(220);
ellipse(325, 365, r*8, r*8);
fill(5, 11, 44);
rect(305, 435, bodyWidth - 50, bodyWidth - 70);
fill(205);
rect(302, 455, 46, 25);
fill(30, 9, 95);
rect(308, 480, 34, 20);
fill(200);
triangle(325, 500, 350, 530, 300, 530);
ellipse(325, 500, r*2, r*2);

//right
fill(130);
rect(x + 50, 295, bodyWidth/3, bodyHeight - 10);
fill(220);
ellipse(265, 365, r*8, r*8);
fill(5, 11, 44);
rect(245, 435, bodyWidth - 50, bodyWidth - 70);
fill(205);
rect(242, 455, 46, 25);
fill(30, 9, 95);
rect(248, 480, 34, 20);
fill(200);
triangle(265, 500, 290, 530, 240, 530);
ellipse(265, 500, r*2, r*2);


//panel
fill(225);
rect(265, 160, 60, 120);
fill(245, 86, 12);
for(int b = 175; b < 206; b = b + 10) {
  ellipse(310, b, 5, 5);
}
fill(190);
rect(309, 215, 5, 15);
line(285, 175, 300, 175);
line(300, 175, 285, 185);
line(285, 185, 285, 195);
line(285, 195, 300, 195);
line(300, 195, 285, 220);
fill(0, 0, 200);
for (int b = 205; b < 246; b = b + 10) {
    fill(0, 255, 0);
    ellipse(280, b, 5, 5);
  }
fill(200);
rect(280, 255, 40, 10);
fill(40, 40, 103);
rect(287, 234, 23, 14);
fill(245, 86, 12);
ellipse(291, 225, 5, 5);
fill(0, 200, 0);
ellipse(302, 225, 5, 5);
fill(0, 0, 190);
ellipse(317, 245, 5, 5);

