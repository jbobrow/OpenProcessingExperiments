

  int totalObjectos;//numero total de objectos, neste caso arcos
  int LAYER2_totalObjectos;//numero total de objectos para a segunda layer 

  float posX, posY;//variaveis para a posição horizontal e vertical dos arcos
  float diametro;//variavel para o diametro do arco
  float r,g,b;//variaveis para a cor do arco quer em rgb lado esquerdo quer em escalas de cinza no lado direito
  float s;//variavel para controlar a espessura do outline

  //variaveis para definição das duas areas A e B
 int area_A_locX, area_A_locY;//centro da primeira area
 float A_limiteHorizontal, A_limiteVertical;//variaveis para valores limitação 1 Area

 int area_B_locX, area_B_locY;//centro da segunda area
 float B_limiteHorizontal, B_limiteVertical;//variaveis para valores limite


void setup()//comando de setup
{  
  float sizeW,sizeH;//variavel nas medidas horizontais e verticais
  sizeW=700.0;//tamanho da variavel na largura 
  sizeH=sizeW/1.3333;//tamanho da variavel na altura 
  size((int)sizeW,(int)sizeH);//define o tamanho da janela 
  background (255);//define o branco como cor de fundo da janela 
  smooth();//alisa as arestas do arco
  noLoop();//inpede a repetição das figuras
  
  
  totalObjectos=600;//numero total de arcos
  LAYER2_totalObjectos=600;//definição de numero de arcos 2º layer
  
  //caracteristicas dos parametros para as areas:
 
  //area A
  area_A_locX=100;//localização do x
  area_A_locY=300;//localização do y
  A_limiteHorizontal=100;//limite horizontal
  A_limiteVertical=450;//limite vertical

  //area B
  area_B_locX=600;//localização do x
  area_B_locY=300;//localização y
  B_limiteHorizontal=100;//limite Horizontal
  B_limiteVertical=300;//limite vertical

 

}

void draw(){//comando de desenho
    
  //segunda layer
  for(int i = 0; i < LAYER2_totalObjectos; i++)//cria um ciclo for para a layer 2 onde sao definidos a quantidade de objectos e a sua aleatoriedade dentro da areadefinida 
{
  posX = random (area_B_locX - B_limiteHorizontal, area_B_locX + B_limiteHorizontal);//gerar um numero para posição horizonral 
  posY = random (area_B_locY - B_limiteVertical, area_B_locY + B_limiteVertical);//gerar um numero para posição vertical
  diametro = random (5, 80); // gerar um diametro entre 5 e 80 px
    
  r = random(255);//cria um valor para a cor vermelha entre 0 e 255
  g = random(255);//cria um valor para a cor verde entre 0 e 255
  b = random(255);//cria um valor para a cor azul entre 0 e 255
    
  stroke(255,0,0);//define a cor do outline
  fill(random(255));//define a cor do preenchimento que vai ser um random nas escalas de cinza
  arc( posX, posY, diametro, diametro,0,TWO_PI-PI/2); //coordenadas do arco 
} 
  // primeira layer
  for( int i = 0; i <totalObjectos; i++)//cria um ciclo for para a layer 1 onde sao definidos a quantidade de objectos e a sua aleatoriedade dentro da area definida
{
  posX = random (area_A_locX - A_limiteHorizontal, area_A_locX + A_limiteHorizontal);//gerar um numero para posição horizonral 
  posY = random (area_A_locY - A_limiteVertical, area_A_locY + A_limiteVertical);//gerar um numero para posição vertical
  diametro = random (5, 80);//cria um diametro entre 5 e 80 px
     
  r = random(255);//cria um valor para a cor vermelha entre 0 e 255
  g = random(255);//cria um valor para a cor verde entre 0 e 255
  b = random(255);//cria um valor para a cor azul entre 0 e 255
  s = random (1,8);//cria um valor para a espessura do outline
     
   
  fill(r,g,b);//define o preenchimento com as cores rgb
  stroke(0);//define o outline como sendo preto apenas e so nesta layer
  arc(posX, posY, diametro, diametro,0,TWO_PI-PI/2);//desenhar o arco com os valores gerados
} 
  

         
}




