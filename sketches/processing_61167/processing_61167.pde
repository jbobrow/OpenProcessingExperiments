
int totalObj;//numero total de objectos, neste caso circulos e quadrados
  
float posX, posY;//variaveis para a posição horizontal e vertical das figuras
float diametro;//variavel para o diametro
float r,g,b;//variaveis para a cor
float px,py;//variavel para posição horizontal e vertical
float s;//define o tamanho das linhas

void setup()//definições de setup
{  
  size(800,600);//tamanho da janela
  background(255);//cor de fundo, branco
  smooth();//suaviza o desenho
  noLoop();//não repete
  
  totalObj = 300;//numero total de quadrados
  
}

void draw(){//função que define o desenho

  colorMode(HSB,360,100,100,100);//mudar a cor para HSB - Hue Saturation Brightness
  
  //origina uma posição aleatoria na janela com as seguintes variaveis que irao ser usadas em baixo
  px = width-width/2 ;//dizemos ao programa que pX é = a largura-largura dividir por 2
  py = height ;//dizemos ao programa que pY é = a altura
     
  //origina uma posição aleatoria na janela com as seguintes variaveis que irao ser usadas em baixo
  posX = width;//dizemos ao programa que posX é = a largura
  posY = height;//dizemos ao programa que posY é = a altura
     
  for(int i=0;i<totalObj;i++)////ciclo do quadrado e linha que gera um número até 300 objectos tanto de linhas como de quadrados
{
   
  posX=random(width);//gera um numero aleatorio para posição horizontal
  posY=random(height);//gera um numero aleatorio para posição vertical
     
  diametro=map(i,0,totalObj,80,1);//o diametro é igual ao mapeamento, que se relaciona com o tamanho dos objectos e com a sua quantidade 
      
  float h=map(i,0,totalObj,0,360);//cria numeros diferenciados para os valores de hue que vai ser representado com a variavel h
       
  fill(h,55,55,diametro*10);//define o preenchimento das figuras neste caso dos circulos e dos quadrados
  rect(posX,posY,diametro,diametro);//desenhar os quadrados com os valores gerados
     
  s= random(1);//variavel para o valor de s que representa a espessura da linha      
  strokeWeight(s);//comando para definir a espessura da linha com os valores k foram atribuidos acima
  
  line(px, py, posX, posY);//coordenadas da linha com os dados em cima assumidos pelas variaveis 
} 

         
}




