
//Monyse Takaki
//Projeto final COMPOSIÇÃO + INTERAÇÃO
  
PFont fonte;
  
void setup () {
  size (400,400); //Tamanho da área de composição
  background (63, 188, 222); //Estabelece o fundo em cor ciano
  fill (193, 27, 105, 90); //O terceiro elemento define a transparência
  stroke (193, 27, 105, 90); //Cor do traço
  strokeCap (ROUND); //Suaviza os traços
  fonte = createFont ("Calibri", 20); //Cria a fonte
  textFont (fonte); //Vai ser utilizada para assinatura ao final
}
  
color corelipse;
  
  void draw () {
      
    int mx = mouseX;
    int y = mouseY;
    scale (0.5);
    background (0);
    {
      if (mx>=200 && mx<=400 && y>=200 && y<=400)
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
  
      //Composição
      for (int x = 50; x<800; x=x+50) {
        ellipse (x, 100, 100, 100);
        ellipse (x, 290, 100, 100);
        ellipse (x, 480, 100, 100);
        ellipse (x, 670, 100, 100) ;
      }
      for (int x = 75; x<750; x=x+50) {
        ellipse (x, 50, 100, 100);
        ellipse (x, 140, 100, 100);
        ellipse (x, 240, 100, 100);
        ellipse (x, 330, 100, 100);
        ellipse (x, 430, 100, 100);
        ellipse (x, 520, 100, 100);
        ellipse (x, 620, 100, 100);
        ellipse (x, 710, 100, 100);
      }
      textAlign (RIGHT);
fill (0); //Cor do texto
text ("Monyse Takaki", width*2-10, height*2-10); //Assinatura
    }
  }
