
int Objectos;  //variável para conjunto de objectos
 
float posX, posY; // variáveis para a posição de x e y
float diametro; // variavel para o diâmetro
 
void setup() {//definir o Setup
   
  size(600,400);//tamanho da janela
  background (255); //cor do fundo
  smooth();//para anular o pixelizado das imagens dando-lhe um ar mais "macio"
  noLoop();//faz com que o processing execute o código uma só vez
   
   
  Objectos = 30;//definição a quantidade de objectos no grupo
}
 
void draw(){//executar o código
  background(255);//cor do fundo
   
  for ( int i = 0; i <Objectos; i++)//criaremos um sequência de repetições que começará em 0 e será menor que 30
  {
     posX = random (width); // definir a posição de x
     posY = random (height); // definir a posição de y
     diametro = random (5, 100); // definir os valores do diâmetro
      
     fill(0);//preenchimento dos círculos maiores
     ellipse ( posX, posY, diametro, diametro); //elipses maiores
     fill(random(255));//preenchimento dos círculos mais pequenos
     ellipse ( posX, posY, 7,7); // elipses mais pequenas
 
     line(width/2,height/2,posX,posY);//linhas
  }
            
}
