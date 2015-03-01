
int z = -350;

void setup()
{
  size(500, 500, P3D);
  background(255);
}

void draw()
{ 
  translate(width/2, height/2, z);
  rotateX(map(mouseY, 0, height, PI/.8, -PI/.8));
  rotateZ(map(mouseX, 0, width, -PI/.8, PI/.8));
  beginShape(QUAD);
  texture(get());
  tint((1+cos(float(frameCount)/100)) * 127, 166, (1+sin(float(frameCount)/120)) * 127);
  /*//front
   pushMatrix();
   vertex(-width/2, -width/2, width/2, 0, 0);
   vertex(width/2, -width/2, width/2, width, 0);
   vertex(width/2, width/2, width/2, width, height);
   vertex(-width/2, width/2, width/2, 0, height);
   popMatrix();
   */
  //back
  vertex(-width/2, -width/2, -width/2, 0, 0);
  vertex(width/2, -width/2, -width/2, width, 0);
  vertex(width/2, width/2, -width/2, width, height);
  vertex(-width/2, width/2, -width/2, 0, height);

  //left
  vertex(-width/2, -width/2, width/2, 0, 0);
  vertex(-width/2, -width/2, -width/2, width, 0);
  vertex(-width/2, width/2, -width/2, width, height);
  vertex(-width/2, width/2, width/2, 0, height);

  //right
  vertex(width/2, -width/2, width/2, 0, 0);
  vertex(width/2, -width/2, -width/2, width, 0);
  vertex(width/2, width/2, -width/2, width, height);
  vertex(width/2, width/2, width/2, 0, height);

  //top
  vertex(-width/2, -width/2, width/2, 0, 0);
  vertex(-width/2, -width/2, -width/2, width, 0);
  vertex(width/2, -width/2, -width/2, width, height);
  vertex(width/2, -width/2, width/2, 0, height);

  //bottom
  vertex(-width/2, width/2, width/2, 0, 0);
  vertex(-width/2, width/2, -width/2, width, 0);
  vertex(width/2, width/2, -width/2, width, height);
  vertex(width/2, width/2, width/2, 0, height);

  endShape();
}

void keyPressed()
{
  if (keyCode == UP)
    z += 20;
  else if (keyCode == DOWN)
    z -= 20;
  else
    background(255);
}



