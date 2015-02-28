
void setup (){
  size(400,400);
  background(0);
}


void draw(){
  fill(255,0,0);
  rectMode(CENTER);

  if(mouseY > 150 && mouseY <255 && mouseX >150 && mouseX < 255) {
    fill(0,255,0);
  }
  
  rect(200, 200, 100, 100,  25);
}
