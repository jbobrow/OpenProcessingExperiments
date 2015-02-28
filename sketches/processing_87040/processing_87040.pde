
float espacio=0,angulo=0;
int H=0,S=100,B=100;

void setup(){
  colorMode(HSB,100);
  size(600,600);
  smooth();
  background(0,0,100);
  strokeWeight(1);
  frameRate(3);
}

void draw(){
  stroke(H,S,B,100);
  line(0,espacio,espacio,height);
  stroke(100-H,S,B,100);
  line(espacio,0,width,espacio);
  stroke(H,S,B,100);
  line(0,espacio,width-espacio,0);
  stroke(100-H,S,B,100);
  line(width,espacio,width-espacio,height);
  espacio=espacio+20;
  H=H+3;
  if (espacio>width){
   noLoop();
  save("Cuadrito.png");
  }
}


