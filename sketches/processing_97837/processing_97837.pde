
//Brennda Daniela
PImage img;
int k= 250 ;
void setup () {
  size (300, 300);
  background (255, 255, 255);
  font = loadFont("ARDECODE-50.vlw");
  textFont (font, 16);
}
//Animação
void draw() {
  if (mouseX>150) {
    noStroke();
    background(#94ABFC);
    ellipse (20+int(400*sin(k*PI/360)), k, 20, 20); //Lua
    fill(#94ABFC);
    ellipse (27+int(400*sin(k*PI/360)), k, 20, 20); //Lua
  }
  else {
    background(#C1E4F5);
    stroke(#FFD605);
    fill(#FFD605);
    ellipse (20+int(400*sin(k*PI/360)), k, 20, 20); //Sol
    k = k-1;
    if (k==0)
      k=500;
  }
  noStroke();

  k = k - 1;
  if (k==0)
    k=500;
  //Nuvens
  fill(255);//cor:branco
  ellipse(40, 65, 30, 30);
  ellipse(60, 65, 35, 35);
  ellipse(80, 65, 30, 30);
  ellipse(180, 110, 30, 30);
  ellipse(200, 110, 35, 35);
  ellipse(220, 110, 30, 30);
  //Gramado
  stroke(0);
  strokeWeight(1);
  fill(#184814);//cor:verde
  rect(0, 270, 300, 30);
  // Guarda-Corpo
  strokeWeight(2);
  for (int x=21; x<71;x=x+22)
    for (int y=204; y<205;y=y+14) {
      if (mouseX>150) {
        fill(#94ABFC);
        rect(x, y, 24, 15);
      }
      else {
        fill(#C1E4F5);
        rect(x, y, 24, 15);
      }
    }
  line(21, 211, 87, 211);
  //Garagem
  stroke(0);
  strokeWeight(2);
  line(20, 220, 20, 270);
  line(20, 220, 90, 220);
  line(90, 220, 90, 270);
  //Árvores
  noStroke();
  fill(#482B07);//cor:marrom
  rect(5, 230, 6, 40);//Caule da árvore
  fill(#144807);//cor:verde
  ellipse(8, 220, 30, 30);//Copa da árvore
  stroke(#FF0004); //Cor da fruta:vermelho
  strokeWeight(3);
  point(10, 225); //Fruta
  point(15, 213);//Fruta
  point(3, 220);//Fruta
  point(5, 210);//Fruta
  //Entrada
  stroke(0);
  strokeWeight(1);
  fill(#8E1313);
  rect(90, 180, 90, 90);
  fill(#FAD081);//cor:beje
  rect(125, 240, 20, 30);//Porta
  strokeWeight(4);
  point(140, 255);//Maçaneta
  fill(#A5F7F2);
  stroke(0);
  strokeWeight(1);
  rect(100, 200, 10, 70);//"Janela"
  rect(160, 200, 10, 70);//"Janela"
  // Lado direito
  fill(#8E1313);
  rect(180, 180, 100, 90);
  fill(#A5F7F2); 
  rect(190, 240, 30, 15);//Janela
  rect(240, 240, 30, 15);//Janela
  rect(190, 190, 30, 15);//Janela
  rect(240, 190, 30, 15);//Janela
  //Árvores
  fill(#482B07);
  rect(288, 230, 6, 40);//Caule 
  fill(#144807);
  ellipse(290, 220, 30, 30);//Copa 
  stroke(#FF0004); //Cor da fruta
  strokeWeight(3);
  point(290, 225); //Fruta
  point(288, 210);//Fruta
  point(280, 220);//Fruta
  point(298, 218);//Fruta
  fill(255);
  text(dan, 155, 295);
}
PFont font;
String dan= "Brennda Daniela 2013";
