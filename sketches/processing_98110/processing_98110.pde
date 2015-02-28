
//Aline da Silva Lima
//Trabalho realizado utilizando o estudo de prédio de apartamentos
//em Patos de Minas (que não foram construídos);
//Fonte: http://atelierpaulojose.blogspot.com.br/2010/12/edificios-de-apartamentos-em-patos-de.html;
//acesso em 30/04/2013  às 10:40h
//Arquiteto Paulo José, de Patos de Minas - Minas Gerais.

PFont fonte;
void setup () {
  size (200, 200);
  background (#089FC6);
  fonte = createFont("Serif", 12);
  textFont(fonte);
}

int c=0;
void draw () {
  noStroke ();
  fill (#F7EC05, 200);
  ellipse (20, 20, 40, 40);
  fill (#F7EC05);
  ellipse (20, 20, 30, 30);
  int k= mouseX;
  int g= mouseY;
  {
    if (k>=0 && k<=200 && g>=10 && g<=180)//anoitecendo
      background (#060550);
  }
  stroke (1);
  fill (#3E3B3B);
  rect (60, 50, 80, 140);// prédio 
  triangle (60, 50, 140, 50, 140, 10);
  fill (255);
  rect (140, 70, 10, 120);//parte lateral do prédio
  fill (100);
  for (int x=75; x<180; x+=30) { 
    fill (111, 94, 98);
    rect (142, x, 5, 5);//janelas 
    for (int y=65; y<175; y+=25) { 
      fill (#3E3B3B);
      rect (60, y, 80, 7); //sacada
      for (int z=60; z<140; z+=5) {
        for (int j= 67; j<180; j=j+25)
          rect (z, j, 1, 5);
      }//detalhes da sacada
      fill (230);
      rect (65, y-8, 70, 9); //abertura do prédio para portas
      fill (200);
      rect (70, y-7, 15, 7);//portas andares
      rect (85, y-7, 15, 7);
      rect (115, y-7, 5, 5);//janelas prédio central
      rect (120, y-7, 5, 5);
      ellipse (130, 37, 15, 15);
      fill (111, 94, 98, 200);
      rect (60, y-2, 80, 4.5);//vidro da sacada
      fill (255);// entrada
      rect (85, 173, 30, 20);
      fill (111, 94, 98);
      rect (90, 180, 20, 10);
      for (int z=63; z<83; z+=5) {
        fill (#0CB704);
        ellipse (173, 165, 25, 25);// arvores ao lado do prédio
        ellipse (185, 167, 25, 25);        
        ellipse (z, 180, 5, 9);// arvores entrada
        fill (#8E600A);
        rect (169, 177, 6, 15);
        rect (182, 180, 6, 12);
        rect (z-2, 183, 3, 6);
        fill (150);//calçada
        rect(0, 190, 200, 20);
        fill (34);//rua
        rect (0, 195, 200, 10);
      }
      fill (#E80707);
      rect (c, 190, 15, 6);// carro passando
      if (c<=2000)
      {
        c++;
      }
      else
        c=1;
    }
  }
  textAlign(RIGHT);
  fill (255);
  text("Aline da Silva Lima, 2S 2012", width-5, height-190);
}
