
float radius = 1;
float angle = 0;
float speed = 1;
void setup(){
  size(400,400);
  background(0);
}
void draw(){
  fill(random(0,150),random(0,150),random(0,150));
  println(mousePressed);
  if(mousePressed){
  triangle(mouseY,mouseX,mouseX, mouseY+20, mouseX+20, mouseY+20);
}
}
