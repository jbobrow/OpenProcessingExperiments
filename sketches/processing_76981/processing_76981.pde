
int[] cordenadasXinvasor= {int(random(600)), int(random(600)), int(random(600)), int(random(600)), int(random(600)),int(random(600)), int(random(600)), int(random(600)), int(random(600)), int(random(600))}; //valores de X aparecen en random

int[] cordenadasYinvasor= {0,0,0,0,0,0,0,0,0,0}; //valores de Y en los invasores, siempre en 0

int diametroInvasor=10; //lo que miden los invasores

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim miaudio;
AudioPlayer miReproductor;

PFont miVariableTipo; //declaro variable


//Ajan yksiköt
int sadasosat = 0;
int sadasosaMax = 100;
int sekunnit = 0;
int sekunttiMax = 60;
int minuutit = 0;
int minuuttiMax = 60;
int tunnit = 0;
int tuntiMax = 24;
int paivat = 0;
int paivaMax = 7;
int viikot = 0;
int viikkoMax = 4;
int kuukausi = 0;
int kuukausiMax = 12;
int vuodet = 0;
int plus = 1;
 
//Laskurin käyttö
boolean aika = false;
boolean napit = true;

void setup() {
size (600,600);

miaudio = new Minim(this);
miReproductor = miaudio.loadFile ("bubbletrubble2.mp3");
miReproductor.play();
miaudio.stop();
 miVariableTipo=loadFont("Helvetica-48.vlw");

}

void draw() {
background(0);
counter();
arma();
invasores();
finJuego();

}

//counter
void counter(){
 sadasosat = sadasosat + plus;
if (sadasosat == sadasosaMax) {
sekunnit = sekunnit + plus;
sadasosat = 0;
if (sekunnit == sekunttiMax) {
minuutit = minuutit + plus;
sekunnit = 0;
}
if (minuutit == minuuttiMax) {
tunnit = tunnit + plus;
minuutit = 0;
}
if (tunnit == tuntiMax) {
paivat = paivat + plus;
tunnit = 0;
}
if (paivat == paivaMax) {
viikot = viikot + plus;
paivat = 0;
}
if (viikot == viikkoMax) {
kuukausi = kuukausi + plus;
viikot = 0;
}
if (kuukausi == kuukausiMax) {
vuodet = vuodet + plus;
kuukausi = 0;
}
}
if (aika == true) {

fill (255);
text ("Hundredths of seconds: " + sadasosat,20,20);
text ("Seconds: " + sekunnit,20,35);
text ("Minutes: " + minuutit,20,50);
text ("Hours: " + tunnit,20,65);
text ("Days: " + paivat,20,80);
text ("Weeks: " + viikot,20,95);
text ("Months: " + kuukausi,20,110);
text ("Years: " + vuodet,20,125);
fill (200,200,200);
}
if (aika == false && napit == true) {

fill (255,255,255,50);
textAlign(CENTER);
text("Press S to start the counter.",height/2,width/2);
text("counter.",10,35);
}
fill (200,200,200);
}
 
void keyPressed () {
if (key == 's' || key == 'S') {
aika = true;
napit = false;
}
} 
  
  

  
  
  

//arma
void arma(){
fill(255,0,0);
noStroke();
//stroke(color(0,255,0));
triangle(mouseX-20, 580,mouseX+20, 580,mouseX, 550);
fill(100);
triangle(mouseX-20, 580,mouseX+20, 580,mouseX+30, 560);
triangle(mouseX-20, 580,mouseX+20, 580,mouseX-30, 560);
rect(mouseX-50,580,100,100);
}

//invasores
void invasores(){
    fill(255);
  stroke(255);

for(int i=0; i<10; i++) {

ellipse( cordenadasXinvasor[i], cordenadasYinvasor[i]++, diametroInvasor, diametroInvasor);
}
}

//el disparo
void mousePressed(){
  miReproductor = miaudio.loadFile ("laser.mp3");
miReproductor.play();
miaudio.stop();
proyectil(mouseX);
println("disparo");

}

//proyectil
void proyectil (int disparoX){
  boolean acertar = false;
  for (int i=0; i<10; i++) {
    if((disparoX>=(cordenadasXinvasor[i]-diametroInvasor/2)) &&
    (disparoX<=(cordenadasXinvasor[i]+diametroInvasor/2))){
      acertar=true;
      strokeWeight(4);
      stroke(0,255,0);
      line(mouseX,565, mouseX, cordenadasYinvasor[i]);
      noStroke();
      fill(255,30,0);
      ellipse(cordenadasXinvasor[i],cordenadasYinvasor[i], diametroInvasor+25, diametroInvasor+25);
        miReproductor = miaudio.loadFile ("blast.mp3");
miReproductor.play();
miaudio.stop();
      cordenadasXinvasor[i] = int(random(600));
      cordenadasYinvasor[i]=0;
    }
  }
  if (acertar==false){
     stroke(0,255,0);
    line(mouseX,565, mouseX,0);
  }
}
  


//El final
void finJuego (){
 for (int i=0; i<10; i++) {
if (cordenadasYinvasor[i]==600) {
 miReproductor = miaudio.loadFile ("gameover.mp3");
miReproductor.play();
miaudio.stop();
fill(255,0,0,40);
noStroke();
rect(0,0,600,600);
fill(255,255,255);
textFont(miVariableTipo,50);
textAlign(CENTER);
text("Game Over :(", (int)width/2, (int)height/2);
noLoop();
}
}
}
    

