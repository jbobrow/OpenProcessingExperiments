
//Monyse Takaki
//Projeto final COMPOSIÇÃO + INTERAÇÃO
 
 import processing.pdf.*; //Importar para PDF
 
PFont fonte;
 
void setup () {
  size (800, 763, PDF, "composição.pdf"); //Tamanho da área de composição
  background (63, 188, 222); //Estabelece o fundo em cor ciano
  fill (193, 27, 105, 90); //O terceiro elemento define a transparência
  stroke (193, 27, 105, 90); //Cor do traço
  strokeCap (ROUND); //Suaviza os traços
  fonte = createFont ("Calibri", 12); //Cria a fonte
  textFont (fonte); //Vai ser utilizada para assinatura ao final
}
 
color corelipse;
 
  void draw () {
     
    int mx = mouseX;
    int y = mouseY;
    background (0);
    {
      if (mx>=400 && mx<=800 && y>=400 && y<=763)
      {
        background (255, 240, 64); //Transforma o
      //background em cor amarela
     corelipse = color (129, 53, 160, 90);
    }
        else
        {
        background (63, 188, 222);
      corelipse = color (4, 90);
        }
        fill (corelipse); //O terceiro elemento define a transparência
      stroke (193, 27, 105, 90); //Cor do traço
      strokeCap (ROUND); //Suaviza os traços
 
      //Primeira faixa
      for (int x = 50; x<800; x=x+50) {
        ellipse (x, 100, 100, 100);
      }
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 50, 100, 100);
      }
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 140, 100, 100);
      }
      //Segunda faixa
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 240, 100, 100);
      }
      for (int x = 50; x<800; x=x+50) {
        ellipse (x, 290, 100, 100);
      }
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 330, 100, 100);
      }
      //Terceira faixa
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 430, 100, 100);
      }
      for (int x = 50; x<800; x=x+50) {
        ellipse (x, 480, 100, 100);
      }
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 520, 100, 100);
      }
      //Quarta faixa
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 620, 100, 100);
      }
      for (int x = 50; x<800; x=x+50) {
        ellipse (x, 670, 100, 100) ;
      }
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 710, 100, 100);
      }
      textAlign (RIGHT);
fill (255);
text ("Monyse Takaki", width-10, height-10); //Assinatura
    }
    exit ();
  }
