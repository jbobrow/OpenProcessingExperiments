
void setup(){
  size(300,300);
  background(200);
  rectMode(CENTER);
}

void Shape (float a, float b, float c){
  fill(mouseX,mouseY,0);
  strokeWeight(3);
  stroke(135,133,132);
  rect(a,a,c,b);
  fill(255);
  rect(a,b,b,c);
}
void draw(){
}

void mousePressed(){
  for (int x=0; x < 50; x++){
    Shape(random(1,299),random(50,250),random(100,200));
  }
}




