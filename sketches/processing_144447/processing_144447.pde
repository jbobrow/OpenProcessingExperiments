
float radius = 200;
float angle = 0;
int speed = 200;
float easing;
void setup(){
  size(800,600);
  background(#FAF8E1);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  fill(200);
  frameRate(speed);
//  frameRate(2);
}
void draw(){
  if(mousePressed == true){
    whirly();
  }
//  print(mouseSpeed + " ");
}

void whirly(){
  noFill();
  float mouseSpeed = map((dist(mouseX, mouseY, pmouseX, pmouseY)), 5.0, 50.0, 50.0, 80.0);  
  float strokewidth = map((dist(mouseX, mouseY, pmouseX, pmouseY)), 10.0, 30.0, 1, 0.1);  
  float transparency = map((dist(mouseX, mouseY, pmouseX, pmouseY)), 5.0, 50.0, 100.0, 25.0);
  stroke(#231A43, transparency);  
  if(strokewidth < 0) {
    strokewidth = strokewidth * -1;
  }
  strokeWeight(strokewidth);
  float deltaAngle = speed/radius;
  angle += deltaAngle;
  arc(mouseX, mouseY, radius, radius, radius*cos(angle), radians(3));
}


