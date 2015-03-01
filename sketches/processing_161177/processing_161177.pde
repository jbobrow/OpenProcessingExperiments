
boolean state_1 = true; 

void setup() {
  size(1024, 768, P3D);
  background(0);
}
void draw() {
  int scaled;
  int x_val;
  int y_val;
  if (state_1) {
    scaled = width/2;
    x_val = width - mouseX;
    y_val = height - mouseY;
 }else{
    scaled = width/3;
    y_val = width - mouseX;
    x_val = height - mouseY;
  } 
  camera(x_val, height/2, (height/2) / tan(5*PI/8), width/2, height/2,0, 0, 1, 0);
  translate(width/2, height/2, height-2*y_val);
  stroke(0,0,255);
  //noStroke();
  fill(0,100);
  sphereDetail(x_val / 4);
  sphere(scaled);
  stroke(0,255,255);
  //fill(0,127);
  box(1.41*scaled);
}
 
void mouseClicked() {
  if (state_1) {
    state_1 = false;
  }else{
    state_1 = true;
  }
}


