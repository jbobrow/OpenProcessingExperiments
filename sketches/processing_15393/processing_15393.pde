
void setup(){
  size(600, 400, P3D);
}

void draw(){
  background(#ffff00);
  lights();
  noStroke();
  int shapeCount = 45;
  float stepSize = 10;
  translate(0, height/2);

  
  for(int i=0; i<shapeCount; i++){
    fill(#ff00ff);
    translate(stepSize, 0, 0);
    rotateX(radians(40));

    //randomize sizes
    int sphereDia = int(random(15, 30));
    int xlen = int(random(10, 240));
    int ylen = int(random(5, 225));
    int zlen = int(random(20, 265));
    
    //createShapes
    pushMatrix();
    translate(0, 90, 0);
    sphere(sphereDia);
    rotateY(radians(100));
    box(2, ylen, 2);
    fill(#000000);
    rotateZ(radians(50));
    box(1, zlen, 1);
    rotateX(radians(150));
    box(1, xlen, 1);
    popMatrix();
  }
}





