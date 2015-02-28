
void setup(){
size(255,255);
background(0);
smooth();
}
void draw(){
  dibujarMuchosCirculos();
}
void dibujarMuchosCirculos(){
   float grises = random(255);
  float diam = random(15);
  float x=random(width);
  float y=random(height);
  frameRate(5);
  noStroke();
  fill(grises);
  ellipse(x,y,diam,diam);
}


