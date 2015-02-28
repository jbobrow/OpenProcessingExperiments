
//Guilherme de Luca Soares
//Universidade Tecnológica Federal do Paraná
//Bacharelado em Arquitetura e Urbanismo

PFont fonte;

void setup() {
  size(400, 620);
  background(255);
  fonte = createFont ("FreesiaUPC", 20);
  textFont (fonte);
}

void draw() {

  //céu
  if (mouseX<height-400)
    fill (242, 251, 255);
  else
    fill(0, 27, 41);

  noStroke();
  rect(0, 0, 400, 620);
  stroke(0, 0, 0);

  //título
  if (mouseX<height-400)
    fill (0);
  else
    fill(255);
  textAlign (RIGHT);
  text("EDIFÍCIO PALLADIUM", 390, 590);
  text("Curitiba - Brasil", 390, 600);

  fill(#DED3B7);
  rect(140, 60, 80, 40);//caixa d'agua

  fill(#1060A0);
  rect(100, 130, 160, 470); //prédio
  for (int i =130;i<600;i=i+10) {
    line(100, i, 260, i);
  } //esquadriavidros
  for (int i=100; i<260; i=i+10) {
    line(i, 130, i, 600);
  } //esquadriavidros

  fill(#FFFFFF);
  rect(100, 90, 160, 30); //cobertura 1
  for (int i=90; i<120; i=i+10) {
    line(100, i, 260, i);
  }
  for (int i=100; i<260; i=i+10) {
    line(i, 90, i, 120);
  }

  fill(#4484B7);
  rect(120, 120, 120, 10); //terraço1
  for (int i=120;i<240;i=i+40) {
    line(i, 120, i, 130);
  }


  fill(#FFFFFF);
  //guarda-corpo



  for (int i=150; i<180; i=i+20) {
    rect(220+mouseX*-0.1, i, 50, 10);
  }
  for (int i=230; i<280; i=i+20) {
    rect(180+mouseX*-0.2, i, 40, 10);
  }
  for (int i=320; i<370; i=i+20) {
    rect(90+mouseX*0.1, i, 50, 10);
  }
  for (int i=400;i<430;i=i+20) {
    rect(140+mouseX*0.2, i, 40, 10);
  }
  for (int i=470;i<520;i=i+20) {
    rect(220+mouseX*-0.1, i, 50, 10);
  }
  for (int i=540;i<570;i=i+20) {
    rect(90+mouseX*0.1, i, 50, 10);
  }


  //janelas

  if (mouseX<height-300)
    fill (#1060A0);
  else
    fill(245, 237, 74);
  rect(230, 140, 10, 10);
  rect(140, 180, 10, 10);
  rect(140, 190, 10, 10);
  rect(190, 220, 10, 10);
  rect(200, 220, 10, 10);
  rect(110, 350, 10, 10);
  rect(220, 390, 10, 10);
  rect(230, 410, 10, 10);
  rect(150,440,10,10);
  rect(160,440,10,10);
  rect(160,450,10,10);
  rect(130, 530, 10, 10);
  if (mouseX<height-300)
    fill (#4484B7);
  else
    fill(245, 237, 74);
  rect(160, 120, 40, 10);


  //porta
  if (mouseX<height-300)
    fill (#4484B7);
  else
    fill(245, 237, 74);
  rect(160, 580, 40, 20);
  line(180, 580, 180, 600);

  //escadaria
  fill(255);
  rect(90, 600, 180, 2);
  rect(80, 602, 200, 2);

  //grama
  noStroke();
  fill(#E0E0E0);
  rect(0, 604, 400, 16);
  fill(#248112);
  rect(0, 604, 400, 10);
}



