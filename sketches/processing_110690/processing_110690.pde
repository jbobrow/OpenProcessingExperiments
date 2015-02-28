
void setup(){
  size(400, 400);
  background(50);
}

void draw(){
//background(250) - changed but made line nondynamic
  fill(0,0,0,10);
  rect(0,0,400,400);
  if (mousePressed){
  ellipse(mouseX,mouseY,random(10),random(10));
  stroke(random(250),random(250), random(250));
  }
}


