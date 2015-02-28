
//Autoria: Matheus Willian Dias / Para matéria de Computação, turma S53, UTFPR
//"Cavalheiros Preferem Diamantes" by Matheus Dias, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: http://openprocessing.org/visuals/?visualID= 139160   
//License: 
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/

int value = #E8DA3B; //Variaveis das estrelas cadentes
int estdou = 100;
float[] x = new float[estdou];
float[] y = new float[estdou];
float[] speed = new float[estdou];

int estrela;


void setup() {
  size(600, 600);

  smooth();

  int i = 0; //Trecho de codigo copiado do site http://www.openprocessing.org/sketch/101623 de Jerome Herr
  while (i<estdou) {
    x[i] = random(0, width);
    y[i] =random(0, height);
    speed[i] = random(1, 5);
    i +=1;
  } //Fim do codigo de Jerome Herr
}

void draw() {
  background (0); //Fundo do Palco



  int andy;
  andy=675;
  int andyy;
  andyy=625;

  for (int adn = 0; adn<4;adn++) {
    andy=andy-75;
    andyy=andyy-75;
    fill(value);
    rect(0, andy, 600, -75);//Andar

    line(0, andyy, 600, andyy);//Suporte para lampadas
  }

  int ball; //"x" das ampadas
  ball=-9;

  for (int byb=0; byb<30;byb++) {
    ball=ball+20;

    {
      if (keyPressed) { //Comando Lampadas apagadas
        if (key == 'l' || key == 'L') {
          fill(#646403);
        }
      } 
      else {
        fill(#FEFF03);
      }
      ellipse(ball, 537, 13, 13); //Linhas de lampadas da escada
      ellipse(ball, 537-75, 13, 13);
      ellipse(ball, 537-2*75, 13, 13);
      ellipse(ball, 537-3*75, 13, 13);
    }
  }

  int i = 0; //Trecho de codigo copiado do site http://www.openprocessing.org/sketch/101623 de Jerome Herr

  while (i < estdou) {
    //Estrelas cadentes
    {
      if (mousePressed && (mouseButton == LEFT)) {
        fill(#D1FFEA);
      } 
      else if (mousePressed && (mouseButton == RIGHT)) {
        fill(#C1C1BB);
      } 
      else {
        fill(#FEFF03);
      }
      ellipse(x[i], y[i], speed[i], speed[i]);
      y[i] += speed[i]/2;
    }


    if (y[i] > height) {
      y[i] = 0;
    }
    i +=1;
  } //Fim do codigo de Jerome Herr



  int cx=150;
  for (int re = 0; re<4;re++) {
    fill(#C7DFFC, 180);
    strokeWeight(1);
    cx=cx+50;
    rect(cx, 200, 50, 100); //retangulo do lado de cima do diamante
  }
  triangle(200, 200, 200, 300, 150, 300); //triangulo superior da esquerda
  triangle(400, 200, 400, 300, 450, 300); //triangulo superior direito

  fill(#C7DFFC, 100);
  rect(150, 300, 300, 25); //meio do diamante
  triangle(150, 325, 450, 325, 300, 450); //triangulo inferior
  cx=150;
  for (int re = 0; re<5;re++) {
    cx=cx+50;
    line(300, 450, cx, 325);
  }

  fill(random(5));
  triangle(300, 450, 200, 600, 400, 600); //triangulo suporte

  {
    fill(255);
    triangle(300, -20, 280, 20, 320, 20);
  } //topo do Holofote

  holofote (mouseX, y);
}


void holofote (int x, int y)
{
  fill(255, 50);
  triangle(mouseX, 600, mouseX+600, 600, 300, 0);
}



void mousePressed() {
  if (value == #E8DA3B ) { //Iluminacao das lampadas da escada
    value = #DE2B2B; //Lampada acesa
  } 
  else {
    value = #E8DA3B; //Lampada apagada
  }
  if (estrela == #FEFF03 ) {
    estrela = #C1C1BB;
  } 
  else {
    estrela = #FEFF03;
  }
}

