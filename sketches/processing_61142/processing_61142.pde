
/*Gonçalo Filipe Correia da Silva, nº28210, Brifing 2*/


int s;//variavel inteira dos segundos.
int m;//variavel inteira dos minutos.
int h;//variavel inteira das horas.
float h12;//variavel decimal das horas em 12 passos (e não 24).
int hfx;//variavel inteira do x exterior do ponteiro das horas.
int hfy;//variavel inteira do y exterior do ponteiro das horas.
int a;//variavel inteira da medida "0" dos traços de orientação das horas.
int b;//variavel inteira da medida "180" dos traços de orientação das horas.
int d;//variavel inteira da medida "200" dos traços de orientação das horas.
int e;//variavel do raio do relogio e comprimento do ponteiro das horas.



void setup(){/*função que serve para as definições*/
  size(500,500);//tamanho da tela.
  smooth();//suavizar as formas.
  s = 0;//valor do inicio dos segundos.
  m = 0;//valor do inicio dos minutos.
  h = 0;//valor do inicio das horas
  hfx = 0;//valor do x exterior do ponteiro das horas.
  hfy = -150;//valor do y exterior do ponteiro das horas.
  e = 150;//valor do raio do relogio e comprimento do ponteiro das horas.
  a = 0;//valor dos traços de orientação das horas.
  b = 180;//valor dos traços de orientação das horas.
  d = 200;//valor dos traços de orientação das horas.
}

void draw(){/*função para desenhar*/
  translate (width/2,height/2);//translação do ponto "0" para o centr da tela.
  background(200);//cor de fundo
 
  s = second();//guarda o actual valor dos segundos do pc, vai de 0 a 59.
  m = minute();//guarda o actual valor dos minutos do pc, vai de 0 a 59.
  h = hour();//guarda o actual valor das horas do pc, vai de 0 a 23.
  h12 = h%12;//torna as horas de 0 a 23 para 0 a 12 e guarda na variavel h12.
   
  s = (int) map(s,0,59,0,297);//mapeamento dos segundos de 0 a 59 para 0 a 297 pixeis.
  m = (int) map(m,0,59,0,150);//mapeamento dos minutos de 0 a 59 para 0 a 150 pixeis.
  h = (int) map(h12,0,12,0,360);//mapeamento das horas de 0 a 12 para 0 a 360 graus.
  //...........
  noStroke();//sem contorno na elipse dos segundos.
  fill(255,0,0,s+30);//cor da elipse dos segundos e alfa.
  ellipse(0,0,s,s);//construção da elipse dos segundos (x,y,diametro,diametro).
  //.............
   stroke(0);//contorno a preto na elipse que limita o relogio.
  strokeWeight(5);//grossura do traço da elipse que limita o relogio.
  noFill();//sem preenchimento.
  ellipse(0,0,300,300);//construção da elipse que limita o relogio.
  //..............
  float anghour = radians(h);//variavel decimal para tornar os pixeis em radianos (graus) das horas.
pushMatrix();//função que coloca os seguintes dados na mesma matriz.
  rotate(anghour);//rotação dos graus das horas em 360 graus.
  strokeWeight(10);//grossura do contorno da linha das horas (invisivel)
  stroke(0,0,255,0);//cor da linha das horas (invisivel) e alfa.
  line(0,0,hfx,hfy);//costrução da linha das horas (invisivel)-(x1,y1,x2,y2).

  ellipseMode(CENTER);//colocar os x e y da elipse das horas no centro da elipse.
  fill(19);//cor da elipse (cinza).
  ellipse(hfx,hfy,40,40);//construção da elipse das horas na extremidade exterior da linha das horas(invisivel).
  
   ellipseMode(CENTER);//colocar os x e y da elipse das horas pequena no centro da elipse.
  fill(200);//cor da elipse (cinza).
  ellipse(hfx-5,hfy,30,30);//construção da elipse das horas pequena na extremidade exterior da linha das horas(invisivel).
popMatrix();//função que fecha a matriz.
  //...............
  fill(0,255,0);//cor do rectângulo dos minutos.
  noStroke();//sem contorno no rectângulo dos minutos.
  rect(0-75,0-10,m,20);//construção do rectângulo dos minutos.
  //...............
  noFill();//sem preenchimento no rentângulo 1 que limita os minutos.
  stroke(0);//cor do contorno do rentângulo 1 que limita os minutos.
  strokeWeight(3);//grossura do contorno do rentângulo 1 que limita os minutos.
  rect(0-75,0-10,e/4,20);//construção do rentângulo 1 que limita os minutos.
  //................
  noFill();//sem preenchimento no rentângulo 2 que limita os minutos.
  stroke(0);//cor do contorno do rentângulo 2 que limita os minutos.
  strokeWeight(3);//grossura do contorno do rentângulo 2 que limita os minutos.
  rect(0-75,0-10,e/2,20);//construção do rentângulo 2 que limita os minutos.
  //................
  noFill();//sem preenchimento no rentângulo 3 que limita os minutos.
  stroke(0);//cor do contorno do rentângulo 3 que limita os minutos.
  strokeWeight(3);//grossura do contorno do rentângulo 3 que limita os minutos.
  rect(0-75,0-10,e-e/4,20);//construção do rentângulo 3 que limita os minutos.
  //................
   noFill();//sem preenchimento no rentângulo 4 que limita os minutos.
  stroke(0);//cor do contorno do rentângulo 4 que limita os minutos.
  strokeWeight(3);//grossura do contorno do rentângulo 4 que limita os minutos.
  rect(0-75,0-10,e,20);//construção do rentângulo 4 que limita os minutos.
  //................
  stroke(0);//cor do contorno das linhas de orinetação das horas 1.
  strokeWeight(2);//grossura do contorno das linhas de orientação das horas 1.
  line(a,a-b,a,a-d);//construção das linhas de orientação das horas 1.
  //...............
  stroke(0);//cor do contorno das linhas de orinetação das horas 2.
  strokeWeight(2);//grossura do contorno das linhas de orientação das horas 2.
  line(a,a+b,a,a+d);//construção das linhas de orientação das horas 2.
  //.............
  stroke(0);//cor do contorno das linhas de orinetação das horas 3.
  strokeWeight(2);//grossura do contorno das linhas de orientação das horas 3.
  line(a+b,a,a+d,a);//construção das linhas de orientação das horas 3.
  //.............
  stroke(0);//cor do contorno das linhas de orinetação das horas 4.
  strokeWeight(2);//grossura do contorno das linhas de orientação das horas 4.
  line(a-b,a,a-d,a);//construção das linhas de orientação das horas 4.
}

