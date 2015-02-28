
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Juego 1-24-OCTUBRE-2012

int[] coordenasxinvasor = {int(random(600)),int(random(600)),int(random(600)),int(random(600)),int(random(600))};
int[] coordenasyinvasor = {0,0,0,0,0};
int diametroinvasor = 30;
int score =0;
PImage fondo;
PImage zombies;
Minim musica;
AudioPlayer r;
void setup(){
  musica = new Minim(this);
  size(600,600);
  fondo=loadImage("calaveras.png");
  zombies = loadImage("calaca.png");
  r= musica.loadFile("fondo.mp3");
}
void draw(){
  r.play();
  background(fondo);
  smooth();
  arma();
  invasores();
  finjuego();
  textFont(createFont("SansSerif",15));
  text("puntos:" + score,500,80);
}
void arma()
{
  fill(0,255,0);
  stroke(color(0,255,0));
  triangle(mouseX-8,580,mouseX,565,mouseX+8,580);
}
void invasores(){
  stroke(255);
  fill(255);
  for(int i=0;i<5;i++){
    //ellipse(coordenasxinvasor[i],coordenasyinvasor[i]++,diametroinvasor,diametroinvasor);
    image(zombies,coordenasxinvasor[i],coordenasyinvasor[i]++);
  }
}
void mousePressed(){
    proyectil(mouseX);
}
void proyectil(int disparox){
  boolean acertar = false;
  for(int i=0;i<5;i++){
    if((disparox >= (coordenasxinvasor[i]-diametroinvasor/2)) && (disparox<= (coordenasxinvasor[i]+diametroinvasor/2))){
      acertar = true;
      score=score+100;
      line(mouseX,565,mouseX,coordenasyinvasor[i]);
      ellipse(coordenasxinvasor[i],coordenasyinvasor[i],diametroinvasor+25,diametroinvasor+25);
      coordenasxinvasor[i]=int(random(600));
      coordenasyinvasor[i]=0;
    }
    if(acertar==false)
      line(mouseX,565,mouseX,0);
  }
}
void finjuego(){
  for(int i=0;i<5;i++)
    if(coordenasyinvasor[i] == 600)
    {
      noLoop();
      background(0,0,0);
      textFont(createFont("SansSerif",15));
      textAlign(CENTER);
      text("GAME OVER",width/2,height/2);
    }
}


