
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RShape txt;
float t=0;
float i;
float l;
float m;

PImage img;

void setup() {
  size(1000,250);
  smooth();
rectMode(CENTER);
  RG.init(this);
  txt = RG.getText("ctrl + alt + supr + capitalismo","modular.ttf",72,CENTER);
  background(0);
  colorMode(HSB, 360, 100, 100);
  
  img = loadImage("ctrlAltSuprm.jpg");
}

void draw() {

    pushMatrix();
  translate(0,-height);
  img.loadPixels();
  for(int i=0;i<img.width;i+=7) {
    for(int l = 0;l<img.height;l+=7) {
      int miColor= img.get(i,l);
      
      fill(miColor);
      ellipse(i,l,5,5);
    }
  }
        popMatrix();
  translate(width/2,height/2);

  t += 0.0001;
  if(t >= 0.99) {
    t=0;
  } 
  float step = map(mouseX,0,width,0.001, 0.01);
  for(float t = 0; t<0.99; t+= step){
  RPoint punto = txt.getPoint(t);
  RPoint tang = txt.getTangent(t);
  float ang = atan2(tang.y,tang.x);

pushMatrix();
  translate(punto.x,punto.y);
  rotate(ang);

i+=0.001 ;
print(i);

fill(i,i,50,i);
l+=0.0001;
stroke(l,l,l,i);
ellipse(0,0,5,5);
popMatrix();
  }
  
}


