
void setup() // definição dos elementos estáticos 
{
size(400,500);// define a área de composição
background(0);// define a cor de fundo 
smooth();// suavize a imagem
noStroke();// elementos sem contorno
noLoop();// sem movimento

}
void draw()// definição dos elementos em animação
{ 
float step = width/10;// a avriável step é igual á largura a dividir por 10 
float stepY = height/10;// a variável stepY é igual á altura a dividir por 10

for (int y=1; y<10; y=y+1){// função em que a altura começa em 1, vai até 10 e o proximo elemento vai ser o anterior mais 1
  
for (int x = 1; x< 10; x= x+1)// função em que a largura começa em 1, vai até 10 e o proximo elemento vai ser o anterior mais 1 
{ 

  fill (random(255), random(255), random(255));// cria para o preenchimento uma variável RGB que vai de 0 a 255

quad(x* step+0, y* stepY-30, x* step+50, y* stepY,  x* step+60, y* stepY-30, x* step+10, y* stepY-30);// coordenadas do quadrado 
quad(x* step+0, y* stepY-30, x* step+50, y* stepY-30,  x* step+60, y* stepY-30, x* step+10, y* stepY-30);// coordenadas do quadrado 
quad(x* step+0, y* stepY-30, x* step+50, y* stepY-30,  x* step+60, y* stepY-30, x* step+10, y* stepY-30);// coordenadas do quadrado 
}

}
}

