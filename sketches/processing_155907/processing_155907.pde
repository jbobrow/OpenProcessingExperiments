
color c = color(255, 255, 255, 120);
color d = color(255, 255, 255, 255);
float x = 0;
float y = 100;
float y2 = 150;
float y3 = 230;
float y4 = 300;
float y5 = 330;
float speed = 3;

void setup() {
  size(1000, 1000);
  background(30, 150, 255);
  smooth();
}

void draw() {
  if(mouseY<=450) {
  background(30, 150, 255);
  } else {
   background(30, 30, 100); 
   move();
   display();
   display2();
   display3();
   display4();
   display5();
  }
  
  fill(255, 255, 50);
  ellipse(mouseX, mouseY, 100, 100);
  
  fill(100, 255, 255);
  rect(0, 450, 1000, 600);
  
  fill(255, 255, 230);
  beginShape(); 
  vertex(0, 600);
  vertex(80, 590);
  vertex(150, 580);
  vertex(800, 500);
  vertex(1000, 470);
  vertex(1000, 1000);
  vertex(0, 1000);
  endShape();
  strokeWeight(0);
  
  fill(20, 255, 20);
  beginShape();  
  vertex(800, 0);
  vertex(700, 80);
  vertex(650, 150);
  vertex(680, 130);
  vertex(770, 100);
  vertex(820, 10);
  vertex(850, 40);
  vertex(1000, 10);
  vertex(1000, 0);
  endShape();
  strokeWeight(0);
  
  fill(50, 200, 120);
  beginShape();
  vertex(970, 0);
  vertex(850, 45);
  vertex(820, 140);
  vertex(900, 100);
  vertex(950, 70);
  vertex(1000, 20);
  vertex(1000, 0);
  endShape();
  
  fill(50, 150, 120);
  beginShape();
  vertex(1000, 20);
  vertex(800, 300);
  vertex(750, 350);
  vertex(850, 330);
  vertex(1000, 250);
  endShape();
}

 void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void display() {
  fill(c);
  rect(x,y,10,10);
}

 
void display2() {
  fill(d);
  rect(100,y2,10,10);
}

void display3() {
  fill(c);
  rect(500,y3,10,10);
}

void display4() {
  fill(d);
  rect(300,y4,10,10);
}

void display5() {
  fill(c);
  rect(465,y5,10,10);
}

