
size (600,400); // tamanho da janela
background (255);  // cor do fundo
smooth(); // para anular o pixelizado das imagens dando-lhe um ar mais "macio"


int objectos = 1000; //variável para o número de objectos e número de objectos neste grupo

float limitHeight, limitWidth, posX, posY;//variável para limitar a área e para posição de x e y

for ( int i = 0; i < objectos; i = i +1)//criaremos um sequência de repetições que começará em 0 e será menor que 1000
{
     float m = map(i, 0, objectos, 0, 200);//mapear o número de objectos que temos desde 0 a 1000 e mapear a cor destes também
   
     limitHeight = random (100);//dar valores à variável
     limitWidth = random (100);//dar valores à variável
   
     posX = random(width);// posição de x aleatória
     posY = random(height/2-limitHeight/2,height/2+limitHeight/2 );// posição de y aleatória
   
    
     noStroke ();//sem delineado
     fill(m,0,0);//preenchimento
     arc(posX,posY, limitHeight , limitHeight,random(0,100),random(0,150)); //arcos           
}


