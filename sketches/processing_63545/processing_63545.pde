
  int totalObjectos;//variavel para definir o nimero total de objectos

  int LAYER2_totalObjectos;//variavel para layer 2
  int LAYER3_totalObjectos;//variavel para layer 3
  float posX, posY; // variaveis para a posição horizontal e vertical do circulo e do quadrado
  float diametro; // variavel para o diametro do circulo
  float r,g,b; // variaveis para a cor do circlo e do quadrado


void setup() //comandos setup
{
  float sizeW, sizeH;//variavel nas medidas horizontais e verticais
  sizeW = 700.0;//tamanho da variavel na largura 
  sizeH = sizeW / 1.3333;//tamanho da variavel na altura 
  size ( (int) sizeW, (int) sizeH);//define o tamanho da janela 
  background (255);//define a cor branca do fundo 
  smooth();// alisa as arestas do quadrado
  noLoop();// inpede a repetição das figuras
  
  
  totalObjectos = 900; // na janela vao aparecer um total de 900 circulos
  LAYER2_totalObjectos = 5; // definição de numero de quadrados na 2º layer
  LAYER3_totalObjectos= 10;//numero de circulos na 3º layer
}

void draw()//comandos de desenho
{
  for ( int i = 0; i <totalObjectos; i++)//neste ciclo for é controlada uma serie de repetiçoes
{
  posX = random (width); // cria um numero aleatorio para posição horizonral 
  posY = random (height); // cria um numero aleatorio para posição vertical
  diametro = random (5,60); // cria um diametro entre 5 e 60
  r = random(255); // cria um valor para a cor vermelha entre 0 e 255
  g = random(255); // cria um valor para a cor verde entre 0 e 255
  b = random(255); // cria um valor para a cor azul entre 0 e 255
     
    
  fill(r,g,b);//preenchimento do circulo com as cores rgb
  ellipse ( posX, posY, diametro, diametro); // desenhar a elipse com os valores  das variaveis gerados anteriormente
    
} 
  
  for ( int i = 0; i < LAYER2_totalObjectos; i++)//neste ciclo for é controlada uma serie de repetiçoes na layer 2 neste caso
{
  posX = random (width); //cria um numero para posição horizonral 
  posY = random (height); //cria um numero para posição vertical
  diametro = random (200, 400); // cria um diametro entre 200 e 400
     
     
     
  fill(r,g,b);//preenchimento  do quadrado com as cores rgb
     
  diametro=random(50,300);//cria um diametro entre 50 e 300
     
  rect(random(posX),random(posY),diametro,diametro);//coorcenadas do quadrado
} 
  for ( int i = 0; i < LAYER3_totalObjectos; i++)//neste ciclo for é controlada uma serie de repetiçoes na layer 3 neste caso
{
  diametro= random(90,450);//cria um diametro entre 90 e 450
  fill(random(255));//o preenchimento dos circulos e feito aleatoriamente nas escalsa de cinza 
  ellipse(random(posX),random(posY),diametro,diametro);//coordenadas da elipse presente na layer 3
} 
}

