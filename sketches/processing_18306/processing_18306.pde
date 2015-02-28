


void setup() {
  size(640, 480);
  smooth();
  strokeWeight(2);
  background(255);
}

void draw() {
  
  stroke(147, 131, 131);
  fill(163, 218, 240);
  rect(247, 77, 207, 275);
  fill(163, 218, 240);
  ellipse(350, 360, 200, 52);
  ellipse(350, 352, 206, 52);
  fill(163, 218, 240);
  ellipse(350, 77, 206, 52);
   fill(195, 202, 209);
  ellipse(350, 75, 206, 52);
  fill(242, 244, 246);
  ellipse(350, 64, 206, 52);
  fill(195, 202, 209);
  ellipse(350, 60, 200, 50);
  fill(195, 202, 209);
  ellipse(350, 64, 195, 40);
  line(252, 64, 300, 64);
  
  

  fill(195, 202, 209);
  beginShape();
  vertex(300, 65);
  bezierVertex(330, 70, 350, 50, 350, 50);
  bezierVertex(350, 50, 370, 50, 350, 30);
  bezierVertex(350, 30, 340, 30, 330, 50);
  vertex(330, 50);
  vertex(300, 65);
  line(300, 65, 270, 75);
  endShape();
  /*curveVertex(350, 64);
  curveVertex(360, 68);
  curveVertex(380, 72);
  curveVertex(400, 76);
  curveVertex(360, 64);
  endShape();
  
  //Vertex(320, 70, 300, 70);
  */
  
  
}


