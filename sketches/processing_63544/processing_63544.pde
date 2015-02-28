
  int totalObjectos; // numero total de objectos
  
  float posX, posY; // variaveis para a posição horizontal e vertical do circulo
  float tamanho; // variavel para o tamanho do circulo

void setup()//comando setup
{
  
  float sizeW,sizeH;//variavel nas medidas horizontais e verticais
  sizeW=700.0;//tamanho da variavel na largura
  sizeH=sizeW/1.3333;//tamanho da variavel na altura
  size((int)sizeW,(int)sizeH);//define o tamanho da janela
  smooth();//alisa as arestas do quadrado
  noLoop();//nao deixa que existam repetições
  
  totalObjectos = 800;// numero total de objectos
}

void draw()//comando de desenho
{
  
  colorMode(RGB, 255,255,255);//define os valores por onde passará a cor dentro do espectro rgb
  
  background(255);//define o branco como cor de fundo da janela
  
  colorMode(HSB,360,100,100);//são defenidos os valores por onde passará a figura, aqui definido pelo brilho e saturação
  
  for( int i=0;i<totalObjectos;i++)//neste ciclo for são controlados uma serie de repetiçoes
{
  // cria uma posição com base na iteração "i"
  
  posX=i;//width/2 + random (-i,i); // aqui é criado um numero para posição horizonral 
  posY=random(0,1000);//criar um numero para posição vertical
  
  float h=map(i,0,totalObjectos,0,360);//neste circulo for é dito ao programa para ele passar por todas as cores de rgb
     
  tamanho=map(i,0,totalObjectos,200,200);//mapeia os objectos com as suas medidas de 200px
    
  fill(h,100,100);//define o preenchimento dos circulos e a intensidade da cor
  ellipse(posX,posY,tamanho,tamanho);//desenhar a elipse com os valores gerados anteriormente pelas variaveis
} 
} 


