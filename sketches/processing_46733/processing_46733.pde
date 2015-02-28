
float di=450;
void setup() {
  size(800, 400, P3D);
  background(0);
}

void draw() {
  //  background(0);

  translate(width/2, height/2);
  pointLight(1, 1, 1, 0, 0, 0);
  pointLight(1, 1, 1, -width/4, -height/4, 0);
  rotateX(mouseX / 200+5*millis()*0.0001);
  rotateY(mouseY / 100+3.5*millis()*0.0001);
  noFill();
  float col=0;
  strokeWeight(random(1,2));
  stroke(100+sin(col), col, col, 8);
  for (int x = -height/2; x < height/2; x += di*2) {
    for (int y = -height/8; y < height/8; y += di*4) {
      rotateZ(di*8*PI);
      box(x-di, x-di, x-di);
      pushMatrix();
      translate(di*6, 0);
      //      sphere(y-di);
      popMatrix();
    }
  }
  col+=1;
  di-=noise(10);
  if (di<=15) {
    di+=150;
  }
  if (col>=90) {
    col=0;
  }
}


