

int Objectos; // variavel nomeada objectos
float posX, posY; // variaveis para a posição horizontal e vertical do inicio da linha 
float tamanho; // variavel para o tamanho da linha 
float r,g,b; // variaveis para a cor 
float s; // variavel  grossura do contorno


void setup() {//elementos estaticos e constantes

  size (700,700);//definiçao da delimitaçao da area de trabalho
  background (127); //defeniçao da cor de fundo
  smooth();//suavizaçao dos elementos
  noLoop();//ausencia de movimentos
  Objectos = 700;// numero total de linhas
  
 
}

void draw(){// elementos em constantes metaforse
  
  colorMode(RGB, 255,255,255);//definiçao da utilizaçao do sistema de cores rgb
  background(127);//cor de fundo,e igual a cinza 
  colorMode(HSB, 360,100,100); // mudançao de sistema de cor para hsb
  
  for ( int i = 0; i <Objectos; i++)//funçao que diz que i varia 0 a 700 
  {
    
     posX = random(0,width);//x vai variar entre 0 e largura 
     posY = i; // vai variar entre 0 e 700 que vai ser equivalente a 700
     
     float h = map ( i,0, Objectos, 0,360); //funçao que diz que 700, a 0 os objectos vao tomar tonalidades entre 0,360 da gama hsb
     
     tamanho = map ( i, 0, Objectos, width,0); //funçao que diz que os de objectos de forma organizada  variao de largura total a 0
    
     s = map(i,0,Objectos ,3,1);//funçao que diz que os de objectos de forma organizada  variao de 3 a 1
     
     
     strokeWeight(s);//a grossura do contorno muda  conforme a aproximaçao do 0 vai ficar 1
     stroke(h,100,100);//a cor do contorno muda dando a volta de forma organizadado ao hsb,alterando apenas o h
    
    
      line(posX,posY,tamanho,tamanho);// construçao de linhas posicionas segundo variaveis anteriores construidas
    }}
  
  

         





