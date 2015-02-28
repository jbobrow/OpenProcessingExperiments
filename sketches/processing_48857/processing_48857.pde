
//importar movimiento de camara
import peasy.*;
PeasyCam cam;
PGraphics rec;

//setuo
void setup() {
  size(1600, 800, P3D);
  rec = createGraphics(400, 400, P3D);
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(200);
  cam.setMaximumDistance(1000);
  cam.lookAt(200, 200, -200);
}

void draw() {
  background(0);
  rec.beginDraw();
  rec.stroke(255, 50);
  rec.strokeWeight(0.5);
  rec.noFill();
  for (int i=0; i<10; i++) {
    rec.rotateX(30*i+millis()*0.0001);
    rec.rotateY(45*i+millis()*0.0001);
    rec.rotateZ(30*i+millis()*random(0.0001, 0.00035));
    rec.rect(width/8, height/8, 100, 400);
  }
  rec.endDraw();

  //dibujando
  pushMatrix();
  image(rec, 0, 0);
  rotateY(PI/2);
  image(rec, 0, 0);
  popMatrix();
  pushMatrix();
  translate(0, 0, -400);
  image(rec, 0, 0);
  popMatrix();
  pushMatrix();
  translate(400, 0, 0);
  rotateY(PI/2);
  image(rec, 0, 0);
  popMatrix();
  pushMatrix();
  translate(0, 400, 0);
  rotateX(-PI/2);
  image(rec, 0, 0);
  popMatrix();
  pushMatrix();
  rotateX(-PI/2);
  image(rec, 0, 0);
  popMatrix();
}


