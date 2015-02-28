
float xRot = 0;
float yRot = 0;

void setup() {
  size(500, 500, P3D);
  strokeWeight(10);
  smooth();
}

void draw() {

  background(204);
  translate(250, 250, 0);

  rotateY(yRot);
  rotateX(xRot);
  /*
  if(mousePressed){
   rotateY(radians(mouseX/0.72));
   rotateX(radians(mouseY/0.72));
   }
   println("y: " +(mouseX/0.72) +" x:"+(mouseY/0.72));
   */
  
  box(200, 200, 200);
  xRot= xRot + 0.01;
  yRot= yRot + 0.02;

  if (xRot==360) xRot=0;
  if (yRot==360) yRot=0;
  //println("xRot: "+xRot+" yRot: "+yRot);
}


