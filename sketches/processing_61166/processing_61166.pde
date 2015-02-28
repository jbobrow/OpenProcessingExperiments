
int totalCirc;//variavel para numero total de objectos, neste caso circulos
float posX, posY;//variaveis para a posição horizontal e vertical do circulo
float diametro;//variavel para o diametro do circulo
float r,g,b;//variaveis para a cor do circulo
float ol;//variavel para controlar a espessura do outline
float LimHori, LimVert;//variaveis para o limite vertical e horizontal


void setup(){//função que define o set up

  size(800,600);//tamanho da janela
  background(0);//cor de fundo da janela
  smooth(); //suaviza o desenho
  totalCirc = 200;//numero total de circulos (controlo do loop)
  LimHori = 800;//digo que o limite horizontal é 800
  LimVert = 600;// digo que o limite vertical é 600
  frameRate(10);// número de 'imagens' que processa por segundo
  noLoop();//não repete o desenho
}

void draw(){//função que define o desenho
  
   background(0);//fundo preto
   noStroke ();//sem outline
   fill (255);//cor
   

      for ( int i = 0; i <totalCirc; i++)//ciclo da ellipse que gera um número até 199 objectos
  {
     posX = random (width/2-LimHori, width/2 +LimHori);//gerar um numero para posição horizonral 
     posY = random (height/2-LimVert, height/2 + LimVert);//gerar um numero para posição vertical
     diametro = random (5, 100);//gerar um diametro entre 5 e 100
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     ol = random (1,10);//gerar um valor para a espessura do stroke (outline), neste caso de 1 a 10
     
     strokeWeight(ol);//gera um valor de 1 a 10 para o outline
     fill(r,g,b);//cor
     ellipse ( posX, posY, diametro, diametro);//desenhar a elipse com os valores gerados
  }



     for (int i=0; i<100; i=i+1)//ciclo da linha que gera um número até 99 objectos
      {
        
        stroke(255,0,0);//cor da linha
        strokeWeight(random(10));//gera um valor de 1 a 10 para o outline
        line (random(height/5-10, width/5+50), random(700, width), random(height/5-50, width/5+50), random(150, width));//desenhar uma linha com os valores gerados
         
     }
     
     for (int e=0; e<100; e=e+1)//ciclo da linha que gera um número até 99 objectos
     {
       
         if (random(100) > 50)//gera um numero aleatório entre 1 e 100, no caso do numero gerado for maior que 50
     
     {
     
         line (random(width/2-LimHori), random(width/4+LimVert), 800, random(0, width));//desenhar uma linha com os valores gerados  
       
     }   else//senão
     
     {
         stroke(200);//desenha uma linha com espessura de 200
     }
     
       strokeWeight(1);//espessura da linha
   
   }
   
   
   
}

