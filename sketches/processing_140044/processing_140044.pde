
//Guilherme de Luca Soares
//Universidade Tecnológica Federal do Paraná
//Bacharelado em Arquitetura e Urbanismo

//Edifício Palladium de Guilherme Soares está licenciado com uma Licença Creative Commons - Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
//Data:11/03/2014

PFont fonte;

int c; //céu

int neve=1000;
float[] nevex;
float[] nevey;


void janelas(int x, int y) {
  rect(x, y, 10, 10);
  rect(x-90, y+40, 10, 10);
  rect(x-90, y+50, 10, 10);
  rect(x-40, y+80, 10, 10);
  rect(x-30, y+80, 10, 10);
  rect(x-120, y+210, 10, 10);
  rect(x-10, y+250, 10, 10);
  rect(x, y+270, 10, 10);
  rect(x-80, y+300, 10, 10);
  rect(x-70, y+300, 10, 10);
  rect(x-70, 310, 10, 10);
  rect(x-100, y+390, 10, 10);
}


void setup() {
  size(400, 620);
  background(255);

  fonte = createFont ("ArialMT", 12);
  textFont (fonte);

  //estrelas
  nevex = new float[neve];
  nevey = new float[neve];
  for (int i=0; i<neve; i++)
  {
    nevex[i] = floor(random(width));
    nevey[i] = floor(random(height));
  }
}


void draw() {
  background(0);

  for (int c=1; c<620; c+=1) {
    if (mouseX<height-400)
      stroke(c/2.5, 157, 255);
    else
      stroke(0, 45, c/2.5);
    line(0, c, 620, c);
  } //céu


  //neve
  stroke(255);
  for (int e=0;e<300;e++)
  {
    point(nevex[e], nevey[e]);
    nevey[e]=nevey[e]+random(0, 1);
    nevex[e]=nevex[e]-random(0, 1);

    if (nevey[e]>height)
    {
      nevex[e] = floor(random(height));
      nevey[e] = floor(random(width*10));
    }
  }

  stroke(0);
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

  for (int i=100;i<260;i=i+10) {
    for (int j=130;j<600;j=j+10)
      rect(i, j, 10, 10);
  } //esquadriavidros

  fill(#FFFFFF);
  rect(100, 90, 160, 30); //cobertura 1
  for (int i=100; i<260; i=i+10) {
    for (int j=90;j<120;j=j+10)
      rect(i, j, 10, 10);
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

  janelas(230, 140);

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



