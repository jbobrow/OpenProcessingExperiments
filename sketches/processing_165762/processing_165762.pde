
/* * *
 * Ada Lovelace Day
 *
 * Alunos: Marcelo Uchimura
 *         Matheus Gutierrez
 *---
 * Proposta
 * 
 * Como proposta para o dia de Ada Lovelace, optamos por
 * desenhar uma flor com oito pétalas, simbolizando
 * a engenhosa forma de pensar da matemática com a
 * leveza de uma flor.
 */
 
void setup() {
  // tamanho do viewport
  size(600,400);
  
}

void draw() { 
  frameRate(8);

  // caule
  fill(0, random(205,255), 0);
  beginShape();
  vertex(width/2+5, height/2-2);
  vertex(width/2+10, height/2+47);
  vertex(width/2+20, height/2+90);
  vertex(width/2+47, height/2+170);
  endContour();
  endShape(CLOSE);

  // coloração aleatória das pétalas  
  fill(random(170,255), random(25,50), 0);

  // petalas na horizontal e na vertical
  ellipseMode(CORNER);
  ellipse(width/2-8.5, height/2-60, 17, 60);
  ellipse(width/2-8.5, height/2, 17, 60);
  ellipse(width/2-60, height/2-8.5, 60, 17);
  ellipse(width/2, height/2-8.5, 60, 17);

  pushMatrix();
  translate(width/2, height/2);
  rotate(QUARTER_PI);
  // petalas na diagonal 1
  ellipse(-60, -8.5, 60, 17);
  ellipse(0, -8.5, 60, 17);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(-QUARTER_PI);
  // petalas na diagonal 2
  ellipse(-60, -8.5, 60, 17);
  ellipse(0, -8.5, 60, 17);
  popMatrix();

  // estame
  ellipseMode(CENTER);
  fill(random(220,255),200,0);
  ellipse(width/2, height/2, 30, 30);
}



