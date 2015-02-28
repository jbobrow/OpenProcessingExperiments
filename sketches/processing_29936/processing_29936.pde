
//indicação das variáveis

////codigo anima o random////
int posX;
int posY;
int velocidade;
////codigo anima o random////

int estado = 0;  
PFont texto;
int count;
int x ;//=100,
int y; //=300,
int r = 5; 
int vx,vy;  
int s; 

////codigo anima o random////
float segundos = 50;
float raio;
float scale;
////codigo anima o random////

PImage lab;
PImage fundo;
PImage perdeu;
PImage venceu;
PImage timeout; 
PImage caracol;
//indicação do load da library 
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim som; //nome da classe + nome do objecto
AudioPlayer musica; // leitor de musica

void setup() {  

  size(600,400);//tamanho da tela
  som = new Minim(this);//criar objecto
  musica = som.loadFile("Tetris Arcade Music - Bradinsky.mp3");//load music
  musica.play();
  //ellipseMode(CENTER);
  x = 100;
  y = 300;  
  texto = createFont( "Berlin Sans FB", 16, true );//indicação da fonte usada
  textFont(texto);
  lab = loadImage("puzzel 1.png");//load da imagem do labirinto

////codigo anima o random////
  velocidade = 5;
  raio = 5;
  scale = 0;
////codigo anima o random////
}  

void jogo() {  

  
  timer(); 
  // Inteligencia  
  if(x<mouseX) vx = 1; 
  else vx = -1;  

  if(y<mouseY) vy = 1; 
  else vy = -1;  

  // Movimento  

  x = x + vx;  

  y = y + vy;  

  background(255);  

  image(lab,0,0);  
  
  ////codigo anima o random////
  posX= posX + velocidade;
  scale = scale + 0.2;

  if (posX > width) {
    posX =0;
    posY= (int) random (height);
    raio = random (5,70);
    scale = 0;
  }
  println(raio); //diz o tamanho da ellipse que está a ser alterada
  
  fill(0); //cor das bolas
  noStroke(); //tira o contorno da bolas
  
  ellipse (posX,posY, raio + scale, raio + scale);
////codigo anima o random////

  // formula k calcula as extremidades da esfera, sendo 
  // que o px e py sao neste caso as coordenadas onde se situa a cor preta
  // 

  //  float disX = x - px;
  //  float disY = y - py;
  //  if(sqrt(sq(disX) + sq(disY)) < r ) {
  //    return true;
  //  }

  println(get(x,y)); 


  // Colisao 
  if(get(x,y) == color(0)) {  

    estado = 2;
  }  

  if(get(x,y)==color(255,0,0) ) {  

    estado = 3;
  }  
  stroke(0); 
   caracol = loadImage ("caracol.png");
  image (caracol,x,y);  
  s = second();   // Values from 0 - 59
  //int m = minute();  // Values from 0 - 59
  //int h = hour();    // Values from 0 - 23
  segundos -=0.02; 
  if(segundos < 0 ) {
    segundos = 0;
  }
  color c1 = color(0);
  fill(c1);
  noStroke();
  rect(530, 330, 50, 50);
  fill(255);
  //text(s, 550,350);
  text(segundos, 540,350);
  //line(m, 33, m, 66);
  //line(h, 66, h, 100);
}  

void menu() {//menu inicial

  if(mouseX>200 && mouseX<400 &&  

    mouseY>300 && mouseY<400 && mousePressed) {  

    estado = 1;
  }  

  fundo = loadImage ("image 2 menu.png");
  rect(260,355,25,25);
  image (fundo,0,0);
  text("Clique para começar", width/2, 375);
  fill (0);
  /*text("Tempo limite: 46 segundos", width/2, height/2);
   text("Não toque as paredes do labirinto", width/2, height/2-25);*/
}  

void perdeu() {//menu de derrota

  perdeu = loadImage ("image 2 perdeu.png");
  image (perdeu,0,0);
  /*background(255,0,0);  
   // fill(0); 
   text("You Lose! :(", width/2-80, height/2+150);
   text("Click here to restart" , width/2-120, height/2+170);*/
  if(mousePressed) {
    reset();
    estado = 1;
  }
}     

void venceu() {//menu de vitoria

  venceu = loadImage ("ganhou puzzel.png");
  image (venceu,0,0);
  /*background(0,255,0); 
   //fill(0); 
   text("You Win!! :)", width/2-80, height/2+150);
   text("Click here to restart" , width/2-120, height/2+170);*/
  if(mousePressed) {
    reset();
    lab = loadImage("puzzel 2.png");//load da imagem do labirinto
    estado = 1;
  }
} 

void timeOut() {//menu timeout

    timeout = loadImage ("image 2 time out.png");
  image (timeout,0,0);
  /*background(0); 
   text("Time OUT!", width/2-80, height/2+150);
   text("Click here to restart" , width/2-120, height/2+170);
   fill(255);*/
  if(mousePressed) {
    reset();
    estado = 1;
  }
}

void nivel2() {//menu nivel 2
  background (0,255,0);
  if (mousePressed) {
    estado = 5;
    lab = loadImage("labirinto2.png");//load da imagem do labirinto
  }
}
void timer() {

  int curtTime = millis(); 
  if (curtTime > count + 46800) { 
    estado = 4;
  }
}

void reset() {
  x=100;
  y=300;
  segundos = 50; 
  count = millis();
} 

void draw() { 
  
switch (estado) {  

case 0:  
  menu();  
  break;  

case 1:  
  jogo(); 
  // timer(); 
  break;  

case 2:  
  perdeu();  
  break;  
  
case 3:  
  venceu();  
  break; 

case 4:
  timeOut();
  break;  

case 5:
  nivel2();
  break;
}



} 



