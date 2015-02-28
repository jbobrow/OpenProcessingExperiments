
float r;
float theta;
float theta_vel;
float theta_acc;
float s;
float o;
void setup() {
  size(700, 400);
  frameRate(30);
  smooth();
  r = 20;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.001;

}

void draw() {
    s = random (20,55);
    o = random (90,100);
  background(50);
  translate(width/2, height/2);
  float x = r * cos(theta);
  float y = r * sin(theta);
  float d = 0;
  float q = 20;

  ellipseMode(mouseX+CENTER);
  noStroke();
  fill(200,o);
  ellipse(120-mouseY*x,120-mouseX- y, 50, 16);
  ellipse(d-mouseY+x,d+mouseX* y, 16, 50);
  ellipse(mouseY-x,mouseX- y, s, s);
  ellipse(d+mouseY+x,q-mouseX+ y, s, s);
  ellipse(x,y, 16, 16);
   ellipse(d-mouseX-x,d-mouseY- y, s, s);
  ellipse(mouseX-x,mouseY+ y, s, s);
  ellipse(d+mouseX-x,d-mouseY- y, s, s);
   ellipse(d+mouseX+x,y, s, s);
    ellipse(x,mouseY+y, s, s);
  
  
d=d+2*2;
  
if (r<=200){
  r = r+0.1;
}
  theta_vel += theta_acc;
  theta += theta_vel;

}


                
