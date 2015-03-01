
int perro=10;
 
void setup(){
  size(1000,400);
  background(255,50,55);
}
void draw(){
  perro=perro-10;
  noStroke();
  fill(mouseX,mouseY,100,100);
  ellipse(mouseX,10,80,mouseY);
fill(perro);
 perro=perro+20;
 ellipse(700,2,10,10);
}



