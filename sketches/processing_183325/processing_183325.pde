

PImage tex, tex1, tex2, tex3, tex4, tex5;
float rotx = PI/4;
float roty = PI/4;
int[] figura = {
  0, 1, 0, 1, 0, 1, 
  1, 0, 1, 0, 1, 0, 
  0, 1, 0, 1, 0, 1, 
  1, 1, 1, 1, 1, 1, 
  1, 1, 1, 1, 1, 1, 
  1, 1, 0, 0, 1, 1, 

  0, 1, 1, 0, 1, 0, 
  0, 1, 1, 1, 1, 0, 
  0, 1, 1, 0, 1, 0, 
  0, 1, 1, 0, 1, 0, 
  1, 0, 1, 1, 1, 0, 
  1, 1, 1, 1, 1, 0, 

  1, 1, 0, 1, 1, 1, 
  0, 1, 1, 1, 1, 1, 
  1, 1, 0, 1, 1, 1, 
  0, 1, 1, 1, 1, 0, 
  1, 1, 0, 1, 1, 1, 
  0, 1, 0, 1, 0, 1, 

  0, 1, 1, 0, 1, 0, 
  1, 1, 1, 1, 1, 1, 
  1, 1, 1, 1, 1, 1, 
  1, 0, 1, 1, 0, 0, 
  1, 1, 1, 1, 1, 1, 
  1, 1, 1, 0, 1, 0, 

  0, 1, 1, 1, 0, 1, 
  1, 1, 0, 1, 1, 1, 
  0, 1, 0, 1, 1, 0, 
  1, 1, 0, 1, 0, 1, 
  0, 1, 1, 1, 1, 1, 
  1, 1, 1, 1, 0, 1, 

  0, 1, 0, 1, 0, 1, 
  1, 1, 1, 1, 1, 1, 
  1, 1, 1, 1, 1, 0, 
  0, 1, 0, 0, 0, 1, 
  1, 1, 1, 1, 1, 1, 
  0, 0, 1, 1, 1, 1
}; 


void setup() {
  size(800, 800, OPENGL);

  tex = loadImage("1.jpg");
  tex1 = loadImage("2.jpg");
  tex2 = loadImage("3.jpg");
  tex3 = loadImage("4.jpg");
  tex4 = loadImage("5.jpg");
  tex5 = loadImage("6.jpg");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44, 48, 32));
  //frameRate(1);
}

void draw() {
  background(0);
  noStroke();
  translate(width/2.0, height/2.0, -200);
  rotateX(rotx);
  rotateY(roty);
  scale(50);
  int f = 1;
  for (int i =0; i<6; i=i+1) {
    for (int j =0; j<6; j=j+1) {
      for (int k =0; k<6; k=k+1) {
        if (figura[f-1] == 1) {
          TexturedCube(tex, i, j, k);
        }
        f++;
      }
    }
  }
}

void TexturedCube(PImage tex, int x, int y, int z) {
  int xx = x*2-6;
  int yy = y*2-6;
  int zz = z*2-6;
  float tx = norm(1, 0, 6);
  translate(xx, yy, zz);

  beginShape(QUADS);
  fill(0,255,120);
  //texture(tex);
  vertex(-1, -1, 1, x*tx, y*tx);
  vertex( 1, -1, 1, x*tx + tx, y*tx);
  vertex( 1, 1, 1, x*tx+tx, y*tx+tx);
  vertex(-1, 1, 1, x*tx, y*tx+tx);
  endShape();

  beginShape(QUADS);
  fill(0,120,255);
  //texture(tex1);
  // -Z "back" face
  vertex( 1, -1, -1, (5-x)*tx, y*tx);
  vertex(-1, -1, -1, (5-x)*tx + tx, y*tx);
  vertex(-1, 1, -1, (5-x)*tx+tx, y*tx+tx);
  vertex( 1, 1, -1, (5-x)*tx, y*tx+tx);
  endShape();

  beginShape(QUADS);
  fill(255,120,0);
  //texture(tex2);
  // +Y "bottom" face
  vertex(-1, 1, 1, (x)*tx, (5-z)*tx);
  vertex( 1, 1, 1, (x)*tx + tx, (5-z)*tx);
  vertex( 1, 1, -1, (x)*tx+tx, (5-z)*tx+tx);
  vertex(-1, 1, -1, (x)*tx, (5-z)*tx+tx);
  endShape();

  beginShape(QUADS);
  fill(0,0,255);
  //texture(tex3);
  // -Y "top" face
  vertex(-1, -1, -1, (x)*tx, (z)*tx);
  vertex( 1, -1, -1, (x)*tx + tx, (z)*tx);
  vertex( 1, -1, 1, (x)*tx+tx, (z)*tx+tx);
  vertex(-1, -1, 1, (x)*tx, (z)*tx+tx);
  endShape();

  beginShape(QUADS);
  fill(0,255,0);
  //texture(tex4);
  // +X "right" face
  vertex( 1, -1, 1, (5-z)*tx, y*tx);
  vertex( 1, -1, -1, (5-z)*tx + tx, y*tx);
  vertex( 1, 1, -1, (5-z)*tx+tx, y*tx+tx);
  vertex( 1, 1, 1, (5-z)*tx, y*tx+tx);
  endShape();

  beginShape(QUADS);
  fill(255,0,0);
  //texture(tex5);
  // -X "left" face
  vertex(-1, -1, -1, (z)*tx, y*tx);
  vertex(-1, -1, 1, (z)*tx + tx, y*tx);
  vertex(-1, 1, 1, (z)*tx+tx, y*tx+tx);
  vertex(-1, 1, -1, (z)*tx, y*tx+tx);

  endShape();
  translate(-xx, -yy, -zz);
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}

