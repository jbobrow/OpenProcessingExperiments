
  int totalObjectos;//numero total de objectos, neste caso circulos e quadrados
  
  float posX, posY;//variaveis para a posição horizontal e vertical das figuras
  float diametro;//variavel para o diametro das figuras
  float r,g,b;//variaveis para a cor das figuras
  float px,py;//variavel para posição horizontal e vertical das figuras
  float s;//define o tamanho das linhas

void setup()//definições de setup
{  
  float sizeW,sizeH;//variavel nas medidas horizontais e verticais
  sizeW=700.0;//tamanho da variavel na largura 
  sizeH=sizeW/1.3333;//tamanho da variavel na altura 
  size((int)sizeW,(int)sizeH);//define o tamanho da janela 
  background(255);//definição da cor do fundo, neste caso em branco
  smooth();//alisa as arestas do quadrado
  noLoop();//inpede a repetição das figuras
  
  
  totalObjectos = 300;//numero total de circulos, neste caso 300
  
}

void draw(){//definições de desenho
  
  
  colorMode(HSB,360,100,100,100);//mudar a cor para HSB - Hue Saturation Brightness
  
  //origina uma posição aleatoria na janela com as seguintes variaveis que irao ser usadas em baixo
  px = width ;//dizemos ao programa que pX é = a largura
  py = height ;//dizemos ao programa que pY é = a altura
     
  //origina uma posição aleatoria na janela com as seguintes variaveis que irao ser usadas em baixo
  posX = width;//dizemos ao programa que posX é = a largura
  posY = height;//dizemos ao programa que posY é = a altura
     
  for(int i=0;i<totalObjectos;i++)//neste ciclo for é controlada uma serie de repetiçoes de acordo com os parametros acima indicados, entre eles o numero total de objectos representados na janela 
{
    
  //origina uma posição aleatoria na janela
  posX=random(width);//gera um numero aleatorio para posição horizonral
  posY=random(height);//gera um numero aleatorio para posição vertical
     
  diametro=map(i,0,totalObjectos,80,1);//aqui dizemos que o diametro é = ao mapeamento, que se relaciona com o tamanho dos objectos e com a sua quantidade 
      
  float h=map(i,0,totalObjectos,0,360);//cria numeros diferenciados para os valores de hue que vai ser representado com a variavel h
       
  fill(h,100,100,diametro*10);//define o preenchimento das figuras neste caso dos circulos e dos quadrados
  rect(posX,posY,diametro,diametro);//desenhar os quadrados com os valores gerados
      
  ellipse (posX,posY,diametro,diametro);//cria as elipses com as coordenadas anteriormente geradas
  
  s= random(2);//variavel para o valor de s que representa a espessura da linha      
  noTint();//ordena que os comandos abaixo ou seja a linha nao fique com o preenchimento das figuras anteriores
  strokeWeight(s);//comando para definir a espessura da linha com os valores k foram atribuidos acima
  
    
  line(px, py, posX, posY);//coordenadas da linha com os dados em cima assumidos pelas variaveis 
} 

         
}




