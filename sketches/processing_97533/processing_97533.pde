
//Bolhas do Apocalipse
int x = 50;
void setup () {
  size(200, 200);
  background(0);
  rect(75, 75, 50, 50); // quadrado no meio
}
void draw () {
  fill((mouseX*57)/100, (mouseY*107)/79, (mouseX*mouseY)/200, 80); //Cores das elipses seguem a posição do mouse
  ellipse(mouseX, mouseY, 30, 30);
  if (mouseX > 75 && mouseX < 125) {//coordenadas x do quadrado
    if (mouseY > 75 && mouseY < 125) {// coordenadas y do quadrado
      fill(0);
      rect(0, 0, 200, 200);// O "apagar" da tela
    }
  }
}
