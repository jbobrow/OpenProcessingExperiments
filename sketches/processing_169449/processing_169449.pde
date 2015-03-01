
void setup()
{
  size(600, 600, P3D);
  colorMode(HSB, 360,100,100);

}

float RECT_SZ = 16;
int ANGLE_STEP = 10;

void draw()
{
  background(0);

stroke(255);
strokeWeight(5);
noFill();
ellipse(30,30,30,30);

  float offset = map(mouseX, 0, width, 0, 180);
  float R = width/2;
  for (float y=100; y<height-100; y += 2*RECT_SZ) {
    for (float t=0; t< 360; t += ANGLE_STEP) {
      float theta = radians(t+offset);
      
      float x = R * sin(theta);
      float z = R * cos(theta)+offset*2;
      ResetMatrix();
      Translate(width/2, 0, 0);
      Translate(x, y, z);
      RotateY( theta );
      DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
    }
  }
}
 
//matrix functions
void setup()
{
  size(600, 600, P3D);
  colorMode(HSB, 360,100,100);

}

float RECT_SZ = 16;
int ANGLE_STEP = 10;

void draw()
{
  background(0);

stroke(255);
strokeWeight(5);
noFill();
ellipse(30,30,30,30);

  float offset = map(mouseX, 0, width, 0, 180);
  float R = width/2;
  for (float y=100; y<height-100; y += 2*RECT_SZ) {
    for (float t=0; t< 360; t += ANGLE_STEP) {
      float theta = radians(t+offset);
      
      float x = R * sin(theta);
      float z = R * cos(theta)+offset*2;
      ResetMatrix();
      Translate(width/2, 0, 0);
      Translate(x, y, z);
      RotateY( theta );
      DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
    }
  }
}
 
// draw rect
void DrawRect(float leftX, float upperY, float
sizeX, float sizeY)
{
  float[][] pos = {
    {
      leftX, upperY, 0, 1
    }, 
    {
      leftX+sizeX, upperY, 0, 1
    },
    
    {
      leftX+sizeX, upperY+sizeY, 0, 1
    }, 
    {
      leftX, upperY+sizeY, 0, 1
    }
  };
  
  float[] posFinal = new float[4];
  
  float distance=dist(30,30, mouseX,mouseY);
  float brightness= map(distance, 0 ,100 ,0,100);
  
  noStroke();
  fill(random(1,360),100,brightness);
  beginShape();
  for (int i=0; i<4; i++) {
    MatVec3d(Matrix, pos[i], posFinal);
    vertex(posFinal[0], posFinal[1], posFinal[2]);
  }
  endShape(CLOSE);
}
