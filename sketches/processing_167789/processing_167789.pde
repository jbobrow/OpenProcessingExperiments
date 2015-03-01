
int dim = 3;
int space = 80;
int size = 50;
int totalWidth;

void setup() {
  size(500, 500, P3D);
  stroke(244);
  fill(22, 20);
  strokeWeight(3);
}

void draw() {
  background(244);

  //2D Centering
  translate(width/2, height/2, 0);
  //Y-Axis Rotation
  rotateY(-radians((millis()*.1)));
  //Z-Axis Rotation
  rotateZ(QUARTER_PI);

  pushMatrix();
  
  //3D Centering Function call
  center();

  //For loop to create sphere grid
  for (int z = 0; z < dim; z++) {
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
        pushMatrix();
        translate(j*space, i*space, 0);
        rotateX(radians(millis()*.1));
        box(size);
        popMatrix();
      }
    }
    translate(0, 0, +space);
  }
  popMatrix();
  
}

//3D Centering Function
void center() {
  totalWidth =(space)*(dim-1);
  translate(-(totalWidth/2), -(totalWidth/2), -(totalWidth/2));
}

