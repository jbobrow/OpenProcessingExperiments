
void setup() {
  size(485, 363, P3D);
  lights();
}

void draw() {
  pushMatrix();
  translate(0, 0, -100);
  PImage background = loadImage("grassbackground.jpg");
  imageMode(CENTER);
  image(background, width/2, height/2);
  popMatrix();



  //top left wing
  pushMatrix();
  translate(width/2-112.5, height/2-12.5);
  rotateX(map(mouseY, 0, height, 0, 2*PI));
  for (int j=0; j<4; j++) {
    fill(255, 255, 255, 130);
    stroke(46, 109, 82);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<3; i++) {
      vertex(i*30, j*30);
      vertex(i*30, (j+1)*30);
    }
    endShape();
  }
  popMatrix();

  //top right wing
  pushMatrix();
  translate(width/2-45.5, height/2-12.5);
  rotateX(map(mouseY, 0, height, 0, 2*PI));
  for (int j=0; j<3; j++) {
    fill(255, 255, 255, 130);
    stroke(46, 109, 82);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<2; i++) {
      vertex(i*30, j*30);
      vertex(i*30, (j+1)*30);
    }
    endShape();
  }
  popMatrix();

  //bottom left wing
  pushMatrix();
  translate(width/2-112.5, height/2+12.5);
  rotateX(map(0, mouseY, height, 0, 2*PI));
  for (int j=0; j<4; j++) {
    fill(255, 255, 255, 130);
    stroke(46, 109, 82);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<3; i++) {
      vertex(i*30, j*30);
      vertex(i*30, (j+1)*30);
    }
    endShape();
  }
  popMatrix();
  
    //bottom left wing
  pushMatrix();
  translate(width/2-45.5, height/2+12.5);
  rotateX(map(0, mouseY, height, 0, 2*PI));
  for (int j=0; j<3; j++) {
    fill(255, 255, 255, 130);
    stroke(46, 109, 82);
    beginShape(TRIANGLE_STRIP);
    for (int i=0; i<2; i++) {
      vertex(i*30, j*30);
      vertex(i*30, (j+1)*30);
    }
    endShape();
  }
  popMatrix();

  //body
  pushMatrix();
  translate(width/2-137.5, height/2-12.5);
  for (int j=0; j<1; j++) {
    fill(63, 54, 36);
    stroke(32, 27, 18);
    beginShape(QUAD_STRIP);
    for (int i=0; i<12; i++) {
      vertex(i*25, j*25);
      vertex(i*25, (j+1)*25);
    }
    endShape();
  }
  popMatrix();

  //get mouse location
  println("Mouse Location: ("+mouseX+" , "+mouseY+")");
}



