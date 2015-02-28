
// The next line is needed if running in JavaScript Mode with Processing.js
//@pjs preload="Bild236a.png";  

PImage tex1;
int scala = 250;
float rotx = 0.0;//PI/4;
float roty = 0.0;//PI/4;
float x = 1.2*scala;
float y = 0.9*scala;
float z = 1.2*scala;
float org_x = 250;
float org_y = 400;
float org_z = 0;
float step = (float) (PI*2)/24;
int step1  = 10;
int strgyes = 0;

void setup() {
  size(800, 600, P3D);
  tex1 = loadImage("Bild236a.png");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  org_y = height/2.0;
  org_x = width/2.0;
  org_z = -100;
}

void draw() {
  background(0);
  noStroke();
  translate(org_x, org_y, org_z);
  rotateX(rotx);
  rotateY(roty);
  scale(1);
  TexturedCube();
}

void TexturedCube() {
/*beginShape(QUADS);
  texture(tex1);
  // +Z "front" face
  vertex(-x, -y,   z, 0, 0);
  vertex(x,  -y,   z, 1, 0);
  vertex(x,   y,   z, 1, 1);
  vertex(-x,  y,   z, 0, 1);
endShape();
*/
beginShape(QUADS);
  texture(tex1);
  // -Z "back" face
  vertex( x, -y,  -z, 0, 0);
  vertex(-x, -y,  -z, 1, 0);
  vertex(-x,  y,  -z, 1, 1);
  vertex( x,  y,  -z, 0, 1);
endShape();
beginShape();
  texture(tex1);
  // +Y "bottom" face
  vertex(-x,  y,  z, 0, 0);
  vertex( x,  y,  z, 1, 0);
  vertex( x,  y, -z, 1, 1);
  vertex(-x,  y, -z, 0, 1);
endShape();
beginShape();
  texture(tex1);
  // -Y "top" face
  vertex(-x, -y, -z, 0, 0);
  vertex( x, -y, -z, 1, 0);
  vertex( x, -y,  z, 1, 1);
  vertex(-x, -y,  z, 0, 1);
endShape();
beginShape();
  texture(tex1);
  // +X "right" face
  vertex( x, -y,  z, 0, 0);
  vertex( x, -y, -z, 1, 0);
  vertex( x,  y, -z, 1, 1);
  vertex( x,  y,  z, 0, 1);
endShape();
beginShape();
  texture(tex1);
  // -X "left" face
  vertex(-x, -y, -z, 0, 0);
  vertex(-x,  y, -z, 0, 1);
  vertex(-x,  y,  z, 1, 1);
  vertex(-x, -y,  z, 1, 0);
  endShape();
}
void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
void keyPressed() {
  
  if (key == CODED) {
    if (keyCode == UP) {
      org_z = org_z + step1;
    } else if (keyCode == DOWN) {
      org_z = org_z - step1;
    } else if ((keyCode == LEFT) && (strgyes == 0)) {
        org_x = org_x + step1;
      } else if ((keyCode == RIGHT) && (strgyes == 0)) {
        org_x = org_x - step1;
     } else if ((keyCode == LEFT) && (strgyes == 1)) {
        roty = roty - step;
        if (roty < 0){
          roty = PI*2;
        }
      } else if ((keyCode == RIGHT) && (strgyes == 1)) {
        roty = roty + step;
        if (roty > PI*2){
          roty = 0;
        }
      } else if (keyCode == 17) { 
        // Strg Taste
         strgyes = 1;
      }else {
    }
  }else{
    if (keyCode == 27) { 
      // Esc Taste
      org_y = height/2.0;
      org_x = width/2.0;
      org_z = -100;
    }
  } 
}



