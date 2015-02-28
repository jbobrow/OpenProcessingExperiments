
import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.signals.*;

AudioPlayer player; 
Minim minim;
FFT fft;
AudioMetaData meta;

ArrayList puntos;
int conta;


Pala pala;
ArrayList <bola> Bolas;
float cuantos =24;
int millisUltimo;
int marcador;
PFont font;
PImage fondo;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  colorMode (HSB,360,100,100);
  fondo = loadImage("fondo.png");
  font = loadFont("ARDARLING-48.vlw");
  pala = new Pala();
  Bolas = new ArrayList ();
  millisUltimo = 0;
  marcador = 0;
  
  
  
    conta = 0; 
  frameRate(24); 
  rectMode(CORNERS); 
  puntos = new ArrayList(); 

  for(int n = 0; n<50; n++){
    puntos.add(new Punto(12+(n*(width/50)),120,12, color(128)));
  }
  
  minim = new Minim(this); player = minim.loadFile("The Burger Project - Take my Breath Away.mp3", 1024);  
  meta = player.getMetaData();
  player.play(); 
  fft = new FFT(player.bufferSize(), player.sampleRate()); 
}



void draw() {
  background(fondo);
  noStroke();
  fill(7, 245, 203,80);
  ellipse(500,150, player.left.level()*80, player.right.level()*80);
   ellipse(100,100, player.left.level()*70, player.right.level()*60);
    ellipse(350,60, player.left.level()*180, player.right.level()*180);
   ellipse(220,220, player.left.level()*100, player.right.level()*100);
     noStroke();
  fill(3, 185, 255);
  ellipse(245,300, player.left.level()*80, player.right.level()*80);
ellipse(100,260, player.left.level()*130, player.right.level()*130);
       noStroke();
  fill(3, 185, 255);
  ellipse(550,230, player.left.level()*90, player.right.level()*90);
   ellipse(300,150, player.left.level()*130, player.right.level()*130);
 
 
 
 noStroke();
  //background(0,0,255);
  if (millis() - millisUltimo > 1000) {
    millisUltimo = millis();
      bola b = new bola (random(30,width-30), 0);
      Bolas.add(b);
  }   
  pala.draw();
  for (int i = 0; i <Bolas.size(); i++){ //BUCLE QUE PINTA LAS BOLAS
    bola b = Bolas.get (i);
    b.draw ();
  }
  for (int i = 0; i <Bolas.size(); i++){ //BOUCLE QUE PINTA LAS BOLAS
    bola esta = Bolas.get (i);
    if (esta.y > height){
      Bolas.remove (i); 
    }else if(esta.atrapada){
      Bolas.remove(i);
      marcador++;
      println(marcador);
    }
  }
  fill(0);
  textFont(font, 44);
  text(marcador, width/2, 75);
}
  
void keyPressed() {
  if (keyCode == LEFT) {
    pala.x = pala.x - 25;
    pala.x = constrain(pala.x,75,width-75);
  }  
  if (keyCode == RIGHT) {
    pala.x = pala.x + 25;
    pala.x = constrain(pala.x,75,width-75);
  }  
  
  
    stroke(255, 0, 0, 128);
  fft.forward(player.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
  }
  
}




void stop() 
{
  player.close();
  minim.stop();
  
  super.stop();
}
class Punto {
  float x, y, d;
  float xTarget, yTarget;
  color miColor;
  
  Punto(float miX, float miY, float dimensiones, color unColor){ // al cambiar xtarget e ytarget cambiamos la trayectoria de movimiento
    x = miX;
    y = miY;
    d = dimensiones;
    xTarget = miX;
    yTarget = miY; 
    miColor = unColor;
  }
  
  void display(){
    noStroke();
    fill(miColor);
    ellipse(x,y,d,d);
    
    float diferencia = yTarget - y;
    if (abs(diferencia) > 0.01){
        float deslizo = diferencia / 1.9;
        y += deslizo;
      } 
  }
}
class bola {
float x,y,w;
float v;
boolean atrapada;

color col;

bola (float _x, float _y){
  x = _x;
  y = _y;
  atrapada=false;
  w = random (12,48); // tamaño aleatorio
  col = color (random(360),80,89);
  v = random (5,7);
}

  void draw (){
  fill (col);
  ellipse (x,y,w,w);  
  
  if (((x - w)>(pala.x-pala.w))&&((x + w)<(pala.x+pala.w))&&((y + w)>(pala.y-pala.h/2))) {
      atrapada=true;
  }
  
  y = y + v;
  }         
}


class Pala{
  PImage b;

float x;
float y;
float h;
float w;

Pala(){
 
  b = loadImage("elefante.png");
  x = width/2;
  y = height-120;
  h = b.height/2;
  w = b.width/2;
}


void draw(){
  imageMode(CENTER);
  image(b, x, y,w,h);
  
}

}


