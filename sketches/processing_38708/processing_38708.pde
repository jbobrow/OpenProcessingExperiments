
void setup(){
  size(500,500);
  smooth(); 
}

void draw(){
  if(mousePressed){
  fill(50);
  rectMode(CENTER);
  rect(mouseY,mouseX,100,100);
  }else{
  fill(255);
  }
  ellipse(mouseY,mouseX,80,80);
  }

