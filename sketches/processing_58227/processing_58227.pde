
float rad = 0;
float rad2 = 0;
float theta = 0;
float speed = 0.02;
float maximum = 20;

void setup(){
  size(1000,800);
  background(255);
  smooth();
  frameRate(100);
  
}
  
void draw(){
  
  ellipseMode(CENTER);
  
  noStroke();
  fill(cos(theta)*255, cos(theta+(PI/3))*255, cos(theta+(2*PI/3))*255);
  ellipse(mouseX, mouseY, 300/(1+rad2), 300/(1+rad)); 
  
  theta = theta + speed;
  rad = maximum*sin(theta);
  rad2 = maximum*cos(theta);
  
  if (mousePressed == true){
    background(255);
  }  
}
  

