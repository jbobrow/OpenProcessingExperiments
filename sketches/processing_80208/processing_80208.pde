
float angulo=0.0;

void setup(){
  size(1000,600);
  smooth();
  noStroke();
  background(0);
  fill(0,12);
  rect(0,0,width,height);
}

void draw(){
  
  fill(255,50);
  angulo=angulo+ 0.02;
  translate(500,300);
  rotate(angulo);
  triangle(0,0,400,500,100,300);
  
  translate(100,100);
  fill(0,23,252,40);
  rotate(angulo);
  triangle(0,0,300,600,100,100);
  
  translate(200,200);
  fill(255,0,0,100);
  rotate(angulo);
  triangle(0,0,500,300,300,200);
}

  void keyPressed(){
    angulo=angulo+ 1.0;
    //translate(500,300);
}


