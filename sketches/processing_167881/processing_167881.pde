
void setup() {
  size(600, 600, P3D);
}

void draw() {
  noStroke();
  background(255);
  translate(width/2, 2*height/3, -300);
  //map(mouseY, 0, height, 0, 360);
  rotateX(331.3);
  //fill(234, 78, 78);
  fill(232, 165, 30);
  neck_skin();
  fill(234, 78, 78);
  neck_flash();
  fill(255, 255, 255);
  neck_bone();
  
//println(mouseY);
}


float delta = 50;
float r1 = 200;
float r2 = 170;
float r3 = 50;
float i = 100;
float l = 250;
float d = 90;

void neck_skin() {
  for(float z = 0; z<l; z+=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta++) {
      float rads = radians(theta);
      float x = r1*cos(rads);
      float y = r1*sin(rads);
      vertex(x, y, z);
    }
      endShape();
  }
}

void neck_flash() {
  for(float z = 0; z<l; z+=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta++) {
      float rads = radians(theta);
      float x = r2*cos(rads);
      float y = r2*sin(rads);
      vertex(x, y, z-1);
    }
      endShape();
  }  
}


void neck_bone() {
  for(float z = 0; z<l; z+=d) {
    beginShape();
    for (float theta = 0; theta<=360; theta+=delta) {
      float rads = radians(theta);
      float x = r3*cos(rads);
      float y = r3*sin(rads);
      vertex(x, y, z-2);
    }
    endShape();
  }
}
