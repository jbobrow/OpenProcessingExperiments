
int blurtimer=0;
int snabbtimer=0;
import ddf.minim.*;
int treshold = 0;


Minim minim;
AudioInput input;
Moln moln;

float micLevel;



void setup(){
  size(800,350);
  background(152,202,252);
  noStroke();
  fill(255,255,255,150);
  moln = new Moln();
  moln.bild = loadImage("moln2.png");
  moln.installning();

  imageMode(CENTER);
 
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO, 20);
    



}

void draw(){
  moln.rita();
  
micLevel = input.mix.level()*1000;
  if (micLevel > 300){
   micLevel = 300; 
  }

blurtimer +=1;
 
 if (blurtimer == 1){ 
  filter(BLUR, 1);
  blurtimer = 0;
}
   
  }



 



