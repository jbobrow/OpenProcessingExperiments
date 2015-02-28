
float A=0;
float B=0;

void setup(){
  size(400,400);
  background(230);
}

void mouseDragged(){
  A=random(18);
  B=random(20);
}

void draw(){

  if (mousePressed){
     stroke(255);
     fill(230,129,130);
     ellipse(mouseX-A,mouseY+B,10,10);
      
}
}

