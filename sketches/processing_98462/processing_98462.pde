
// Emanuele S. Reis
// Trabalho Conclusão de Disciplina - 1º Período Arquitetura e Urbanismo - UTFPR
// Elevação Frontal - Residência em Fortaleza
// Arquitetura / Ricardo Fernandes / FERNANDES ATEM ARQUITETOS - ano do projeto / 1999


void setup () {

  PFont font1; //PFont para a fonte e escrever o nome
  PImage img; // Imagem do fundo como background
  PImage pointer;// Imagem 
  font1= loadFont ("CenturyGothic-14.vlw");// Fonte
  img=loadImage ("campo.jpg");/* @pjs preload="campo.jpg"; */
  size (200, 200);// Tamanho da tela
  image (img, 0, 0);// Posição da imagem
  textFont (font1);// Fonte/texto
  //Entrada
  noStroke();
  fill (#1B3E11);
  rect (65, 160, 140, 50);
  triangle (65, 150, 0, 200, 65, 200);
  fill(255);
  line (65, 170, 40, 200);
}
void draw () {
  // Composição da casa/ Elementos
  stroke (0);
  fill(#C19269); // cor da chaminé e paredes da casa (fachada)
  rect (120, 45, 25, 50);// composição da chaminé da casa
  noStroke ();//sem contorno
  triangle (65, 90, 155, 50, 155, 90);// Sótão
  fill(#EDC49E);
  stroke (0);// cor do contorno
  strokeWeight (2);//expessura do contorno
  rect (65, 90, 100, 40);// parede fachada
  rect (65, 90, 100, 85);//parede fachada
  fill(0); //cor do preenchimento
  rect (165, 130, 4, 45);//parede fachada
  strokeWeight (1);//expessura do contorno
  stroke (0);//cor do contorno
  fill(255);//cor do preenchimento
  strokeWeight (4);
  rect (125, 95, 40, 30);//janela grande à direita
  strokeWeight (1);
  fill(0);//cor do preenchimento marquise e pilares laterais
  rect (120, 93, 45, 3);// marquise
  rect (60, 130, 3, 45);
  fill(#E0C6BC); 
  rect (125, 97, 20, 30);
  rect (145, 97, 20, 30);
  // guarda-corpo em vidro à direita
  noFill ();
  stroke (#431808);
  strokeWeight (2);
  for (int c=125; c<160; c=c+20) {
    for (int d=110; d<130; d=d+5) {
      rect (c, d, 20, 5);
    }
  }
  // Janelas pequenas à esquerda
  strokeWeight (1);
  for (int a= 95; a<110; a+=3) { 
    for (int b= 65; b<110; b=b+10) {
      if (mouseX<150 && mouseX>100)// coordenadas para a "luz"
        fill(255);//interação com a luz do cômodo na janela
      else
        fill(#0F3B55);
      rect (b, a, 10, 5);
    }
  }  
  //Colunas tijolo
  fill (#5A2D13);
  for (int e=130; e<170; e+=3) {//colunas tijolo
    rect (65, e, 8, 5);//primeira
    rect (120, e, 4, 5);//segunda
    rect (160, e, 4, 5);//terceira
  }
  //Garagem
  fill (#C19269);
  rect (75, 135, 45, 40);
  strokeWeight (4);
  rect (125, 140, 20, 35);// porta entrada
  rect (145, 140, 15, 35);// porta entrada
  fill(#292725);
  noStroke ();
  rect(75, 135, 45, 2);
  rect (75, 135, 2, 40);
  //Telhado
  stroke (0);
  strokeWeight (2);// expessura da linha
  line (155, 50, 155, 90);// linha telhado
  rect (60, 130, 110, 3);
  strokeWeight (1);
  stroke (#5A2D13);//cor do linha
  int x = 140;//coordenadas
  int y =55;//coordenadas
  int dtelhax = 20;//coordenadas
  int dtelhay = -5;//coordenadas
  int ptx = -20;//coordenadas
  int pty = 9;//coordenadas
  for (int i = 0; i <5; i++) {//cobertura, telhado
    line(x, y, x+dtelhax, y+dtelhay);
    x += ptx;
    y += pty;
  }
  // Têxtura portão
  fill (0);
  int f = 135;
  while (f < 175) {
    line(75, f, 120, f);
    f = f + 2;
  } 
  int g = 140;
  while (g < 175) {
    line(160, g, 120, g);
    g = g + 2;
  }
  // Entrada
  stroke(#081704);
  strokeWeight (4);
  line (60, 175, 25, 200);
  line (170, 175, 200, 200);
  // Anoitecer
  noStroke ();
  for (int n=0; n<50; n=n+400) {
    fill (#122F58, 5);
    rect (0, 0, 200, 200);
    // Nome/texto/assinatura
    textAlign(RIGHT);
    fill (255);
    text("Emanuele Reis 2013", width-5, height-5);
  }
}



