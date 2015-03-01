
void setup() {
  size (700,700,P3D);

}
  
void draw() {
  background(250);
  lights();
  noStroke();
  for (int i = 0 ; i < 20 ; i ++) {
    for (int j = 0 ; j < 20 ; j++) {
      translate(float(mouseX)/2,float(mouseY)/2);
      rotateY(PI+float(mouseX)/ PI *0.01);
      rotateX(PI-float(mouseY)/ PI*0.01 );
      rotateZ(PI-float(mouseX)/PI*0.01);
      scale(0.5+float(mouseX)/500);
      fill(100+i+float(mouseX)/2);
      sphere(25);
    }
  }
}



