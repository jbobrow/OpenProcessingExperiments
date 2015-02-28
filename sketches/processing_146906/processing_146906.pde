
import processing.opengl.*;

/*@pjs preload="entrevista.jpg, alunos.jpg, escola2.jpg, escola3.jpg, orelhas.jpg, stressfm.jpg";*/
 
PImage text1;
PImage text2;
PImage text3;
PImage text4;
PImage text5;
PImage text6;

float rotx = PI/4;
float roty = PI/4;

void setup() {
  
  size(600, 600, OPENGL);
  text1 = loadImage("entrevista.jpg");
  text2 = loadImage("alunos.jpg");
  text3 = loadImage("escola2.jpg");
  text4 = loadImage("escola3.jpg");
  text5 = loadImage("orelhas.jpg");
  text6 = loadImage("stressfm.jpg");
  
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
}

void draw() {
  background(0);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(140);
  TexturedCube(text1, text2, text3, text4, text5, text6);
}

void TexturedCube(PImage tex1, PImage tex2, PImage tex3, PImage tex4, PImage tex5, PImage tex6 ) {
  beginShape(QUADS);  
  texture(tex1);    
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(tex2);
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(tex3);
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(tex4);
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(tex5);  
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  endShape();
  
  beginShape(QUADS);
  texture(tex6);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();

}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}


