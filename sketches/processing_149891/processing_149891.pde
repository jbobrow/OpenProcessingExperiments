

// Magic_Cube_2.pde      2014-05-28
//
// A rotating cube with an animated texture

float rotCube = 0.0;
int lastTime = 0;

ArrayList anim;
int animIndex = 0;
int px, py;
PImage animPic;

void setup() 
{
  size(512, 512, P3D);
  anim = new ArrayList();
  animPic = loadImage("Animation.png");
  px = animPic.width/10;
  py = animPic.height/6;
  println ("animation picture size: " +px+"*"+py);
  for(int i = 0; i < 60; i++)
  {
    PImage pim = new PImage(px,py);
    pim.copy(animPic, (i%10)*px, (i/10)*py, px,py, 0,0, px,py);
    anim.add(pim);
  }
}

void draw() 
{
  background(32);
  translate(width/2.0, height/2.0, 360);
  rotCube += 0.004f;
  rotateX(rotCube);
  rotateZ(-rotCube);
  scale(22);
  noLights();
  drawBox();
}

void drawBox()
{
  if(millis() - lastTime > 50)     // 20 frames per second
  {
    animIndex = (animIndex+1) % 60; 
    lastTime = millis();
  }

  beginShape(QUADS);
  texture((PImage)anim.get(animIndex));

  strokeWeight(5);
  stroke(64);      // cube edges color

  // -Z "back" face
  vertex( 1, -1, -1,  0,  0);
  vertex(-1, -1, -1, px,  0);
  vertex(-1,  1, -1, px, py);
  vertex( 1,  1, -1,  0, py);

  // +Z "front" face"
  vertex(-1, -1,  1,  0,  0);
  vertex( 1, -1,  1, px,  0);
  vertex( 1,  1,  1, px, py);
  vertex(-1,  1,  1,  0, py);

  // +Y "bottom" face
  vertex(-1,  1,  1,  0,  0);
  vertex( 1,  1,  1, px,  0);
  vertex( 1,  1, -1, px, py);
  vertex(-1,  1, -1,  0, py);

  // -Y "top" face
  vertex(-1, -1, -1,  0,  0);
  vertex( 1, -1, -1, px,  0);
  vertex( 1, -1,  1, px, py);
  vertex(-1, -1,  1,  0, py);

  // +X "right" face
  vertex( 1, -1,  1,  0,  0);
  vertex( 1, -1, -1, px,  0);
  vertex( 1,  1, -1, px, py);
  vertex( 1,  1,  1,  0, py);

  // -X "left" face
  vertex(-1, -1, -1,  0,  0);
  vertex(-1, -1,  1, px,  0);
  vertex(-1,  1,  1, px, py);
  vertex(-1,  1, -1,  0, py);

  endShape();
}

void keyPressed()
{
  save("Magic_Cube_2.png");
}


