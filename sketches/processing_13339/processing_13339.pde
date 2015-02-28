
/*void setup() {
  size(600, 400,P3D);
  background(255);
  smooth(); //anti-aliased
  
}

void draw(){
  stroke(#dddddd);
  float a = random (10,width-10);
  float b = random (10,height-10);
  
  line(a, b, 585, 375);
  }
  
*/

void setup() {
  size(600, 400,P3D);
  background(255);
  smooth(); //anti-aliased
}

void draw(){
  float a = random (0,width);
  float b = random (0,height);
  stroke(#999999);
  strokeWeight(0.5);
  line(mouseX, mouseY, a, b);

}
void mouseClicked() {
  background(255);
  
}



