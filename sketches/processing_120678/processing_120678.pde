
float r;
float theta;
float theta_vel;
float theta_acc;
float xoff=0.0;
void setup() {
  size(700, 450);
  background(0);
  r = height * 0.55;
  theta = 0;
  theta_vel = .1;
  frameRate(120);
}

void draw() {
if(focused){
  translate(width/2,height/2);
  xoff = xoff + .01;
  float x = r * cos(theta);
  float y = r * sin(theta);
  ellipseMode(CENTER);
  noFill();
  stroke(255);
  ellipse(x*noise(xoff), y*noise(xoff), 1, 1);
  theta += theta_vel;
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
}
