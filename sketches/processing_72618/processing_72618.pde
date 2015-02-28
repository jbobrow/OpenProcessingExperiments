
void setup(){
  size(400,400);
  noStroke();
}

void draw(){
  background(200);
  if(mouseX>150 && mouseX<250 && mouseY>150 && mouseY<250){
    fill(0,0,255);
  }
  else{
    fill(255,0,0);
  }
  rectMode(CENTER);
  rect(200,200,100,100);
}
