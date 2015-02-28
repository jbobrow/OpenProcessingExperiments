


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Minim m;
//AudioPlayer rain;
//AudioPlayer thunder;

//ArrayList particles = new ArrayList();

void setup(){
  size(700,400);
  smooth();
  cursor(CROSS);
  frameRate(50); 
 
// m = new Minim(this);
// rain = m.loadFile("rain.wav");
// rain.loop();
 //thunder = m.loadFile("thunder.wav");

}
 
void draw(){
background(0);
}
  


void lightning(){

 
int st=round(random(700)); 
int end=350;
int y = 0;
int y2 = 40; 


while ( y2 < 500){

 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end; 
 
 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
 
 }
}

void mouseClicked() {
 lightning();
 lightning();
 

}

//void mousePressed(){

 // rect(0,0,700,400);
 // fill(255,70);
 // frameRate(30);
 // loop();
//}



