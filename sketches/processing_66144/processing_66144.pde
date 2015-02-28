
void setup() {
  size(400, 400);
  background(255, 255, 200);
  smooth();
  noStroke();

  fill(0, 0, 0);
  ellipse(90, 100, 200, 160);

  ellipseMode(CENTER);
  ellipse(180, 30, 23, 25);

  ellipseMode(CENTER);
  ellipse(220, 10, 24, 23);

  stroke(0);
  strokeWeight(2);
  line(180, 30, 220, 8);

  strokeWeight(2);
  line(260, 14, 300, 18);
  line(270, 0, 288, 32);
  line(280, 0, 279, 35);
  line(290, 0, 270, 32);


  line(350, 45, 400, 48);
  line(370, 20, 400, 85);
  line(400, 22, 360, 80);
  line(390, 20, 375, 83);

  line(370, 170, 368, 220);
  line(355, 175, 390, 219);
  line(355, 219, 380, 175);
  line(340, 195, 390, 196);

  fill(108, 31, 255);
  strokeWeight(0.5);

  beginShape();
  //vertex(0,0);
  vertex(150, 360);
  vertex(250, 300);
  vertex(280, 175);
  vertex(292, 175);
  vertex(300, 280);
  vertex(400, 305);
  vertex(400, 320);
  vertex(380, 330);
  vertex(390, 400);
  vertex(370, 400);
  vertex(315, 350);
  vertex(300, 400);
  vertex(270, 400);
  vertex(265, 365);
  vertex(180, 370);
  vertex(150, 360);
  //vertex(
  endShape();

  fill(0);
  triangle(180, 370, 150, 360, 125, 372);

  beginShape();
  vertex(270, 400);
  vertex(265, 365);
  vertex(180, 370);
  bezierVertex(240, 400, 210, 500, 240, 400);
  vertex(270, 400);
  endShape();

  smooth();
  noFill();
  stroke(2);
  strokeWeight(2);

  beginShape();
  curveVertex(180, 380);
  curveVertex(150, 360);
  curveVertex(120, 340);
  curveVertex(100, 300);
  curveVertex(50, 360);
  //curveVertex(100,300);
  curveVertex(20, 600);
  vertex(0, 400);
  //curveVertex(70,320);
  //curveVertex(500, 500);
  //vertex(500, 500);
  //vertex(500, 0);
  endShape();

  noStroke();
  fill(0);
  triangle(280, 175, 292, 175, 286, 130);

  fill(0);
  ellipseMode(CENTER);
  ellipse(220, 175, 30, 30);

  stroke(1);

  line(220, 170, 280, 175);
  line(290, 175, 330, 177);

  fill(0);
  ellipseMode(CENTER);
  ellipse(330, 177, 20, 20);

  fill(0);
  ellipseMode(CENTER);
  ellipse(100, 177, 20, 20);

  fill(0);
  ellipseMode(CENTER);
  ellipse(160, 160, 70, 70); 

  fill(0);
  ellipseMode(CENTER);
  ellipse(190, 100, 40, 40);

  fill(0);
  ellipseMode(CENTER);
  ellipse(170, 50, 10, 10);

  fill(0);
  ellipseMode(CENTER);
  ellipse(120, 30, 30, 30);

  fill(0);
  ellipseMode(CENTER);
  ellipse(10, 45, 28, 28);

  noStroke();
  fill(222, 48, 4);
  ellipseMode(CENTER);
  ellipse(0, 90, 25, 25);

  fill(0);
  ellipseMode(CENTER);
  ellipse(0, 150, 60, 60);

  fill(0);
  ellipseMode(CENTER);
  ellipse(0, 250, 30, 30);

  fill(0);
  ellipseMode(CENTER);
  ellipse(0, 310, 30, 30);

  fill(0);
  ellipseMode(CENTER);
  ellipse(100, 370, 40, 40);
  
  fill(222,48,4);
  ellipseMode(CENTER);
  ellipse(100, 370, 33, 30);
  
  fill(0);
  ellipseMode(CENTER);
  ellipse(102, 372, 15, 15);
}


