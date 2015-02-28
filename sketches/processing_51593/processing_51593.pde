
//Problem Set #1 - 02
void setup() {
  size(300,250);
  background(178);
  smooth();
}

void draw() {
  line(50,20,85,60);
  line(50,20,35,60); 
  triangle(50,20,60,60,35,60);
  line(250,20,215,60);
  line(250,20,265,60);
  triangle(250,20,240,60,265,60);
  
  fill(0);
  ellipse(95,110,20,20);
  ellipse(205,110,20,20);
  
  fill(255,198,198);
  triangle(150,150,130,185,170,185);
  
  line(115,155,50,140);
  line(110,165,40,160);
  line(115,175,50,180);
  
  line(185,155,250,140);
  line(190,165,260,160);
  line(185,175,250,180);
}

void keyPressed() {
  saveFrame("PS1_02image.jpeg");
}

