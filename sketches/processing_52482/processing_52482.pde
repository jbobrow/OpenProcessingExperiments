
void setup(){
 size(900,900);
  smooth();
  strokeWeight(.5);
  noFill();
  background(0);
}

void draw(){
  fill(255,5);
  rect(0,0,width,height);
  for(int i = 0 ; i<20;i++){
  text(mouseX,mouseY,i*40,i*40);
  text("hello my name is Naomi");

  }
}


