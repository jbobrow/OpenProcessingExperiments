
void setup () {
  size(500, 375);
}
void draw () {
  background(255);  
  
  //lateral do edifício
  strokeWeight(2.5);
  stroke(0);
  line(308, 320, 308, 38);
  
  //curva motherfucker
   stroke(0, 255, 0);
  noFill();
  beginShape();
  vertex(308, 50);
  bezierVertex(255, 75, mouseX, mouseX, mouseX, 320);
  endShape();
  
  //curva principal
  stroke(255, 0, 0);
  noFill();
  beginShape();
  vertex(308, 50);
  bezierVertex(244, 75, mouseX, mouseX, mouseX, 320);
  endShape();
  
  //curva secundária
  stroke(0, 0, 255);
  noFill();
  beginShape();
  vertex(308, 50);
  bezierVertex(233, 75, mouseX, mouseX, mouseX, 320);
  endShape();
  
  //estrutura
  strokeWeight(2.5);
  stroke(0);
  line(225, 250, 307, 250);
  line(235, 180, 307, 180);
  line(221, 110, 317, 110);
  
  //janelas
  strokeWeight(1);
  line(221, 310, 307, 310);
  line(221, 300, 307, 300);
  line(222, 290, 307, 290);
  line(222, 280, 307, 280);
  line(223, 270, 307, 270);
  line(223, 260, 307, 260);
  
  line(225, 240, 307, 240);
  line(226, 230, 307, 230);
  line(227, 220, 307, 220);
  line(228, 210, 307, 210);
  line(230, 200, 307, 200);
  line(232, 190, 307, 190);
  
  line(236, 170, 307, 170);
  line(239, 160, 307, 160);
  line(242, 150, 307, 150);
  line(245, 140, 307, 140);
  line(248, 130, 307, 130);
  line(252, 120, 307, 120);

  
  //mar
  noStroke();
  fill(0, 98, 145);
  rect(0, 321, 500, 500);
  for (int l=1; l < 500; l+=1) {
  stroke(50,l*5,l*5,50);
  line(0, 321+l, 500, 321+l);
  }
}
