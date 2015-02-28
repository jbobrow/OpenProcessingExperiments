
/**
 * Magic_Cube_1.pde      2014-05-28
 * You can't see the back faces of the cube !
 * Sooo it isn't transparent ! Or is it magic?
 * Tested with OpenProcessing 2.1.2 (with backface culling)
 * Note: transparency do not work with Javascript!
 */
 
float rotSphere = 0.0;
float rotCube = 0.0;
float col = 0;
int lastTime = 0;

//------------------
void setup() 
{
  size(512, 512, P3D);
  sphereDetail(20,10);
}
//------------------
void draw() 
{
  background(127);
  translate(width/2.0, height/2.0, 360);

  rotSphere += 0.023f;
  drawSphere(-1);
  drawSphere(1);
  
  rotCube += 0.002f;
  rotateX(rotCube);
  rotateZ(-rotCube);
  scale(15);
  noLights();
  drawBox();
}
//------------------
void drawBox()
{
  beginShape(QUADS);

  strokeWeight(1.5);
  stroke(64);     // cube edges color
  fill(0,22);      // fill color = complete transparent

  // -Z "back" face
  vertex( 1, -1, -1);
  vertex(-1, -1, -1);
  vertex(-1,  1, -1);
  vertex( 1,  1, -1);

  // +Z "front" face"
  vertex(-1, -1,  1);
  vertex( 1, -1,  1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);

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
}
//------------------
void drawSphere(int i)
{
  float col = abs(sin(frameCount/10.0f)) * 120;

  noLights();
  if ( i == -1)  directionalLight(255-col, 255-col, 255-col, 0, 0, -1);
  else directionalLight(col, col, col, 0, 0, -1);
  
  fill(125);
  noStroke();

  pushMatrix();
    rotateX(rotCube*i);
    rotateY(rotSphere*i);
    translate(34*i, 0, 0);
    sphere(6);
  popMatrix();
}
//------------------
void keyPressed()
{
  save("Magic_Cube_1.png");
}




