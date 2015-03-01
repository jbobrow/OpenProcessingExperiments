
/*Mike Wazowski*/

void setup()
{
  size(900, 900);
  background(200, 200, 200);
  rectMode(CENTER);
  fill(255, 255, 255);
  rect(450, 450, 850, 850);

  strokeWeight(2);
  fill(255, 175, 70);
  bezier(320, 200, 320, 150, 320, 150, 350, 175); //cuerno izquierdo
  bezier(580, 200, 580, 150, 580, 150, 550, 175); //cuerno derecho

  bezier(200, 750, 200, 750, 150, 740, 225, 725); //uña izquierda
  bezier(700, 750, 700, 750, 750, 740, 675, 725); //uña derecha

  strokeWeight(3);
  fill(0, 255, 55);
  beginShape();
  curveVertex(250, 350); //brazo derecha
  curveVertex(250, 350);
  curveVertex(150, 380);
  curveVertex(150, 425);
  curveVertex(240, 500);
  curveVertex(275, 515);
  curveVertex(285, 500);
  curveVertex(295, 505);
  curveVertex(305, 490);
  curveVertex(305, 490);
  endShape();

  fill(255, 255, 255);
  beginShape();
  curveVertex(250, 375);
  curveVertex(250, 375);
  curveVertex(225, 385);
  curveVertex(170, 400);
  curveVertex(210, 445);
  curveVertex(265, 425);
  curveVertex(265, 425);
  endShape();

  fill(0, 255, 55);
  beginShape();
  curveVertex(650, 350); //brazo izquierda
  curveVertex(650, 350);
  curveVertex(760, 380);
  curveVertex(760, 425);
  curveVertex(655, 500);
  curveVertex(620, 515);
  curveVertex(610, 500);
  curveVertex(600, 505);
  curveVertex(590, 490);
  curveVertex(590, 490);
  endShape();

  fill(255, 255, 255);
  beginShape();
  curveVertex(650, 375);
  curveVertex(650, 375);
  curveVertex(675, 385);
  curveVertex(740, 400);
  curveVertex(690, 445);
  curveVertex(635, 425);
  curveVertex(635, 425);
  endShape();

  strokeWeight(3); 
  fill(0, 255, 55);
  beginShape(); //pierna izquierda
  curveVertex(305, 750);
  curveVertex(305, 750);
  curveVertex(280, 650);
  curveVertex(380, 450);
  curveVertex(380, 450);
  endShape();

  fill(255, 255, 255);
  beginShape();
  curveVertex(325, 750);
  curveVertex(325, 750);
  curveVertex(300, 650);
  curveVertex(360, 530);
  curveVertex(360, 530);
  endShape();

  strokeWeight(3);
  fill(0, 255, 55);
  beginShape(); //pierna derecha
  curveVertex(595, 750);
  curveVertex(595, 750);
  curveVertex(620, 650);
  curveVertex(520, 450);
  curveVertex(520, 450);
  endShape();

  fill(255, 255, 255);
  beginShape();
  curveVertex(575, 750);
  curveVertex(575, 750);
  curveVertex(600, 650);
  curveVertex(540, 530);
  curveVertex(540, 530);
  endShape();

  strokeWeight(3);
  line(200, 751, 325, 751);
  fill(0, 255, 55);
  beginShape(); //pie izquierdo
  curveVertex(200, 750);
  curveVertex(200, 750);
  curveVertex(225, 725);
  curveVertex(300, 700);
  curveVertex(325, 750);
  curveVertex(325, 750);
  endShape();

  line(575, 751, 700, 751); 
  beginShape();//pie derecho
  curveVertex(700, 750);
  curveVertex(700, 750);
  curveVertex(675, 725);
  curveVertex(600, 700);
  curveVertex(575, 750);
  curveVertex(575, 750);
  endShape();

  ellipse(450, 350, 400, 400); //cabeza
  arc(450, 175, 175, 100, PI, TWO_PI); //párpado

  fill(255, 0, 0);
  strokeWeight(3);
  bezier(326, 401, 400, 500, 500, 500, 574, 401); //labio inferior

  fill(0, 255, 55);
  bezier(325, 400, 400, 450, 450, 500, 575, 400); //labio superior

  noFill();
  strokeWeight(2);
  bezier(400, 500, 415, 515, 485, 515, 500, 500); //barbilla

  beginShape();
  vertex(315, 405);
  bezierVertex(320, 400, 325, 400, 335, 400); //sonrisa izquierda
  endShape();

  beginShape();
  vertex(565, 400);
  bezierVertex(580, 400, 575, 400, 585, 405); //sonrisa derecha
  endShape();
}

void draw()
{ 
  float ojo=atan2 (mouseY-450, mouseX-250);

  fill(255, 255, 255); 
  ellipse(450, 250, 200, 200); //ojo

  pushMatrix ();
  translate (450, 250);
  rotate (ojo);

  fill(0, 0, 255);
  strokeWeight(1);
  ellipse(35, 0, 100, 100); //iris

  fill(0, 0, 0);
  ellipse(35, 0, 75, 75); //pupila

  fill(255, 255, 255);
  ellipse(35, 15, 10, 10); //brillo
  popMatrix ();
}

