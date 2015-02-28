
//invasion
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
   
AudioPlayer player;
Minim minim;
AudioInput in;

PFont letter;
float angulo=0.0;
float value;
int kills=0;
int[]coordenadasXinvasor={int(random(600)),int(random(600)),
  int(random(600)),int(random(600)),int(random(600))};
 int[]coordenadasYinvasor={0,0,0,0,0};
  int diametroInvasor=10;
  PImage nave;
  PImage alienz;

//escenario
void setup(){
  size(600,600);
nave=loadImage("nave.gif");
alienz=loadImage("alien.gif");

 Minim miaudio;
AudioPlayer miReproductor;
miaudio= new Minim(this);
miReproductor= miaudio.loadFile("8-bit song.mp3");
  letter=createFont("8-bitLimitRBRK-48.vlw",1);
  textFont(letter,28); 
miReproductor.play();

miaudio.stop();

}
void draw(){
  background(0);
      fill(255,0,0);
      text("Score",10,35);
      fill(255);
    text("kills: "+kills,10,75);
    text("Record:",10,110);
    text("1800",105,110);
arma();
invasores();
estrellas();
finJuego();
}

//arma
void arma(){
  fill(255,247,5);
   stroke(255,0,0);
  strokeWeight(5);
  image(nave,mouseX,520);
}
//aliens
void invasores(){
  strokeWeight(5);
 stroke(0,255,253);
 fill(255,0,243);
 for(int i=0;i<5;i++){
  image(alienz,coordenadasXinvasor[i],coordenadasYinvasor[i]++);
 }
}

//disparo al hacer click
void mousePressed(){
proyectil(mouseX+25);
//miReproductor=minim.loadFile("Laser.mp3");
//miReproductor.play();

}

//el laser
void proyectil(int disparoX){
   strokeWeight(5);
 stroke(0,255,253);
  boolean acertar=false;
  for (int i=0; i<5;i++){
    if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2))&&
    (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
      acertar=true;
      line(mouseX+25,565,mouseX+25,coordenadasYinvasor[i]);
      image(coordenadasXinvasor[i],coordenadasYinvasor[i],
      diametroInvasor+30,diametroInvasor+30);
         if (disparoX>=100) kills=kills+1;
      coordenadasXinvasor[i]=int(random(600));
       coordenadasYinvasor[i]=0;
       //se desaparecen
       //coordenadasXinvasor[i]=-100;
       //coordenadasYinvasor[i]=-100;
    }
  }
  if(acertar==false){
    line(mouseX+25,565,mouseX+25,0);
  }
}

  //estrellas
void estrellas(){
    value=random(118);
    noStroke();
 fill (255);
  translate(random(600),random(600));
 ellipse(10,10,10,10);
  fill (255);
  noStroke();
  translate(random(600),random(600));
 ellipse(30,30,30,30);
 
}
//finite
 void finJuego(){
   for(int i=0;i<5;i++){
     if(coordenadasYinvasor[i]==600){
      noLoop();
       fill(0,255,255);
 text("Mission Failed",180,310);
     }
   }
 }
