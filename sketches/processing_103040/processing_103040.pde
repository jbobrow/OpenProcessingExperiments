
float x=250;
float y=250;

float easing=0.02;

void setup() {
  size(800, 600);
  smooth();
  strokeWeight(2);
}
void draw() {
  
  background(118, 229, 255);
  
  //road
  noStroke();
  fill(120);
  rect(0, 350, 800, 200);
  noStroke();
  fill(255, 226, 3);
  rect(-50,450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(50,450,70,5);
  noStroke();
  fill(255, 226, 3);
  rect(150, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(250, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(350, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(450, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(550, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(650, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(750, 450, 70, 5);
  noStroke();
  fill(255, 226, 3);
  rect(850, 450, 70, 5);
  
  //trees
  noStroke();
  fill(113, 73, 48);
  rect(50, 150, 25, 200);
  noStroke();
  fill(59, 175, 50);
  ellipse(0, 150, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(85, 183, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(45, 184, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(95, 135, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(56, 120, 100, 100);
  
  noStroke();
  fill(113, 73, 48);
  rect(300, 150, 25, 200);
  noStroke();
  fill(59, 175, 50);
  ellipse(260, 150, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(335, 183, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(295, 184, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(345, 135, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(306, 120, 100, 100);
  
  noStroke();
  fill(113, 73, 48);
  rect(550, 150, 25, 200);
  noStroke();
  fill(59, 175, 50);
  ellipse(510, 150, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(590, 183, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(545, 184, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(595, 135, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(556, 120, 100, 100);
    
  noStroke();
  fill(113, 73, 48);
  rect(790, 150, 25, 200);
  noStroke();
  fill(59, 175, 50);
  ellipse(760, 150, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(840, 183, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(795, 184, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(845, 135, 100, 100);
  noStroke();
  fill(59, 175, 50);
  ellipse(806, 120, 100, 100);
  
  //car
  strokeWeight(1.5);
  stroke(0);
  fill(252, 0, 177);
  rect(x-150, y, 225, 125);
  strokeWeight(1.5);
  stroke(0);
  fill(252, 0, 177);
  arc(x-40,y, 100, 100, PI, TWO_PI);
  noStroke();
  fill(252, 0, 177);
  arc(x-39,y+3, 99, 99, PI, TWO_PI);
  strokeWeight(1.5);
  stroke(0);
  fill(255);
  arc(x-40,y+5, 80, 80, PI, TWO_PI);
  noStroke();
  fill(252, 0, 177);
  rect(x-148, y+3, 223, 122);
  stroke(0);
  line(x-80, y+3, x, y+3);
  noStroke();
  fill(0);
  ellipse(x-100, y+125, 75, 75);
  noStroke();
  fill(0);
  ellipse(x+25, y+125, 75, 75);
  noStroke();
  fill(255);
  ellipse(x+25, y+125, 20,20);
  noStroke();
  fill(255);
  ellipse(x-100, y+125, 20,20);
  strokeWeight(1.5);
  stroke(0);
  fill(252, 0, 177);
  rect(x-175, y+100, 25, 25);
  noStroke();
  fill(252, 0, 177);
  rect(x-170, y+102, 23, 23);
  
  //move
  if (mousePressed) {
     int targetX=mouseX;
     x+=(targetX-x)*easing;
  }
  //smoke
  if (mousePressed) {
    noStroke();
    fill(60, 190);
    ellipse(x-230, y+120, 40, 40);
    ellipse(x-210, y+100, 50, 50);
    ellipse(x-200, y+80, 30, 30);
    ellipse(x-260, y+110, 40, 40);
    ellipse(x-215, y+120, 50, 50);
    ellipse(x-280, y+125, 50, 50);
    ellipse(x-280, y+90, 30, 30);
  }
}
