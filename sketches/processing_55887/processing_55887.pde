
int x;
int eye1;
int eye2;

void setup() {
  size(320, 320);
  background(255);
  smooth();
  x = 0;
  eye1 = 30;
  eye2 = 40;
}

void draw() {
  if (mouseY > 160 && x < 240) {
    x++;
  }
  if (mouseY <= 160 && x > -241) {
    x--;
  }
  if (mousePressed) {
    eye1 = 40;
    eye2 = 30;
  } else {
    eye1 = 30;
    eye2 = 40;
  }
    
  background(255);
  
  //directions
  stroke(125);
  line(300, 155, 305, 150);
  line(305, 150, 310, 155);
  line(305, 150, 305, 170);
  line(300, 165, 305, 170);
  line(305, 170, 310, 165);
  
  //body
  stroke(0);
  fill(255, 228, 188);
  rect(x + 120, 160, 60, 40);
  
  fill(35, 191, 203);
  rect(x + 130, 160, 5, 40);
  rect(x + 165, 160, 5, 40);
  
  //ears
  fill(255, 228, 188);
  triangle(x + 160, 70, x + 215, 60, x + 200, 110);
  triangle(x + 140, 70, x + 97, 45, x + 100, 110);
  
  //antennae
  fill(245, 147, 0);
  line(x + 215, 60, x + 230, 50);
  line(x + 97, 45, x + 90, 30);
  
  ellipse(x + 235, 47, 10, 10);
  ellipse(x + 88, 25, 10, 10);
  
  //face
  fill(245, 147, 0);
  ellipse(x + 150, 120, 100, 100);
  
  //eyes
  fill(255);
  ellipse(x + 130, 120, eye1, eye1);
  ellipse(x + 165, 120, eye2, eye2);
  
  fill(35, 191, 203);
  ellipse(x + 130, 120, 8, 8);
  ellipse(x + 165, 120, 8, 8);
  
  //nose
  fill(255);
  ellipse(x + 145, 140, 10, 5);
  
  //whiskers
  line(x + 120, 145, x + 80, 155);
  line(x + 125, 150, x + 90, 170);
  line(x + 180, 145, x + 220, 155);
  line(x + 175, 150, x + 210, 170);
  
  //bottom
  //fill(45, 110, 120);
  fill(35, 191, 203);
  rect(x + 147, 230, 6, 30);
  arc(x + 150, 201, 60, 60, 0, PI);
  
  beginShape();
  vertex(x + 130, 260);
  vertex(x + 170, 260);
  vertex(x + 170, 270);
  vertex(x + 165, 270);
  vertex(x + 165, 265);
  vertex(x + 135, 265);
  vertex(x + 135, 270);
  vertex(x + 130, 270);
  endShape(CLOSE);
  
  //wheels
  fill(15, 70, 80);
  ellipse(x + 132, 280, 20, 20);
  ellipse(x + 168, 280, 20, 20);
  fill(255);
  ellipse(x + 132, 280, 10, 10);
  ellipse(x + 168, 280, 10, 10);
}

