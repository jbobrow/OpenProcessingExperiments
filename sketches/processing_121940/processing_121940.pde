
PImage tex;
float xmag, ymag = 0;
float newXmag, newYmag = 0;

void setup() {
  size(800, 600, P3D);
  tex = loadImage("bricktexture.jpg");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
}

void draw() {
  background(0);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  scale(140);
  ambientLight (50, 50, 50, width, height, 500);
  if (mousePressed && (mouseButton == LEFT)) {
  directionalLight(255, 255, 255, width/2.5, 200, -250);
  ambientLight(100, 100, 100, width, height, 500);
  }
  else 
  pointLight(0, 0, 0, width/2, height/2, 50);
  pointLight(0, 0, 0, width/2, height/2, 50);
  if (mousePressed && (mouseButton == RIGHT)) {
  directionalLight(255, 255, 255, width/-2.5, 200, -250);
  ambientLight(100, 100, 100, width, height, 500);
  }
  else 
  pointLight(0, 0, 0, width/2, height/2, 50);
  pointLight(0, 0, 0, width/-2, height/-2, 50);
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  if (keyPressed) {
    ambientLight(255, 255, 255, width, height, 500); 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  rotateX(-ymag); 
  rotateY(-xmag); 


  TexturedCube(tex);
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);
  
 
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}





