
float radius = 1;
float angle = 0;
float speed = 12;
void setup(){
  size(600,600);
  background(255);
}
void draw(){
  fill(random(255,12),random(255,40),random(255,50));
  println(mousePressed);
  if(mousePressed){
  ellipse(mouseY,mouseX,mouseX, mouseY+20, mouseX+20, mouseY+20);
}
}

