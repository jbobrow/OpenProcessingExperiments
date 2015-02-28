
//  3)
 
//Variacion desde Array de Globos con numero
Globo [] globos = new Globo[1000];
int totalglobos = 0;
PFont font;
 
void setup(){
  size (1000, 700);
  smooth();
  noStroke();
  frameRate(15);
  font = loadFont ("UMingTWMBE-48.vlw");
textFont (font);
}
 
void draw(){
  background(0);
globos[totalglobos] = new Globo(color(0),random(width),random(height));
  totalglobos++;
 
  if (totalglobos >= globos.length) {
    totalglobos = 20; //empezar de nuevo pero siempre teniendo 10
  }
 
  for (int i = 0; i < totalglobos; i++){
    globos[i].cae();
    globos[i].show();
 
  }
}
 
class Globo{
  color c;
  float xpos;
  float ypos;
 
 
  Globo (color c_, float xpos_, float ypos_){
    c = c_;
    ypos = ypos_;
    xpos=xpos_;
  }
 
  void show(){
    //ellipseMode(CENTER);
    noFill();
   // ellipse(xpos, ypos, random(10, 100), 100);
    stroke(255,0,0,100);
    line(xpos, 0, xpos, height);
 
    textAlign(CENTER);
    fill(255,0,0,100);
    text(11111111, xpos, ypos+25);
 
  }
 
  void cae(){
    ypos = ypos + 10;
    }
  }

