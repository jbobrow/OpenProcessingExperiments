
int perro = 500;

void setup(){
  size(255,255);
  colorMode(HSB);
}
void draw(){
  perro = perro-10;
  
 fill(mouseX,mouseY,255);
 noStroke();
  ellipse(mouseX,mouseY,10,10);
}
