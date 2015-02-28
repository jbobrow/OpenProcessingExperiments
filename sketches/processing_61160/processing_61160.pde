
void setup()//função que define o set up
{
  size(500,500);//tamanho da janela
  background(255);//cor da janela
  noStroke();//sem outline
  smooth();//suaviza o desenho
  noLoop();//nao repete
}
void draw()//função que define o desenho
{
  for(int y=1;y<10;y=y+1)//ciclo y que gera um número até 10 objectos
{
  for(int x=1;x<10;x=x+1)//ciclo x que gera um número até 10 objectos
{    
   fill (random(255),random(255),random(255));//gera cores aleatórias nos circulos
  ellipse(x*50,y*50,50,50);//desenha um circulo de acordo com os valores gerados
    
    
}
}
}


