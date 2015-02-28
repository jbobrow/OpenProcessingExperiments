
// some code was use it the standard example
 
float r;

float theta;
float theta_vel;
float theta_acc;

void setup() {
  size(700, 400);
  frameRate(30);
  smooth();
  
  r = 100;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.001;
}

void draw() {
  background(0);
  fill(0,1);
    rect (width/2, height/2,width,height);
  translate(width/2, height/2);

  float x = r * cos(theta);
  float y = r * sin(theta);
  
  noStroke();
  fill(200);
  ellipse(200-mouseX+x,200-mouseY+ y, 60, 60);
  

  theta_vel += theta_acc;
  theta += theta_vel;

}




