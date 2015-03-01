
void setup() {
  size(1000, 800);
  smooth();
  strokeWeight(2);
}

void draw() {
  background(51, 153, 255);
  strokeWeight(0);
  fill(204, 229, 255);
  triangle(1, 550, 125, 475, 250, 550);
  triangle(450, 550, 575, 440, 700, 550);
  triangle(200, 550, 375, 510, 500, 550);
  triangle(700, 550, 875, 520, 1000, 550);
  fill(245);
  rect(1, 550, 1000, 250);
  strokeWeight(2);
  fill(220);
  arc(190, 705, 80, 30, PI, PI*2);
  quad(165, 600, 215, 600, 220, 700, 160, 700);
  arc(190, 590, 80, 35, PI, PI*2);
  arc(190, 590, 80, 35, 0, PI);
  rect(230, 587, 70, 6);
  rect(150, 585, 80, 10);
  quad(290, 585, 305, 587, 305, 593, 290, 595);
  fill(100);
  arc(795, 572, 15, 30, PI, PI*2);
  arc(800, 575, 15, 30, PI, PI*2);
  arc(805, 578, 15, 30, PI, PI*2);
  arc(810, 581, 15, 30, PI, PI*2);
  drawViperprobe(95, 400);
  drawViperprobe(345, 495);
  drawViperprobe(580, 515);
  drawViperprobe(810, 365);
}

void drawViperprobe(int x, int y) {

//head
strokeWeight(1);
line(x - 21, y - 20, x - 21, y - 27);
strokeWeight(3);
line(x - 21, y - 27, x - 21, y - 35);
strokeWeight(2);
fill(100, 87, 23);
rect(x - 20, y, 40, 20);
arc(x, y, 100, 45, PI, PI*2);
arc(x, y, 100, 25, 0, PI);
fill(0);
line(x - 50, y, x + 50, y);
ellipse(x - 20, y + 2, 12, 15);
ellipse(x + 30, y - 2, 16, 18);
fill(100, 87, 23);
arc(x + 5, y - 22, 25, 15, PI, PI*2);
fill(255);
ellipse(x - 19, y + 2, 4, 6);
ellipse(x + 28, y - 2, 4, 6);
fill(0);
arc(x - 43, y-2, 18, 18, PI/2, PI * 1.5);
fill(200);
ellipse(x - 45, y-2, 4, 8);

//legs
fill(100, 87, 23);
strokeWeight(6);
line(x - 30, y + 50, x - 30, y + 85);
line(x - 30, y + 85, x - 23, y + 130);
line(x + 30, y + 50, x + 65, y + 70);
line(x + 65, y + 70, x + 60, y + 105);
line(x + 12, y + 105, x + 8, y + 130);
line(x + 8, y + 130, x + 9, y + 160);
line(x - 30, y + 60, x - 8, y + 70);
line(x - 8, y + 70, x - 9, y + 105);
strokeWeight(3);
line(x - 23, y + 130, x - 16, y + 130);
line(x - 23, y + 130, x - 19, y + 137);
line(x + 60, y + 105, x + 53, y + 105);
line(x + 60, y + 105, x + 56, y + 112);
line(x + 9, y + 160, x + 3, y + 162);
line(x + 9, y + 160, x + 9, y + 166);
line(x - 9, y + 105, x - 12, y + 112);
line(x - 9, y + 105, x - 7, y + 114);
strokeWeight(1);
beginShape();
vertex(x + 10, y + 60);
vertex(x + 17, y + 105);
vertex(x + 15, y + 104);
vertex(x + 8, y + 115);
vertex(x + 2, y + 120);
vertex(x , y + 122);
vertex(x , y + 127);
vertex(x - 1, y + 136);
vertex(x + 17, y + 138);
vertex(x + 15, y + 128);
vertex(x + 40, y + 128);
vertex(x + 25, y + 130);
vertex(x + 21, y + 149);
vertex(x + 21, y + 140);
vertex(x + 19, y + 135);
vertex(x - 5, y + 133);
vertex(x - 7, y + 130);
vertex(x + 7, y + 103);
vertex(x + 3, y + 78);
vertex(x + 1, y + 77);
vertex(x - 8, y + 62);
endShape(CLOSE);
strokeWeight(2);
ellipse(x + 12, y + 105, 10, 10);
ellipse(x + 3, y + 60, 20, 20);
ellipse(x - 3, y + 130, 8, 8);


//body

fill(100, 87, 23);
rect(x - 50, y + 20, 100, 20);
arc(x, y + 25, 115, 18, PI, PI*2);
quad(x - 58, y + 28, x + 58, y + 28, x + 50, y + 50, x - 50, y + 50);
quad(x - 8, y + 30, x + 20, y + 30, x + 18, y + 55, x - 6, y + 55);
line(x + 42, y + 17, x + 58, y + 17);
rect(x + 40, y + 15, 12, 5);
}

