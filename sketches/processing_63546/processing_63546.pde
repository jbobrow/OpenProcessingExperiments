
  int totalObjectos;//numero total de objectos, neste caso quadrados

  float posX, posY;//variaveis para a posição horizontal e vertical do quadrado
  float diametro;//variavel para o diametro do quadrado
  float r,g,b;//variaveis para a cor do quadrado
  float probabilidade;//variaveis para definir as probabilidades 
  float percentagem;//variaveis para definir as percentagens 
  int countProbabilidade;//contagem de probabilidade 

void setup()//comando de setup
{ 
  float sizeW,sizeH;//variavel nas medidas horizontais e verticais
  sizeW=700;//tamanho da variavel na largura 
  sizeH=sizeW/1.3333;//tamanho da variavel na altura 
  size ((int)sizeW,(int)sizeH);//define o tamanho da janela 
  smooth();//alisa as arestas do quadrado
  noLoop();//inpede a repetição das figuras cria uma imagem estatica
  totalObjectos=1000;//numero total de quadrados
  
  percentagem=15;//15% dos quadrados vao ser pintados de vermelho
  probabilidade=100-percentagem;//a variavel para o resultado da probabilidade
}
 void draw(){//comando de desenho
  background(255);//define a cor de fundo neste caso branca
 
  for (int i=0;i<totalObjectos;i++)//neste ciclo for é controlada uma serie de repetiçoes de acordo com os parametros acima indicados, entre eles o numero total de objectos representados na janela 
{
    
  diametro =random(20,40);//cria um diametro aleatorio entre 20 e 40
  r=random(255);//cria um valor aleatorio para a cor vermelha entre 0 e 255
  g=random(255);//cria um valor aleatorio para a cor verde entre 0 e 255
  b=random(255);//cria um valor aleatorio para a cor azul entre 0 e 255
   
     
     
  if(random(100)>probabilidade)//100 quadrados irao ficar na zona central
{      
  //são definidas as coordenadas de uma area de 300x 300 a partir do centro, á qual sera adicionada os 100 quadrados
  posX=random(width/2-150,width/2+150);//gerar um numero para posição horizonral 
  posY=random(height/2-150,height/2+150);//gerar um numero para posição vertical
  
      
  //é defenida a cor dos quadrados do centro, neste caso verdes 
  r=0;//valores para red
  g=255;//valores para green
  b=0;//valores para blue
     
  countProbabilidade = countProbabilidade +1;//é defenido mais uma regra para a condição da posição dos quadrados 
      
}
   else//aqui poe-se o contra ponto da probabilidade, ou seja o resto dos quadrados estarao nas posições abaixo indicadas ja com as cores de random rgb
{
       
   posX = random (width);//gera um numero aleatorio para posição horizonral 
   posY = random (height);//gerar um numero aleatorio para posição vertical
     
}
     
   fill(r,g,b);//preenchimento com as cores rgb
   rect(posX,posY,diametro,diametro);//desenhar o quadrado com os valores gerados anteriormente
}       
}




