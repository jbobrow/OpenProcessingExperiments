
// Wictor Hugo da Cruz - Animação Deadmau5
 
int pX ;
int pY;
 
void setup() {
 
  size(500, 500);

  background(250);

  smooth();
}
 
void draw() {
  
  pX = mouseX;
  pY = mouseY;
}
 
void mousePressed() {
  noStroke();
  fill(0);
 
  //cabeça
 
  ellipse(pX, pY, 130, 130);
 
  //orelha
  ellipse(pX+45, pY-40, 100, 100);
 
  ellipse(pX-45, pY-40, 100, 100);
 
  //olhos
  
  /*
  fill(0);
  ellipse(275, 220, 20, 20);
   
   ellipse(225, 220, 20, 20);
   */
  //olhos
  fill(mouseX, 0, mouseY);
  ellipse(pX+25, pY-20, 10, 10);
 
  ellipse(pX-25, pY-20, 10, 10);
//boca
  arc(pX, pY+10, 80, 70, 0, PI);
}
 
 
void keyPressed() {
  background(mouseX, mouseY, 0);
}
