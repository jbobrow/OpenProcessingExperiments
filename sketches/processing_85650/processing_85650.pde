
void setup() {
  size(510, 510);
  background(100, 150, 200);
  smooth();
  strawberry();

  textSize(24);
  fill(255, 20, 20);
  text("No Two Strawberries are Alike", 100, 500);
}
void draw() {
}
void mouseClicked() {
  if (mouseButton==LEFT) {
    strawberry();
    noStroke();
    fill(255);
    for (int i=0;i<7;i=i+1) {
      ellipse(random(144, 410), random(300, 350), 2, 5);  
      ellipse(random(155, 380), random(250, 300), 2, 5);
      ellipse(random(175, 360), random(225, 250), 2, 5); 
      ellipse(random(200, 325), random(200, 225), 2, 5);  
      ellipse(random(153, 430), random(350, 400), 2, 5); 
      ellipse(random(200, 445), random(400, 425), 2, 5);
      ellipse(random(275, 455), random(425, 450), 2, 5);
    }
  }
}
void strawberry() {
  stroke(250, 0, 0);
  fill(250, 0, 0);
  triangle(200, 200, 175, 224, 475, 475);
  stroke(0);
  bezier(200, 200, 400, 150, 400, 300, 475, 475);
  bezier(175, 224, 75, 400, 150, 450, 475, 475);

  stroke(0);
  fill(0, 100, 0);
  beginShape();
  vertex(155, 250);
  vertex(145, 287);
  vertex(120, 350);
  vertex(120, 325);
  vertex(100, 375);
  vertex(100, 325);
  vertex(70, 350);
  vertex(80, 320);
  vertex(60, 325);
  vertex(75, 300);
  vertex(40, 305);
  vertex(50, 300);
  endShape(CLOSE);


  beginShape();
  vertex(190, 200);
  vertex(155, 260);
  vertex(100, 300);
  vertex(110, 270);
  vertex(50, 300);
  vertex(75, 275);
  vertex(20, 280);
  vertex(50, 250);
  vertex(10, 250);
  vertex(30, 240);
  vertex(0, 220);
  vertex(20, 210);
  vertex(0, 175);
  vertex(30, 180);
  vertex(0, 150);
  vertex(30, 160);
  vertex(30, 155);
  endShape(CLOSE);

  beginShape();
  vertex(130, 220);
  vertex(200, 200);
  vertex(225, 150);
  vertex(210, 160);
  vertex(225, 140);
  vertex(200, 145);
  vertex(230, 110);
  vertex(190, 120);
  vertex(210, 50);
  vertex(190, 75);
  vertex(180, 40);
  vertex(150, 70);
  vertex(150, 50);
  vertex(145, 60);
  vertex(140, 30);
  vertex(135, 60);
  vertex(125, 40);
  vertex(123, 60);
  endShape(CLOSE);

  beginShape();
  vertex(175, 225);
  vertex(50, 250);
  vertex(100, 200);
  vertex(25, 200);
  vertex(50, 175);
  vertex(25, 150);
  vertex(50, 150);
  vertex(20, 100);
  vertex(65, 100);
  vertex(65, 75);
  vertex(90, 100);
  vertex(125, 60);
  vertex(125, 100);
  vertex(175, 75);
  vertex(160, 150);
  vertex(175, 125);
  vertex(190, 210);
  endShape(CLOSE);
}

