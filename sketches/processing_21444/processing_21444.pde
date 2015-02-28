
float theta = 0;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);
  
  //atom
  translate(width/2,height/2);
  stroke(0);
  fill(0);
  ellipse(0,0,40,40);
  
  //electron #1
  pushMatrix();
  rotate(theta);
  translate(50,0);
  fill(0,255,0);
  ellipse(0,0,15,15);
  
  popMatrix();
  
  //electron #2
  pushMatrix();
  rotate(-theta);
  translate(60,0);
  fill(0,255,255);
  ellipse(0,0,10,10);
  
  popMatrix();
  
  theta += 0.03;
  
}
