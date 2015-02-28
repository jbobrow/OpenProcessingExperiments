

//HW9 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 10/05/2011 - CMU

float x, z, deltaZ, w;

void setup()
{
  size(400, 400, P3D);
  z = 1;
  deltaZ = 0;
  w = 100;
  x = width/2;
  //frameRate(10);

}

void draw()
{
  background(0);
  translate(x, 200, 0);
  light();
  
  drawBox();
  drawSphere();
  rotateBox();
  drawShapes();
  drawText();
}

void drawText()
{
  text("BOX", 0,w);
}


void drawShapes()
{
  textAlign(CENTER);
  textSize(30);
  rect(w/2,w/2,60,60);
  rect(-w,-w,60,60);
}

void drawBox()
{
  noStroke();
  fill(0,255,0);
  rotateX(radians(z));
  box(w);
}
void drawSphere()
{
  fill(255,255,0);
  pushMatrix();
  translate(-w/2, -w/2, 0);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  translate(w/2, w/2, 0);
  sphere(20);
  popMatrix();
  
}


void light()
{
  directionalLight(51, 102, 126, 1, 0, -1);
  pointLight(255,0,0,200, 200, 200);  
}

void rotateBox()
{
  z = z + deltaZ;
}

void keyPressed()
{
  if(keyCode == UP)
  {
    deltaZ = deltaZ + .2;
  }
  else if(keyCode == DOWN)
  {
    deltaZ = deltaZ - .2;
  }
  else if(keyCode == LEFT && x > 0)
  {
    x--;
  }
  else if(keyCode == RIGHT && x < width)
  {
    x++;
  }
  
}

