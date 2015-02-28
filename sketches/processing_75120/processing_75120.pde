
PImage img;
float rotx = PI/4;
float roty = PI/4;

void setup() 
{
  size(600, 600, P3D);
  img = loadImage("data/eyeball.jpg");
  //textureMode(NORMALIZED);
  fill(255);
  stroke(color(44,48,32));
}

void draw() 
{
  background(0);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  //rotateX(mouseX/100.0);
  //rotateY(mouseX/100.0);
  scale(50);
  
  for(int i=-12; i<12; i+=2)
    for(int j=-12; j<12; j+=2)
      TexturedCube(img, i, j);
}

void TexturedCube(PImage img, int x, int y) {
  pushMatrix();
  translate(x, y, 0);
  rotateX(-mouseY/100.0);
  rotateY(-mouseX/100.0);
  
  
  beginShape(QUADS);
    texture(img);
    // +Z "front" face
    vertex(-1, -1,  1, 0, 0);
    vertex( 1, -1,  1, 700, 0);
    vertex( 1,  1,  1, 700, 700);
    vertex(-1,  1,  1, 0, 700);
  endShape();

  beginShape(QUADS);
    //comment texture out to have only one eye texture(img);
    // -Z "back" face
    vertex( 1, -1, -1, 0, 0);
    vertex(-1, -1, -1, 700, 0);
    vertex(-1,  1, -1, 700, 700);
    vertex( 1,  1, -1, 0, 700);
  endShape();

  beginShape(QUADS);
    //comment texture out to have only one eye texture(img);
    // +Y "bottom" face
    vertex(-1,  1,  1, 0, 0);
    vertex( 1,  1,  1, 700, 0);
    vertex( 1,  1, -1, 700, 700);
    vertex(-1,  1, -1, 0, 700);
  endShape();

  beginShape(QUADS);
    //comment texture out to have only one eye texture(img);
    // -Y "top" face
    vertex(-1, -1, -1, 0, 0);
    vertex( 1, -1, -1, 700, 0);
    vertex( 1, -1,  1, 700, 700);
    vertex(-1, -1,  1, 0, 700);
  endShape();

  beginShape(QUADS);
    //comment texture out to have only one eye texture(img);
    // +X "right" face
    vertex( 1, -1,  1, 0, 0);
    vertex( 1, -1, -1, 700, 0);
    vertex( 1,  1, -1, 700, 700);
    vertex( 1,  1,  1, 0, 700);
  endShape();

  beginShape(QUADS);
    //comment texture out to have only one eye texture(img);
    // -X "left" face
    vertex(-1, -1, -1, 0, 0);
    vertex(-1, -1,  1, 700, 0);
    vertex(-1,  1,  1, 700, 700);
    vertex(-1,  1, -1, 0, 700);
  endShape();
  popMatrix();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
