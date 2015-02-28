
int[] Xsushi= {int(random(1000)), int(random(1000)), int(random(1000)), int(random(1000)), int(random(1000))};

int[] Ysushi= {0,0,0,0,0};



int count=0;
int dificultad=1;

PImage sushi;
PImage soya;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim miaudio;
AudioPlayer miReproductor;

PFont texto; 

void setup() {
size (1000,600);

miaudio = new Minim(this);
miReproductor = miaudio.loadFile ("music.mp3");
miReproductor.play();
miaudio.stop();
texto=loadFont("Clarendon-48.vlw");
sushi = loadImage("sushi.png");
soya = loadImage("soya.png");
}

void draw() {
background(255);

soya();
sushi();
fin();
textFont(texto,250);
fill(0,25);
textAlign(CENTER);
text(count, (int)width/2, (int)height/2+70);

if (count >=100){
  fill(0);
noStroke();
rect(0,0,1000,600);
fill(255,255,255);
textFont(texto,50);
textAlign(CENTER);
text("¡Sushi gratis!", (int)width/2, (int)height/2);

noLoop();
}
  


}


void soya(){
  image(soya,mouseX-60,480);

}

void sushi(){

for(int i=0; i<5; i++) {

  image(sushi,Xsushi[i]-50, Ysushi[i]++);
}

}
void mousePressed(){
  laser(mouseX);
}


void laser(int disparoX){
  strokeWeight(5);
  stroke(0,200);
  miReproductor = miaudio.loadFile ("laser.mp3");
miReproductor.play();
miaudio.stop();
  boolean acelerar = false;
  for (int i=0; i<5; i++){
    if((disparoX>=Xsushi[i]-50) && (disparoX<=(Xsushi[i]+100))){
      acelerar=true;
      line(mouseX,550,mouseX,Ysushi[i]+50);
      noStroke();
      fill(0,220);
      ellipseMode(CENTER);
      ellipse(Xsushi[i],Ysushi[i]+50,80,80);
      Xsushi[i]=int(random(600));
      Ysushi[i]=0;
      count ++;
    }
  }
  if(acelerar==false){
    line(mouseX,525,mouseX,0);
  }
}


void fin (){
for (int i=0; i<5; i++) {
if (Ysushi[i]==550) {
miReproductor = miaudio.loadFile ("fin.mp3");
miReproductor.play();
miaudio.stop();
fill(0);
noStroke();
rect(0,0,1000,600);
fill(255,255,255);
textFont(texto,50);
textAlign(CENTER);
text("Perdiste", (int)width/2, (int)height/2);

noLoop();
}
}

}



