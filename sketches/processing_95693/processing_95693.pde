
float x,y;
float angulo;
float tono;

void setup(){
  size (1500,700);
  colorMode (HSB,255);
  background (0);
  smooth();
  stroke(tono,50,50);
  x=0;
  y=0;
  angulo=0;
  tono=random(0,255);
}

void draw(){
  translate (x,y);
  rotate(angulo);
  scale (random(0,1));
  fill(tono,200,150);
  ellipse(0,0,100,50);
  x=random(width);
  y=random(height);
  angulo=random(0,2*PI);
  tono=random(0,255);
}


