
PFont font;//definir a fonte no sistema/variável para carregar o tipo de letra

//início da função setup
//definir propriedades gerais do ambiente, chamadas somente uma vez
void setup(){
  size(800 ,600);//tamanho da tela
}
//fim da função setup
//fim das definições gerais do ambiente

//função draw
//definir a composição de objectos
void draw(){
  smooth();//suavizar pixelização
  colorMode(HSB,360,100,100);//mudar a cor para HSB - Hue, Saturation, Brightness
  font = loadFont("Arial-BoldMT-40.vlw");//o tipo de letra é carregado
  textFont(font,30);
  
  int s = second();//criar variáveis para segundos - valor de 1 a 59
  int m = minute();//criar variáveis para minutos - valor de 1 a 59
  int h = hour();//criar variáveis para horas - valor de 1 a 23
  
  s = (int) map (s, 0,59, 1, width-35);//mapear os valores dos segundos 0,59, para o tamaho da largura da janela
  m = (int) map (m, 0,59, 0, width-35);//mapear os valores dos minutos 0,59, para o tamaho da largura da janela
  h = (int) map (h, 0,24, 0, width-35);//mapear os valores das horas 0,59, para o tamaho da largura da janela
  //-35 para não sair fora da janela

  float b = map (second(),0,59,0,360);//mapear os valores ddo fundo para os segundos
                                      //para ir de preto a branco o fundo
  background (b);//chamar e aplicar o fundo definido
  
  float alturaPonteiros = height/3.0;//variável que define o tamanho, para aplicar nos objectos
  
  noStroke();//sem contorno
  int sH = (int) map(s,0,width,0,360);//converter os segundos em Hue
  fill (sH,100,100);//definir o preenchimento usando valores convertidos
  ellipse (s,50,alturaPonteiros,alturaPonteiros);//definir o objecto, a sua posição em x e y e o tamanho
  
  //números que acompanham a contagem
  text (second(),s,height*0.33);//segundos, valores de 1 a 59 - posição x e y
  text (minute(),m,height*0.66);//minutos, valores de 1 a 59 - posição x e y
  text (hour(),h,height);//horas, valores de 1 a 24 - posição x e y
  
  int mH = (int) map(m,0,width,0,360);//converter os minutos em Hue
  fill (mH,100,100);//definir o preenchimento usando valores convertidos
  rect (m,alturaPonteiros,2,alturaPonteiros);//definir o objecto, a sua posição em x e y e o tamanho
  
 
  int hH = (int) map(h,0,width,0,360);//converter as horas em Hue
  fill (hH,100,100);//definir o preenchimento usando valores convertidos
  rect (0,alturaPonteiros*2,h,height);//definir o objecto, a sua posição em x e y e o tamanho
  
  int d = day();//definir variável para o dia, valores de 1 a 31
  int mth = month();//definir variável para o mês, valores de 1 a 12
  fill (0,0,0);//preenchimento do texto
  int y = year();//definir variável para o ano, 2012, 2013, etc.
  
  //texto - vai buscar o tipo de letra e definir a posição x e y
  String font = String.valueOf(d);//dia
  text (font,s,50);
  font = String.valueOf(mth);//mês
  text (font,s,80); 
  font = String.valueOf(y);//ano
  text (font,s,110);
}
//fim da função draw
//fim das definições da composição de objectos

