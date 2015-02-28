
float pink = 0;
float pink2 = 0;
float theta = 0;
float speed = 0.03;
float maximum = 18;

void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(50);
}

void draw(){
  rectMode(CENTER);
  
  noStroke();
  fill(cos(theta)*215, cos(theta+(PI/3))*215, cos(theta+(2*PI/3))*215);
  rect(mouseX, mouseY, 200/(1+pink2), 200/(1+pink));
  
  theta = theta + speed;
  pink = maximum*sin(theta);
  pink2 = maximum*cos(theta);
  
  if (mousePressed == true){
    background(0);
  }
}

