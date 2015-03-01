
void setup() {

  size(600, 600, P3D);

}
void draw() {
background(#eeeeee);

translate(300, 300, -200);
noFill();
sphere(300);

  lights();
  for (int i = 70; i < width; i+=100) {

    pushMatrix();
    translate(width/22, height/16, -200);
    rotateX(radians(mouseX));
    rotateY(radians(mouseY));
    fill(#B9FFF6);
    box(100, 100, -100);
    popMatrix();
    
    pushMatrix();
    translate(width/22, height/100000, -100);
    rotateX(radians(mouseX));
    rotateY(radians(mouseY));
    fill(#B9FFF6);
    box(50, 50, -100);
    popMatrix();
    
     pushMatrix();
    translate(width/22, height/2, -200);
    rotateX(radians(mouseX));
    rotateY(radians(mouseY));
    fill(#B9FFF6);
    box(50, 50, -100);
    popMatrix();
  }

}

