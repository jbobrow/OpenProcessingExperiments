

float rot = 0, rotc = 5;
float fr= 20;
PImage tex;
float rd = 0, gn = 127, bl = 255;
float rc = 3, gc = 50, bc = 10;

void setup()
{
  frameRate(fr);
  size(512,512,P3D);
  background(0);
  tex = get();
}

void draw()
{
  background(0);

  //Rotate and shift in z dimension
  translate(width/2, height/2, -10);
  rotateZ(rot);
  translate(-width/2, -height/2, 0);
  
  //set colour
  rd += rc;
  gn += gc;
  bl += bc;
  if (rd >= 255 || rd <= 0) rc = -rc;
  if (gn >= 255 || gn <= 0) gc = -gc;
  if (bl >= 255 || bl <= 0) bc = -bc;
  
  //Draw textured plane
  strokeWeight(1);
  stroke(color(rd, gn, bl, 150));
  beginShape(QUADS);
  texture(tex);
  vertex(0, 0, 0, 0);
  vertex(width, 0, tex.width, 0);
  vertex(width,height, tex.width, tex.height);
  vertex(0,height, 0, tex.height);
  endShape(CLOSE);
  
  //Draw brush
  fill(color(rd, gn, bl));
  ellipse(mouseX, mouseY, 20, 20);
  
  //get the next texture from the screen image
  tex = get();
  
  //increment rotation
  rot += (PI/(100 * fr));  
}

