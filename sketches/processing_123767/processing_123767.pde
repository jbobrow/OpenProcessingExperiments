
void setup() {
  size(400, 325);
  background(255);
}

int a = 0;

void draw() {
  noStroke();

  if (mouseX<height-20)
    fill (11, 62, 103);
  else
    fill(69, 159, 206);
  rect(0, 0, 400, 325); //céu
  fill(255);


  if (mouseX<height-20)
    fill (250, 250, 210);
  else
    fill(255, 244, 23);
  ellipse(a++, 50, 50, 50); //lua

  if (a>500)
    a=-10;

  fill(255);



  fill(1, 93, 0);
  rect(0, 260, 400, 65); //chão
  fill(255);

  stroke(5);

  fill(72);
  rect(80, 100, 140, 180); //retângulo1
  fill(255);

  for (int i=100; i<200; i=i+20) { 
    line(80, i+20, 220, i+20);
  } 
  for (int i=80;i<220;i=i+35) {
    line(i, 100, i, 280);
  }

  fill(165, 52, 61);
  rect(10, 200, 160, 80); //retângulo2
  fill(255);

  fill(196);
  rect(220, 180, 140, 100); //retângulo3
  fill(255);

  rect(30, 220, 120, 60); //garagem
  line(30, 249, 150, 249);
  fill(242, 252, 244);
  line(30, 251, 150, 251);
  fill(255);
  line(30, 234, 150, 234);
  line(30, 236, 150, 236);
  line(30, 264, 150, 264);
  line(30, 266, 150, 266);
  noStroke();
  fill(237);
  quad(30, 281, 15, 325, 145, 325, 150, 281); //calçadagaragem
  fill(255);
  stroke(5);

  rect(170, 130, 10, 150); //coluna
  for (int i=130;i<280;i=i+38) {
    line(170, i, 180, i);
  }

  rect(100, 130, 80, 10); //viga
  for (int i=100;i<180;i=i+40) {
    line(i, 130, i, 140);
  }

  if (mouseX<height-20)
    fill (240, 255, 70);
  else
    fill(252);

  rect(110, 140, 60, 60); //janela1
  for (int i=110;i<170;i=i+20) {
    line(i, 140, i, 200);
  }
  fill(255);

  rect(145, 180, 5, 3);

  fill(204, 235, 250, 150);
  rect(100, 180, 70, 30); //parapeito
  fill(255);

  fill (240, 255, 70);
  rect(195, 240, 10, 50);
  fill(255);

  fill(124, 99, 59);
  rect(185, 220, 30, 60); //porta
  fill(255);
  rect(210, 260, 5, 3);
  noStroke();
  fill(237);
  quad(185, 281, 170, 325, 215, 325, 215, 281); //calçadaporta
  fill(255);
  stroke(5);

  rect(180, 210, 160, 10); //viga3
  for (int i=180;i<340;i=i+54) {
    line(i, 210, i, 220);
  }

  if (mouseX<height-20)
    fill (240, 255, 70);
  else
    fill(252);
  rect(270, 220, 50, 55); //janela2
  line(295, 220, 295, 275);
  line(270, 247, 320, 247);
  fill(255);

  if (mouseX<height-20)
    fill(240, 255, 70);
  else
    fill(252);
  rect(195, 140, 10, 50);

  //árvores
  noStroke();
  fill(150, 233, 27, 150);
  ellipse(300, 260, 60, 50);
  fill(100, 72, 10, 150);
  rect(299, 285, 2, 40);
}



