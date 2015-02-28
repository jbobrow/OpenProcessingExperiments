
void setup() {
  smooth();
  size(800, 600);
  background(137, 191, 211);
}

void draw() {
  smooth();
  background(137, 191, 211);
  if (mousePressed==true) {
    background(0);
  }
  else {
    background(137, 191, 211);
  }
  //lago--------------------------------------------
  for (int i=0;i<width;i=i+50) { 
    lago(i, int(random(150))+300, 300, random(80, 255));
  }
}
void lago(int posX, int posY, int lado, float azul) {
  noStroke();
  fill(30, 100, azul, 50);
  for (int i=0; i<1000; i++)//folhas pequenas
    ellipse(posX+random(lado), posY+random(lado), random(100), random(10));
  //gramado-----------------------------------------
  noStroke();
  fill(3, 85, 7);
  beginShape();
  vertex(800, 250);
  bezierVertex(800, 250, 0, 250, 0, 250);
  vertex(0, 310);
  bezierVertex(150, 350, 300, 300, 350, 400);
  bezierVertex(450, 550, 600, 300, 800, 400);
  endShape();
  beginShape();
  vertex(0, 400);
  bezierVertex(200, 450, 400, 500, 500, 600);
  vertex(500, 600);
  vertex(0, 600);
  endShape();
  //casa-------------------------------------------- 
  fill(200);
  rect(560, 165, 180, 140);//casa
  //porta e janelas-acender 
  if (mousePressed==true) {
    fill(255, 235, 8);
  }
  else {
    fill(255);
  }
  rect(560, 212, 90, 70); //janela
  rect(650, 215, 90, 90); //porta
  fill(0, 200);//transparencia
  rect(650, 228, 90, 30);  //janelinha porta
  rect(560, 212, 90, 70); //janela
  //detalhes porta
  strokeWeight(3);
  stroke(0);
  noFill();
  rect(654, 218, 82, 89);
  for (float i=654;i<694;i=i+18.5) {
    line(i, 218, i, 307);
  }
  for (float i=699;i<735;i=i+18.5) {
    line(i, 218, i, 307);
  }
  line(650, 228, 740, 228);
  line(650, 258, 740, 258);
  line(650, 268, 740, 268);
  line(650, 298, 740, 298);
  strokeWeight(2);
  for (float i=654;i<694;i=i+6) {
    line(i, 268, i, 297);
  }
  for (float i=699;i<735;i=i+6) {
    line(i, 268, i, 297);
  }
  stroke(95, 1, 3);//vermelho
  strokeWeight(10);
  line(560, 212, 740, 212);
  line(560, 285, 647, 285);
  strokeWeight(6);
  line(560, 160, 560, 305);
  line(605, 160, 605, 305);
  line(650, 160, 650, 305);
  line(695, 160, 695, 306);
  line(740, 160, 740, 305);
  //telhado inferior
  noStroke();
  strokeWeight(1);
  fill(4, 2, 33);
  beginShape();
  vertex(500, 200);
  bezierVertex(500, 200, 606, 160, 650, 100);
  bezierVertex(650, 100, 695, 160, 800, 200);
  endShape();
  //parede entre telhados
  noStroke();
  fill(200);
  rect(560, 160, 180, 10);
  //telhado superior
  fill(4, 2, 33);
  beginShape();
  vertex(525, 160);
  bezierVertex(500, 159, 575, 169, 650, 100);
  bezierVertex(725, 160, 765, 160, 790, 160);
  endShape();
  fill(255);
  strokeWeight(6);
  stroke(95, 1, 3);//vermelho
  fill(200); 
  triangle(650, 115, 600, 150, 700, 150); // triangulo do telhado
  //ponte----------------------------------------------------
  noStroke();
  fill(95, 1, 3);//vermelho
  beginShape();
  vertex(150, 500);
  bezierVertex(150, 500, 200, 350, 350, 350);
  vertex(350, 350);
  vertex(400, 360);
  bezierVertex(400, 350, 250, 350, 250, 500);
  vertex(250, 520);
  endShape();
  //ponte2------------------
  fill(80, 1, 3);
  beginShape();
  vertex(150, mouseY);
  bezierVertex(150, mouseY, 250, mouseY/2, 350, mouseY);
  vertex(350, 350);
  bezierVertex(350, 350, 200, 350, 150, 500);
  vertex(150, 500);
  endShape();
}
