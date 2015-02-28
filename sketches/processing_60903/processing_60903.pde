
int Objectos; // numero total de objectos, neste caso circulos
PImage img; //instanciar e dar nome à imagem


float posX, posY; // variáveis para a posição de x e y
float r,g,b; // variáveis para r,g e b

float probabilidade; //variável para a probabilidade
float percentagem; //variável para a probabilidade
int countProbabilidade; //variável para a probabilidade

void setup() {//Definir Setup
  
  size(600,400);//tamanho da janela
  background (255); //cor do fundo
  smooth();//para anular o pixelizado das imagens dando-lhe um ar mais "macio"
  noLoop();//faz com que o processing execute o código uma só vez
  img = loadImage("cmusica.png"); //Carregamos o ficheiro de imagem

  Objectos = 50;// número de objectos que o grupo tem
  
 percentagem = 25; //50% dos circulos serão pintados de rosa
 probabilidade = 100 - percentagem; // variavel para a probabilidade
 }

void draw(){//Irá executar o código que tem dentro
  background(255);//cor do fundo
  
  for ( int i = 0; i <Objectos; i++)////criaremos um sequência de repetições que começará em 0 e será menor que 50
  {
    

    r = random(255); // cor vermelha aleatória
    g = random(255); // cor verde aleatória
    b = random(255); // cor azul aleatória
     
     if (random(100) > probabilidade){//se o número aleatório for superior a 100 então,
      
      posX = random(width/2); // esta será a posição do x
      posY =random(height/2); // esta será a posição de y
      
      r = 165;//valores de r
      g = 84; //valores de g
      b = 170;//valores de b
     }
     else//caso a situação anterior não se suceda então,
     {
       
     posX = random (width); // esta será a nova posição de x 
     posY = random (height); // esta será a nova posição de x 
     
     }
     
     noStroke();//sem delineado
     tint(r,g,b);//cor da imagem
     image(img, posX,posY);//função que desenha a imagem
  } 
  
  
  
         
}


