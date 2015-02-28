
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
Minim miaudio;
AudioPlayer miReproductor;

PFont letra;
 
int[] coordenadasXinvasor={int(random(600)),int(random(600)),int(random(600)), int(random(600)), int(random(600))};
 
int[] coordenadasYinvasor={0,0,0,0,0};
 
int diametroInvasor=20;
 
void setup(){
  smooth();
  size(600,600);
  miaudio = new Minim(this);
miReproductor = miaudio.loadFile ("Star Fox 64 (N64) Music - Corneria Theme.mp3");
miReproductor.play();
miaudio.stop();

  
  letra= loadFont("PressStart2P-48.vlw");
  
}
void draw(){
  background(0);
  textFont(letra,48);
  arma();
  invasores();
  finJuego();
}
 
void arma(){
  fill(255);
  noStroke();
triangle(mouseX-10,560,mouseX+10,560,mouseX,500);
fill(255);
triangle(mouseX-6.5,540,mouseX-20,540,mouseX-25,590);
triangle(mouseX+6.5,540,mouseX+20,540,mouseX+25,590);
fill(0,0,255,200);
triangle(mouseX-6.5,520,mouseX-20,580,mouseX-8,560);
triangle(mouseX+6.5,520,mouseX+20,580,mouseX+8,560);


}
 
void invasores(){
  noStroke();
  fill(255,0,0);
  for(int i=0; i<5; i++){
    ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor,diametroInvasor);
  
}
}
 
void mousePressed(){
  proyectil(mouseX);
}
 
void proyectil(int disparoX){
  strokeWeight(2.5);
  stroke(0,250,0);
  fill(0,250,0);
  boolean acelerar = false;
  for (int i=0; i<5; i++){
    if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) &&
    (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
      acelerar=true;
      line(mouseX,565,mouseX,coordenadasYinvasor[i]);
      ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],diametroInvasor+25,diametroInvasor+25);
      coordenadasXinvasor[i]=int(random(600));
      coordenadasYinvasor[i]=0;
    }
  }
  if(acelerar==false){
    line(mouseX,525,mouseX,0);
  }
}
 
void finJuego(){
  for(int i=0; i<5; i++){
    if(coordenadasYinvasor[i]==600){
      fill(color(255));
      noLoop();
      text("GAME OVER",100,300);
    }
  }
}


