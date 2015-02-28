
import ddf.minim.*;//importar a aplicação de som

Minim minim;//dar nome á aplicação de som
AudioInput in;//dar nome á entrada de audio
int AuX;//variavel inteira da posição x da imagem/audio 1.
int AuY;//variavel inteira da posição y da imagem/audio 1.
int AuX2;//variavel inteira da posição x da imagem/audio 2.
int AuY2;//variavel inteira da posição y da imagem/audio 2.
float getIn;//variavel decimal para a entrada de som
float scaleIn;//variavel decimal para o aumento e redução de escala.
float volume;//variavel decimal para o volume.
float volMap;//variavel decimal para o mapeamento de volume.

PImage Wall;//função para referir uma imagem e dar nome.
PImage Wall2;//função para referir uma imagem e dar nome.
PImage planeta;//função para referir uma imagem e dar nome.
PImage rochas;//função para referir uma imagem e dar nome.
PImage Meteo;//função para referir uma imagem e dar nome.

int s;//variavel inteira dos segundos.
int m;//variavel inteira dos minutos.
int h;//variavel inteira das horas.
float h12;//variavel decimal das horas em 12 passos (e não 24).
int hfx;//variavel inteira do x exterior do ponteiro das horas.
int hfy;//variavel inteira do y exterior do ponteiro das horas.
int a;//variavel inteira da medida "0" dos traços de orientação das horas.
int b;//variavel inteira da medida "180" dos traços de orientação das horas.
int d;//variavel inteira da medida "200" dos traços de orientação das horas.
int e;//variavel inteira do raio do relogio e comprimento do ponteiro das horas.
int p;//variavel inteira da orbita do planeta.



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
  p = 0;//valor do inicio da orbita do planeta.
  AuX = 0;//posição de x da imagem/audio 1
  AuY = 0;//posição de y da imagem/audio 1
  AuX2 = width-width/4;//posição de x da imagem/audio 2
  AuY2 = height - height/4;//posição de y da imagem/audio 2
  
  minim = new Minim (this); //criação de novo som
  in = minim.getLineIn(Minim.MONO, 1);//referir que a entrada de som é MONO
  scaleIn = 75;//defenir a escala
}

void draw(){/*função para desenhar*/
  translate (width/2,height/2);//translação do ponto "0" para o centr da tela.
  
  

  Wall = loadImage("wall.jpg");//carregar imagem de fundo
  Wall2 = loadImage("wall.png");//carregar uma imagem
  planeta = loadImage("pia.png");//carregar imagem do planeta
  rochas = loadImage("20090216_dark_comet.png");//carregar imagem das rochas
  
  imageMode(CENTER);//função para carregar imagem de fundo
  image(Wall,0+1,0-50);//variavel para colocar a imagem no fundo
  //........................
  colorMode(HSB);//tornar a cor de RGB para HSB
  fill(107,81,36);//cor do rectângulo dos minutos.
  noStroke();//sem contorno no rectângulo dos minutos.
  rect(0-80,0-300,m,200);//construção do rectângulo dos minutos.
  //........................
  imageMode(CENTER);//colocar o x e y da imagem de fundo 2 no centro.
  image(Wall2,0+1,0-50);//clocar a imagem nas coordenadas
  s = second();//guarda o actual valor dos segundos do pc, vai de 0 a 59.
  m = minute();//guarda o actual valor dos minutos do pc, vai de 0 a 59.
  h = hour();//guarda o actual valor das horas do pc, vai de 0 a 23.
  h12 = h%12;//torna as horas de 0 a 23 para 0 a 12 e guarda na variavel h12.
   
  s = (int) map(s,0,59,0,297);//mapeamento dos segundos de 0 a 59 para 0 a 297 pixeis.
  m = (int) map(m,0,59,0,160);//mapeamento dos minutos de 0 a 59 para 0 a 160 pixeis.
  h = (int) map(h12,0,12,0,360);//mapeamento das horas de 0 a 12 para 0 a 360 graus.
  p = (int) map(p,0,59,0,360);//mapeamento do planeta de 0 a 59 para 0 a 297 pixeis.
  
  p = s;//angulo do planeta move-se de acordo com os segundos;
  //..............
  noStroke();//sem contorno na elipse dos segundos.
  fill(255,0,0,s+30);//cor da elipse dos segundos e alfa.
  ellipse(0,0,s,s);//construção da elipse dos segundos (x,y,diametro,diametro).
  //.............
   getIn = in.left.get(0)*100;//audio input é a entrada de som.
  volume = getIn * scaleIn;//o volume é igual ao audio input vezes a escala
  if (volume > 100){//condição que define se o volume é maior que 100 a imagem aumenta
  volMap = map (volume, 0, 500, 0, 300);//mapeamento do volume
  imageMode(CENTER);//colocar o x e y da imagem rochas no centro
  image(rochas,AuX,AuY);//colucar a imagem das rochas na condição
  }//fim da condição
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
  fill(201,216,42);//cor da elipse (amarelo).
  ellipse(hfx,hfy,60,60);//construção da elipse das horas na extremidade exterior da linha das horas(invisivel).
  
   ellipseMode(CENTER);//colocar os x e y da elipse das horas pequena no centro da elipse.
  fill(119);//cor da elipse (cinza).
  ellipse(hfx-5,hfy,50,50);//construção da elipse das horas pequena na extremidade exterior da linha das horas(invisivel).
popMatrix();//função que fecha a matriz.

  //................
  float angplan = radians(p);//variavel decimal para tornar os pixeis em radianos (graus)
pushMatrix();//função que coloca os seguintes dados na mesma matriz
  rotate(angplan);//rotação dos graus do planeta em 360 graus
  strokeWeight(10);//grossura do contorno da linha d planeta(invisivel)
  stroke(0,0,255,0);//cor da linha do planeta(invisivel)
  line(0,0,hfx-70,hfy-70);//construção da linha do planeta (invisivel)
  imageMode(CENTER);//colocar os x e y da imagem do planeta no centro da imagem.
  image(planeta,hfx-70,hfy-70);//colocação da imagem do planeta na extremidade exterior da linha do planeta(invisivel)
  
popMatrix();//função que fecha a matriz.
  
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
  line(a-b,a,a-d,a);//construção das linhas de orientação das horas 4.7

}
 void stop(){//função que para a acção gerada pelo som quando este para 
    in.close();//terminar a entrada de som
    minim.stop();//terminar a aplicação de som
  }

