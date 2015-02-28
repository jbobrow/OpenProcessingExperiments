
size (600,400); //tamanho da janela
background (0);//cor do fundo
smooth(); //para anular o pixelizado das imagens dando-lhe um ar mais "macio" 

int grid = 10;//criar uma variável para definir o espaçamento            
int SizeY = height/ grid;//criar uma variável para a altura da janela que irá ser dividida pelo espaçamento,de forma as figuras terem todas o mesmo espaçamento
int SizeX = width/ grid;//criar uma variável para a largura da janela que irá ser dividida pelo espaçamento,de forma as figuras terem todas o mesmo espaçamento

float x1,y1;//variável para o ponto 1
float x2,y2;//variável para o ponto 2

for ( int y = SizeY; y < height; y = y + SizeY)//localizamos o desenho de y na janela
{
  for ( int x = SizeX; x < width; x = x + SizeX)//localizamos o desenho x na janela
  {

  fill(random (0),random (255), random (255));//preencher as figuras com random de cor
  
 for (int i=0; i<15; i=i+1)  //criaremos um sequência de repetições que começará em zero e será menor que qinze
{
fill (random(255),random(255),random(255));//preencher as figuras com random de cor
quad(x+random(60), y+random(50), x+random(10),y+random(20),x+random(30), y+random(10), x+random(50), y+random(30));//figuras
}}}


