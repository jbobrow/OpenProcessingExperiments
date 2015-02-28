

motiongraphicrect m1;//objecto 1
motiongraphicrect m2;//objecto 2
motiongraphicrect m3;//objecto 3
motiongraphicrect m4;//objecto 4
motiongraphicrect m5;//objecto 5
motiongraphicrect m6;//objecto 6
motiongraphicrect m7;//objecto 7
motiongraphicrect m8;//objecto 8
motiongraphicrect m9;//objecto 9
motiongraphicrect m10;//objecto 10

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
  m7 = new motiongraphicrect();//objecto 7
  m8 = new motiongraphicrect();//objecto 8
  m9 = new motiongraphicrect();//objecto 9
  m10 = new motiongraphicrect();//objecto 10
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
   m7.update();//objecto 7 executa função update
  m7.drawing();//objecto 7 executa função drawing
   m8.update();//objecto 8 executa função update
  m8.drawing();//objecto 8 executa função drawing
   m9.update();//objecto 9 executa função update
  m9.drawing();//objecto 9 executa função drawing
   m10.update();//objecto 10 executa função update
  m10.drawing();//objecto 10 executa função drawing
}


class motiongraphicrect{//na classe iremos definir as variaveis: função construtora,update,desenhar,etc
  float posx;//variável da posição x
  float posy;//variável da posição y
  float velocidade;//variável da velocidade
  float r;//variável de r
  float g;//variável de g
  float b;//variável para b
  float altura;//varável de altura  
  float largura;//variável de largura

 motiongraphicrect (){//função construtora onde se encontram valores das variaveis
   posx=random(width); //a posição de x irá variar em toda a largura
   posy=405;//a posição de y,neste caso irá começar pela parte inferior da janela
   velocidade=8;//definir velocidade
   r=random(255);//definir r 
   g=random(255);//definir g
   b=random(255);//definir b
   altura=random(height);//definir altura
   largura=random(width);//definir largura
 }
 
 void update(){//update das variações da classe
 posy = posy-velocidade;//para o meu objecto se mover de baixo para cima
 if(posy<0){//quando a posição de y for menor que a largura da janela este irá ter a posição de 405 e assim obteremos o teste de colisão
  posy=405;//depois de y for menor que zero irá passar a ter uma posição de 405
  posy =random (height);//os objectos irão aparecer a altura variada
 }}
  void drawing(){//função desenho
 noFill();//objecto sem preenchimento
 stroke(r,g,b);//stroke com com
ellipse(posx, posy, altura,largura );//função de elipse
 }} 
