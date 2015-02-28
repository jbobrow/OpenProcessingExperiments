
motiongraphic m1;//objecto 1
motiongraphic m2;//objecto 2
motiongraphic m3;//objecto 3
motiongraphic m4;//objecto 4
motiongraphic m5;//objecto 5

void setup(){//define as propriedades do ambiente inicial
  size(720,405);//tamanho da janela
  background(255);//cor do fundo: branco
  frameRate(38);//número constante de frames: 38/s
//em seguida vamos definir a classe e dar-lhe um nome neste caso um rectangulo que se move: motiongraphic
  m1 = new motiongraphic();//objecto 1
  m2 = new motiongraphic();//objecto 2
  m3 = new motiongraphic();//objecto 3
  m4 = new motiongraphic();//objecto 4
  m5 = new motiongraphic();//objecto 5
}

void draw(){//executa as funções que lhe pertencem,neste caso update e drawing
  background(255);//fundo branco
  m1.update();//objecto 1 executa função update
  m1.drawing();//objecto 1 executa função drawing
  m2.update();//objecto 2 executa função update
  m2.drawing();//objecto 2 executa função drawing
  m3.update();//objecto 3 executa função update
  m3.drawing();//objecto 3 executa função drawing
  m4.update();//objecto 4 executa função update
  m4.drawing();//objecto 4 executa função drawing
  m5.update();//objecto 5 executa função update
  m5.drawing();//objecto 5 executa função drawing
}
class motiongraphic{//na classe iremos definir as variaveis: função construtora,update,desenhar,etc
  float posx;//variável da posição x
  float posy;//variável da posição y
  float velocidade;//variável da velocidade
  float r;//variável r
  float g;//variável g
  float b;//variável b
  float posa;//variável posição a
  float posb;//variável posição b
  float posc;//variável posição c
  //Como neste exercício queria criar objectos a moverem-se em sentido contrário aos das variáveis anteriores precisei de criar novas vaiáveis para a posição de x e y
  float posx2;//nova variável para a posição de x
  float posy2;//nova variável para a posição y
 motiongraphic (){//função construtora onde se encontram valores das variaveis
   posx=0;//definir a posição de x,neste caso do lado esquerdo
   posx2=720;//definir a posição de x2, neste cado do lado direito
   posy=random(height);//a posição de y irá variar em toda a altura
   posy2=random(height);//a posição de y irá variar em toda a altura
   velocidade=15;//definir a velocidade
   r=random(255);//definir r
   g=random(255);//definir g
   b=random(255);//definir b
   posa=random(500,1000);//definir pos a
   posb=random(1,5);//definir posb
   posc=random(30,60);//definir posc
 }
 
 void update(){//update das variações da classe
 posx2 = posx2-velocidade;//para o meu objecto de mover da direita para a esquerda
 posx = posx+velocidade;//para o meu objecto de mover da esquerda para a direita
 if(posx>width){//quando a posição de x for maior que a largura da janela este irá ter a posição de zero e assim obteremos o teste de colisão
   posx=0;//para a posição de x ser igual a zerio aquando x for maior que a largura da janela
 posy=random(height);//a posição de y irá variar em toda a altura
 }if(posx2<0){//quando a posição de x for maior que a largura da janela este irá ter a posição de 720,esta função é a que define o teste de colisão no sentido contrário ao do anterior 
  posx2=720;//posição de x irá ser igual a 720 quando x for menor que 0
  posy2 =random (height);//a posição de y irá variar em toda a altura}}
}}
 void drawing(){//função desenho
 noStroke();//objecto sem stroke

 fill(r,g,b);//cor do preenchimento dos objectos
 rect(posx,posy,posa,posb);//função de uma recta;recta que irá mover-se da esquerda para a direita
 ellipse(posx,posy,posc,posc);//função de uma elipse;elipse que terá centro a coincidir com um dos pontos da recta anterior
rect(posx2,posy2,posa,posb);//função de uma recta;recta que irá mover-se da direita para a esquerda
 ellipse(posx2,posy2,posc,posc);//função de uma elipse;elipse que terá centro a coincidir com um dos pontos da recta anterior
 }}
