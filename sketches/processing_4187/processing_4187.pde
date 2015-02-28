

PImage rit;

void setup(){
  rit = loadImage("rit.JPG");
  size(rit.width,rit.height);
  noStroke();
  noLoop();
  colorMode(HSB, 200);
  smooth();
  background(#FFFFFF);
}

void draw(){
  float espacio = 4;
  for (int y=8; y < height; y += espacio){
    for(int x = 5; x < width; x += espacio){
       color c = rit.get(x,y);
  
      pincel (x,y,c, espacio);
     }
  }
}
void pincel(float x, float y, color c, float p) {
  int tipo = round (random (150, 60));
  for(int i = 100; i <= tipo; i+=15){
    float l= hue (c);
    float m= saturation (c) + random (20);
    float b= brightness (c) + random (0, 50);
    pushMatrix();
    translate(x,y);
    fill(l,m,b,80);
    float cac = random (p*3);
    
    ellipse (random (-p,p),random(-p,p), random(10),random (cac));
    
    popMatrix();
  }
}
void keyPressed(){
  redraw();
}

