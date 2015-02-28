
void setup()//definições setup
{
  size(500,500);//definições da area da janela
  background(0);//definições da cor do fundo da janela neste caso preto
  noStroke();//retira as linhas aos quadrados
  smooth();//alisa os quadrados
}
void draw()//definições de desenho
{
  for(int y=1;y<10;y=y+1)//ciclo for para a variavel y
{
  for(int x=1;x<10;x=x+1)//ciclo for para a variavel x
{    
  fill(255,0,0);//preenchimento dos quadrados, neste caso vermelho
  rect(x*50,y*50,x,y);//coordenadas dos quadrados com as variaveis e seus parametros criados anteriormente 
    
    
}
}
}


