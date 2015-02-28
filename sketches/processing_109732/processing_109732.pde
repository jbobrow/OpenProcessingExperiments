
void setup()
{
  size(800, 300);
  background(242, 227, 166);
  
  stroke(250, 0, 0);
  line(60, 50, 400, 50);
  fill(250, 0, 0);
  rect(300, 40, 100, 10);
  
  stroke(82, 174, 252);
  fill(82, 174, 252);
  bezier(110, 280, 15, 220, 40, 80, 110, 60);
  
  quad(530, 60, 535, 60, 587, 152, 583, 155);
  
  quad(560, 280, 580, 280, 710, 60, 690, 60);
  
  beginShape();
  vertex(170, 280);
  bezierVertex(105, 220, 140, 80, 170, 60);
  bezierVertex(105, 80, 85, 220, 170, 280);
  endShape();
  
  beginShape();
  vertex(170, 280);
  bezierVertex(240, 220, 205, 80, 170, 60);
  bezierVertex(180, 80, 220, 220, 170, 280);
  endShape();
  
  beginShape();
  vertex(292, 280);
  bezierVertex(227, 220, 262, 80, 292, 60);
  bezierVertex(227, 80, 207, 220, 292, 280);
  endShape();
  
  noFill();
  arc(510, 170, 140, 220, PI/2, TWO_PI - PI/2);
  
  stroke(0, 0, 0);
  triangle(290, 170, 320, 60, 380, 170);
  triangle(290, 170, 350, 280, 380, 170);
  
  quad(390, 170, 420, 60, 480, 170, 450, 280);
  
  stroke(250, 0, 0);
  arc(290, 170, 360, 220, PI/2, TWO_PI - PI/2);
  
  fill(250, 0, 0);
  quad(290, 170, 292, 166, 477, 166, 480, 170);
  
  quad(510, 280, 530, 280, 660, 60, 640, 60);
  
  beginShape();
  vertex(260, 280);
  bezierVertex(195, 220, 230, 80, 260, 60);
  bezierVertex(195, 80, 175, 220, 260, 280);
  endShape();
  
  quad(610, 280, 630, 280, 760, 60, 740, 60);
  
  stroke(0, 0, 0);
  fill(0, 0, 0);
  quad(510, 60, 530, 60, 583, 155, 575, 170);
  
}


