
int i = 0;
float a = 0;
float theta1 = random(HALF_PI/2, HALF_PI*2/3);
float theta2 = random(HALF_PI/2, HALF_PI*2/3);
float theta3 = random(HALF_PI/2, HALF_PI*2/3);
void setup() {
  size(600, 400, P3D);
  stroke(255);
}
void draw() {
  background(121, 224, 229);
  
  a += 1;
 
  translate(width/2, height);
  rotateY(radians(a));
  translate(-width/2, -height);
  translate(width/2, height/2);
  if(i < 80) {
    i++;
  } 
  branch(i, theta1, theta2, theta3);
}

void branch(float h, float theta1, float theta2, float theta3) {
  h *= 0.8;
  if (h > 5) {
    pushMatrix();
      rotateX(theta1);
      rotateZ(theta2);
      rotateY(theta3);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h, theta1, theta2, theta3);
    popMatrix();
    
    pushMatrix();
      rotateX(-theta1);
      rotateZ(-theta2);
      rotateY(-theta3);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h, theta1, theta2, theta3);
    popMatrix();
  }
}


