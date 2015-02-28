
import ddf.minim.*;
import gifAnimation.*;
//import processing.opengl.*;

AudioPlayer player;
Minim minim;

//PImage[] animation;
Gif loopingGif;

float rotx = PI/4;
float roty = PI/4;
float rotz = PI/4;

void setup()
{
  //size(screen.width, screen.height, OPENGL);
  size(512, 512, P3D);
  smooth();
  //size(512, 512, OPENGL);
  //size(1024, 1024, OPENGL);
  //frameRate(30);
  minim = new Minim(this);
  player = minim.loadFile("blueball.mp3", 1024);
  loopingGif = new Gif(this, "blueball.gif");
  //animation = Gif.getPImages(this, "blueball.gif");
  loopingGif.loop();
  player.loop();
  textureMode(NORMALIZED);
  fill(255, 255, 144);
}

void draw()
{
  background(0, 128, 255);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx+=0.01);
  rotateY(roty-=0.01);
  rotateZ(rotz-=0.02);
  scale(height/3.5);
  TexturedCube(loopingGif);
}

void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
  loopingGif.stop();
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);

  // +Z "front" face
  vertex(-1, -1,  1);
  vertex( 1, -1,  1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);

  // -Z "back" face
  vertex( 1, -1, -1);
  vertex(-1, -1, -1);
  vertex(-1,  1, -1);
  vertex( 1,  1, -1);

  // +Y "bottom" face
  vertex(-1,  1,  1);
  vertex( 1,  1,  1);
  vertex( 1,  1, -1);
  vertex(-1,  1, -1);

  // -Y "top" face
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);

  // +X "right" face
  vertex( 1, -1,  1);
  vertex( 1, -1, -1);
  vertex( 1,  1, -1);
  vertex( 1,  1,  1);

  // -X "left" face
  vertex(-1, -1, -1);
  vertex(-1, -1,  1);
  vertex(-1,  1,  1);
  vertex(-1,  1, -1);

  endShape();

  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}


