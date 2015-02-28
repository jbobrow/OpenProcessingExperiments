
PFont texto;//variavel para definir texto 

int objectos;//variavel com o numero de objectos que vou usar

float r;//variavel para a cor r- vermelho
float g;//variavel para a cor g- verde
float b;//variavel para a cor b- azul

void setup(){//definiçoes do setup
  
  size (600, 600);//tamanho da janela
  
  background (0);//cor de fundo (preto)
  
  objectos = 23;//definiçao do numero de objectros da variavel "objectos"
  
  texto = loadFont ("AdobeGothicStd-Bold-48.vlw");//criaçao de uma fonte de texto
  //dizer ao processing a fonte que pretendo usar
  
  textFont (texto, 100);// definir o tamanho da fonte da variavel "texto"
  
  smooth();//suavizar as formas
}

void draw(){//definiçoes de desenho
  

  for (int x = 1; x < objectos; x = x+1){//variavel para gerar o numero de objectos 
  //alinhados em X
    
  r = map (x, 0, objectos, 0, 255);//definiçao das coordenadas da cor r- vermelho
  

    
    fill (r, 0, 0);// definiçao da cor
    ellipse ( x * 25, height/2 - 100, 15, 15); // desenho de elipses
 
  }
  
  
  
   for (int x = 1; x < 23; x = x+1){//variavel para gerar o numero de objectos
   //alinhados em X
    
    g = map (x, 0, objectos, 0, 255);//definiçao das coordenadas da cor g- verde 
    
    fill (0, g, 0);//definiçao da cor
    ellipse ( x * 25, height/2, 15, 15); //desenho de elipses
 
  }
  
     for (int x = 1; x < 23; x = x+1){// variavel para gerar o numero de objectos
     //alinhados em X
       
    b = map (x, 0, objectos, 0, 255);//definiçao das coordenadas da cor b- azul
       
    fill (0, 0, b);//definiçao da cor
    ellipse ( x * 25, height/2 + 100, 15, 15); //desenho de elipses
     }
  
  fill (255, 0, 0);//definiçao da cor
  text ("R", 100, 150);// texto com a letra "R"
  
    fill (0, 255, 0);//definiçao da cor
  text ("G", 250, 150);// texto com a letra "G"
  
    fill (0, 0, 255);//definiçao da cor
  text ("B", 400, 150);//texto com a letra "B"
  
}

