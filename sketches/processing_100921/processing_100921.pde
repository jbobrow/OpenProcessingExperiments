
/*@pjs preload= "camera0000.gif, camera0001.gif";*/ 

int frameNum = 2;
int frame = 0;
int lastFrame = 0;
PImage[]camera=new PImage[frameNum];
float rotx = PI/4;
float roty = PI/4;
int f = 0;

void setup() 
{
  size(2000, 800, P3D);
  camera[0] = loadImage("camera0000.gif");
  camera[1] = loadImage("camera0001.gif"); 
  frameRate(2);

  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
 }

void draw() 
{
  f++;
  float w = 12;
  background(0);
  float randomgreen = random(225,255);
  stroke(0,randomgreen,0);
  strokeWeight(5);
  line(0,550,2000,550);
  float last = 0;
  for( int i =1; i < 20; i ++ ) {
    float o = map( f % w, 0, w, 0, 2*i + 1 );  
    line(0,550 + i*i + o,2000,550+ i*i + o );
    last = i*i;
  }

  for( int i =0; i < 60; i ++ ) {
    line( 1000 + i*35, 550, 1000 + i*140, 2000);
    line( 1000 - i*35, 550, 1000 - i*140, 2000);
  } 
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(200);
  TexturedCube(camera[frame]);
 }

void TexturedCube(PImage camera) {
  
  frame = (frame+1) % frameNum;
  
  beginShape(QUADS);
  texture(camera);
  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  endShape();
  beginShape(QUADS);
  texture(camera);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
  endShape();
  beginShape(QUADS);
  texture(camera);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
 beginShape(QUADS);
  texture(camera);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  endShape();
 beginShape(QUADS);
  texture(camera);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  endShape();
 beginShape(QUADS);
  texture(camera);

  // -X "left" face
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


