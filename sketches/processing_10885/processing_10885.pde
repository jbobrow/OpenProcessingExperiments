
import controlP5.*;
ControlP5 controles;

int cantidad = 20;
float radio = 50;
float alcance = 100;
float ruido =2;
float alpha = 50;
int kolor = 20;
float alpha2 = 50;
PVector mm = new PVector();
PVector [] elc = new PVector [cantidad];



void setup () {
  size(950,500); 
  smooth();
  strokeWeight(0.5);  
  colorMode(HSB,100,100,100);
  //llenar();
  llenar2();
  controles = new ControlP5(this); 
  controles.addSlider("alcance",20,500,100,10 ,10 ,200, 10);
  controles.addSlider("alpha"  ,0 ,250,50 ,10 ,25 ,200, 10);
  controles.addSlider("alpha2" ,0 ,100,50 ,10 ,40 ,200, 10);
  controles.addSlider("ruido"  ,0 ,10 ,2  ,10 ,55 ,200, 10);
  controles.addSlider("kolor"  ,0 ,100,20 ,10 ,70 ,200, 10);
  
}

void draw () {
  background(#333333);
 
  ruido_(ruido);
  fill(#55FF99,alpha2);
  for (int i = 1; i < elc.length; i++){
    noStroke();
    ellipse(elc[i].x,elc[i].y,radio,radio);
    noFill();
    stroke(#FFFFFF,alpha);
    ellipse(elc[i].x,elc[i].y,alcance*2,alcance*2);
    fill(#55FF99,alpha2);
  }
  stroke(kolor,100,100);
  for (int i = 0; i < elc.length; i++){
    for (int j = 0; j < elc.length; j++){
      if (elc[i].dist(elc[j]) < alcance){
        line(elc[i].x,elc[i].y,elc[j].x,elc[j].y);
      }
    }
  }


}

void ruido_(float r){
  for (int i = 0; i < elc.length; i++){
    elc[i].x += random(-1*r,r);
    elc[i].y += random(-1*r,r);
  }
}
  
void llenar () {
  for (int i = 0; i < cantidad; i++){
   elc[i] = new PVector(random(width),random(height),0); 
  } 
}

void llenar2 () {
  for (int i = 0; i < cantidad; i++){
   elc[i] = new PVector(width/2,height/2,0); 
  } 
}

void mouseDragged() {
  mm.set(mouseX,mouseY,0);
  for (int i = 0; i < elc.length; i++){
    for (int j = 0; j < elc.length; j++){
      if (elc[i].dist(mm) < radio){
        elc[i].set(mouseX,mouseY,0);
      }
    }
  }
}


void kolor (int c) {  
  kolor = c;
}

void alpha (float al){
  alpha = al;  
}

void alpha2 (float al){
  alpha2 = al;  
}

void alcance (float al){
  alcance = al;  
}

void ruido (float al){
  ruido = al;  
}



