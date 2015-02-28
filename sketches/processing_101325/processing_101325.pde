
// Fachada - Daniela Ratz
PFont fonte;
void setup() {
  size(200, 200);
  fonte = createFont ("Rockwell", 12);
  textFont(fonte);
}
int c=150;
int p=30;
float s=0;
float n=30;
void draw() {
  background(10000, 206, 250);
  noStroke();
  //rua
  fill(79, 79, 79);
  rect(0, 120, 200, 100);
  //paralelepípedo
  strokeWeight(3);
  stroke(255, 255, 0);
  line(0, 160, 300, 160);
  //faixa entre pistas
  strokeWeight(1);
  stroke(250);
  for (int x=10; x<300; x=x+10) {
    line(x, 180, x+3, 180);
  }
  //prédio
  noStroke();
  fill(255, 246, 143);
  rect(70, 50, 50, 100);
  rect(80, 20, 30, 30);
  //porta
  fill(156, 156, 156, 70);
  rect(80, 130, 30, 20);
  strokeWeight(1);
  stroke(0);
  line(80, 130, 80, 150);
  line(110, 130, 110, 150);
  line(94, 130, 94, 150);
  line(96, 130, 96, 150);
  line(80, 130, 110, 130);
  //sol
  noStroke();
  fill(255, 255, 0);
  ellipse(s, 0, 20, 20);
  fill(255, 255, 0, 90);
  ellipse(s, 0, 30, 30);
  s=s+0.5;
  //nuvem
  fill(255);
  ellipse(n, 30, 20, 20);
  ellipse(n+10, 25, 20, 20);
  ellipse(n+20, 30, 20, 20);
  n=n+0.5;
  //carro
  noStroke();
  fill(255, 0, 0);
  rect(c, 165, 20, 10);
  rect(c+5, 158, 10, 7);
  fill(0);
  ellipse(c+5, 175, 7, 7);
  ellipse(c+15, 175, 7, 7);
  c=c-2;
  //pessoa
  fill(255, 215, 0);
  ellipse(p, 140, 6, 6);
  fill(245, 222, 179);
  ellipse(p, 149, 5, 15);
  p=p+1;
  //árvores
  strokeWeight(2);
  stroke(139, 69, 19);
  line(150, 140, 150, 150);
  line(165, 130, 165, 140);
  line(185, 130, 185, 140);
  noStroke();
  fill(50, 205, 50);
  ellipse(150, 130, 10, 25);
  fill(192, 255, 62);
  ellipse(165, 120, 15, 25);
  fill(0, 139, 69);
  ellipse(185, 120, 10, 25);
  //janelas
  strokeWeight(1);
  stroke(0);
  fill(156, 156, 156, 50);
  for ( int j=55; j<130; j=j+20) {
    rect(80, j, 10, 10);
    rect(100, j, 10, 10);
  }
  for (int y=55; y<130; y=y+20) {
    line(80, y, 90, y);
    line( 100, y, 110, y);
    line( 80, y, 80, y+10);
    line( 90, y, 90, y+10);
  }
  fill(156, 156, 156, 70);
  rect(83, 23, 23, 25);
  line(91, 23, 91, 48);
  line(98, 23, 98, 48);
  //nome
  textAlign(Right);
  fill(255, 0, 0);
  text("Daniela Ratz - 2013", 195, 195);
}



