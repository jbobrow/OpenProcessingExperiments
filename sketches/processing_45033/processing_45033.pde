
motiongraphicrect m1;//objecto 1
motiongraphicrect m2;//objecto 2
motiongraphicrect m3;//objecto 3
motiongraphicrect m4;//objecto 4
motiongraphicrect m5;//objecto 5
motiongraphicrect m6;//objecto 6

void setup(){//define as propriedades do ambiente inicial
  size(720,405);//tamanho da janela
  background(255);//cor do fundo: branco
  frameRate(38);//número constante de frames: 38/s
//em seguida vamos definir a classe e dar-lhe um nome neste caso um rectangulo que se move: motiongraphic
  m1 = new motiongraphicrect();//objecto 1
  m2 = new motiongraphicrect();//objecto 2
  m3 = new motiongraphicrect();//objecto 3
  m4 = new motiongraphicrect();//objecto 4
  m5 = new motiongraphicrect();//objecto 5
  m6 = new motiongraphicrect();//objecto 6
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
  m6.update();//objecto 6 executa função update
  m6.drawing();//objecto 6 executa função drawing
}
class motiongraphicrect{//na classe iremos definir as variaveis: função construtora,update,desenhar,etc
  float posx;//variável da posição x
  float posy;//variável da posição y
//Como neste exercício queria criar objectos a moverem-se em sentido perpendicular aos das variáveis anteriores precisei de criar novas vaiáveis para a posição de x e y
  float posx2;//nova variável para a posição de x
  float posy2;//nova variável para a posição y
  float velocidade;//variável da velocidade
  float posa;//variável de posição a
  float posb;//variável de posição b
  float r;//variável de r
  float g;//variável de g
  float b;//variável de b
  
 motiongraphicrect (){//função construtora onde se encontram valores das variaveis
   posx=random(width);//definir a posição de x,neste caso por toda a largura
  posy=0;//definir a posição de y, neste cado a iniciar pela parte superior da janela
   velocidade=15;//definir a velocidade
   posx2=0;//definir a posição de x2 que irá inciar-se do lado esquerdo da janela
   posy2=random(height);//definir y2, neste caso por toda a altura
   posa=random(1,5);//definir a altura
   posb=random(0,1000);//definir largura
   r=random(255);//definir r
   g=random(255);//definir g
   b=random(255);//definir b
 }
 void update(){//update das variações da classe
   posy=posy+velocidade;//para o meu objecto de mover de cima para baixo
   posx2=posx2+velocidade;//para o meu objecto de mover da esquerda para a direita
   if(posy>height){//teste de colisão para o objecto que se move de cima para baixo
     posy=-2000;//valor negativo para se mover em de cima para baixo
   }
   if(posx2>width){//teste de colisão para objecto que se move da esquerda para a direita
     posx2=-2000;//valor positivo para que se mova da esquerda para a direita
 }}
   void drawing(){//função desenho
 noStroke();//objecto sem stroke
 fill(r,g,b);//cor do objecto: vermelho 
 rect(posx,posy,posa,posb);//rectangulo que se move de cima para baixo
 rect(posx2, posy2, posb,posa);//rectangulo que se move da esquerda para a direita
 }}
              
