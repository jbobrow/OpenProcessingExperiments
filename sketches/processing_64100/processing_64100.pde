
void logo(int c) {

  int xarc1 = -2;
  int yarc1 = -18;
  strokeWeight(1);
  stroke(c);



  pushMatrix();
  noFill();
  beginShape();
  //translate(500, 500);

  scale(4);

  vertex(-40, -40);
  vertex(0, -40);
  //bezierVertex(0,-40, -2,-17,10,-20+a);

  bezierVertex(0, -40, xarc1, yarc1, 10, -20);
  bezierVertex(10, -20, (xarc1)*-10, yarc1, 20, -40);
  vertex(20, -40);
  vertex(30, -40);
  vertex(30, 30);
  vertex(-10, 30);
  bezierVertex(-10, 30, (xarc1)-(xarc1)*-2, 0, -20, 0);
  bezierVertex(-20, 0, -30, 0, -30, 30);
  vertex(-40, 30);
  vertex(-40, -40);



  endShape(CLOSE);


  popMatrix();
}


