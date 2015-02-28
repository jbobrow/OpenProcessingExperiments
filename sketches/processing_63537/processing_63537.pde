
void setup()//define os comandos setup
{

  size(500,500);//define a area da janela 
  background(126);//define a cor do fundo da janela,neste caso cinzento
  smooth();//alisa as supreficies
  noStroke();//retira todo o outline
}

void draw()//comando de desenho
{
  for (int x = 1; x < 10; x = x+1)//ciclo for que permite defenir parametros de "X"
{
  //pois o "X" começa em 0 e vai aumentar ate 10 com o espaçamento de 50 em 50 como é mostrado em baixo 
   
  rect(x*50,width/10,5,700);//coordenadas do rectangulo sendo "x" o espaçamento entre todos os objectos, neste caso e de 50 px
}
}


