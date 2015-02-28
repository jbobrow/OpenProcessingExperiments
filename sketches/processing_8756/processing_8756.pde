
import controlP5.*;
ControlP5 controles;

int ancho = 950;
int alto = 500;
int cantidad = 20;
float radio = 50;
float alcance = 100;
float alpha = 200;
float alpha2 = 100;
PVector mm = new PVector();
PVector [] elc = new PVector [cantidad];

void setup () {
  size(ancho,alto); 
  smooth();
  strokeWeight(0.5);  
  for (int i = 0; i < cantidad; i++){
   elc[i] = new PVector(random(ancho),random(alto),0); 
  } 
  
  controles = new ControlP5(this); 
  controles.addSlider("alcance",20,500,100,10,10,200,10);
  controles.addSlider("alpha",0,250,100,10,25,200,10);
  controles.addSlider("alpha2",0,100,100,10,40,200,10);
}

void draw () {
  background(#333333);
 
  fill(#55FF99,alpha2);
  for (int i = 1; i < elc.length; i++){
    noStroke();
    ellipse(elc[i].x,elc[i].y,radio,radio);
    noFill();
    stroke(#FFFFFF,alpha);
    ellipse(elc[i].x,elc[i].y,alcance*2,alcance*2);
    fill(#55FF99,alpha2);
  }
  stroke(#C5F702,200);
  for (int i = 0; i < elc.length; i++){
    for (int j = 0; j < elc.length; j++){
      if (elc[i].dist(elc[j]) < alcance){
        line(elc[i].x,elc[i].y,elc[j].x,elc[j].y);
      }
    }
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



