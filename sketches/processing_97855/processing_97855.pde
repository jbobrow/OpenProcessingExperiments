
//Renata Munhoz
//Planta da casa de Blas, arquiteto Alberto Baeza
PFont fonte;
void setup() {
  size(200, 200);
  background(107, 142, 35);
  fonte = createFont("Emblem", 12); 
  textFont(fonte);
}
void draw() {
  //scale(4); 
  fill(255);
  rect(10, 70, 180, 55);
  strokeWeight(1);
  rect(30, 78, 111, 39);//Parte da cobertura
  strokeWeight(2);
  fill(255);
  rect(55, 85, 62, 25);//parde de vidro
  strokeWeight(1);
  fill(0);
  for (int e = 31; e < 160; e = e+36)//Pilares
    ellipse(e, 79, 2, 2);
  for (int e = 31; e < 160; e = e+36)//Pilares
    ellipse(e, 116, 2, 2);
  fill(255);
  for (int i = 70; i < 130; i = i+5) //parte inferior de concreto
    line(10, i, 190, i);
  for (int x = 10; x < 190; x = x+8) 
    line(x, 70, x, 125);
  line(190, 70, 190, 125);
  rect(162, 80, 24, 35);//Piscina
  for (int s = 68; s < 83; s = s+2)//escada
    line(s, 95, s, 90);
  for (int s = 90; s < 108; s = s+2)
    line(s, 95, s, 90);
  if (mouseX>162 && mouseX<162+24 && mouseY>80 && mouseY<115)//colorir a piscina
    fill(0, 178, 238);
  rect(162, 80, 24, 35);
  textAlign(RIGHT);  //escrever
  fill (255);
  text("Renata Munhoz", 195, 190);
  text("Planta da Casa de Blas", 140, 15);
}
