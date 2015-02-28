
PGraphics left, right;
float offset = radians(1.5);

void setup()
{
  size(640,320);
  frameRate(60);
  for (int i = 0; i < cubies; i++)
  {
    // Each cube face has a random color component
    float colorShift = random(-75, 75);
    quadBG[i][0] = color(0);
    quadBG[i][1] = color(51);
    quadBG[i][2] = color(102);
    quadBG[i][3] = color(153);
    quadBG[i][4] = color(204);
    quadBG[i][5] = color(255);

    // Cubies are randomly sized
    float cubieSize = random(5, 10);
    c[i] =  new Cube(cubieSize, cubieSize, cubieSize);

    // Initialize cubie's position, speed and rotation
    x[i] = 0;
    y[i] = 0; 
    z[i] = 0;

    xSpeed[i] = random(-1, 1);
    ySpeed[i] = random(-1, 1); 
    zSpeed[i] = random(-1, 1); 

    xRot[i] = random(40, 100);
    yRot[i] = random(40, 100);
    zRot[i] = random(40, 100);
  }

  // Instantiate external large cube
  stage =  new Cube(bounds, bounds, bounds);


  left = createGraphics(width>>1,height,P3D);
  right = createGraphics(width>>1,height,P3D);
}

Cube stage; // external large cube
int cubies = 20;
Cube[]c = new Cube[cubies]; // internal little cubes
color[][]quadBG = new color[cubies][6];
color[] allGreen = new int[]{
  0x7700FF00,0x7700FF00,0x7700FF00,0x7700FF00,0x7700FF00,0x7700FF00};

// Controls cubie's movement
float[]x = new float[cubies];
float[]y = new float[cubies];
float[]z = new float[cubies];
float[]xSpeed = new float[cubies];
float[]ySpeed = new float[cubies];
float[]zSpeed = new float[cubies];

// Controls cubie's rotation
float[]xRot = new float[cubies];
float[]yRot = new float[cubies];
float[]zRot = new float[cubies];

// Size of external cube
float bounds = 200;

void draw()
{

  left.beginDraw();
  right.beginDraw();

  left.background(50);
  right.background(50);

  left.lights();
  right.lights();

  // Center in display window
  left.translate(left.width/2/*+offset*/, left.height/2, -130);
  right.translate(right.width/2/*-offset*/, right.height/2, -130);

  // Rotate everything, including external large cube
  left.rotateY(offset);
  right.rotateY(-offset);
  left.rotateX(frameCount * 0.001);
  right.rotateX(frameCount * 0.001);
  left.rotateY(frameCount * 0.002);
  right.rotateY(frameCount * 0.002);
  left.rotateZ(frameCount * 0.001);
  right.rotateZ(frameCount * 0.001);
  left.stroke(255);
  right.stroke(255);

  // Draw external large cube
  stage.create(allGreen,left);
  stage.create(allGreen,right);

  // Move and rotate cubies
  for (int i = 0; i < cubies; i++)
  {
    left.pushMatrix();
    right.pushMatrix();
    left.translate(x[i], y[i], z[i]);
    right.translate(x[i], y[i], z[i]);
    left.rotateX(frameCount*PI/xRot[i]);
    right.rotateX(frameCount*PI/xRot[i]);
    left.rotateY(frameCount*PI/yRot[i]);
    right.rotateY(frameCount*PI/yRot[i]);
    left.rotateX(frameCount*PI/zRot[i]);
    right.rotateX(frameCount*PI/zRot[i]);
    left.noStroke();
    right.noStroke();
    c[i].create(quadBG[i],left);
    c[i].create(quadBG[i],right);
    x[i] += xSpeed[i];
    y[i] += ySpeed[i];
    z[i] += zSpeed[i];
    left.popMatrix();
    right.popMatrix();

    // Draw lines connecting cubbies
    stroke(0);
    if (i < cubies-1)
    {
      left.line(x[i], y[i], z[i], x[i+1], y[i+1], z[i+1]);
      right.line(x[i], y[i], z[i], x[i+1], y[i+1], z[i+1]);
    }

    // Check wall collisions
    if (x[i] > bounds/2 || x[i] < -bounds/2) xSpeed[i]*=-1;
    if (y[i] > bounds/2 || y[i] < -bounds/2) ySpeed[i]*=-1;
    if (z[i] > bounds/2 || z[i] < -bounds/2) zSpeed[i]*=-1;
  }

  left.endDraw();
  right.endDraw();

  image(right,0,0);
  image(left,width>>1,0);
}


class Cube
{
  PVector[] vertices = new PVector[24];
  float w, h, d;

  // Constructor 2
  Cube(float w, float h, float d) 
  {
    this.w = w;
    this.h = h;
    this.d = d;

    // cube composed of 6 quads
    //front
    vertices[0] = new PVector(-w/2,-h/2,d/2);
    vertices[1] = new PVector(w/2,-h/2,d/2);
    vertices[2] = new PVector(w/2,h/2,d/2);
    vertices[3] = new PVector(-w/2,h/2,d/2);
    //left
    vertices[4] = new PVector(-w/2,-h/2,d/2);
    vertices[5] = new PVector(-w/2,-h/2,-d/2);
    vertices[6] = new PVector(-w/2,h/2,-d/2);
    vertices[7] = new PVector(-w/2,h/2,d/2);
    //right
    vertices[8] = new PVector(w/2,-h/2,d/2);
    vertices[9] = new PVector(w/2,-h/2,-d/2);
    vertices[10] = new PVector(w/2,h/2,-d/2);
    vertices[11] = new PVector(w/2,h/2,d/2);
    //back
    vertices[12] = new PVector(-w/2,-h/2,-d/2); 
    vertices[13] = new PVector(w/2,-h/2,-d/2);
    vertices[14] = new PVector(w/2,h/2,-d/2);
    vertices[15] = new PVector(-w/2,h/2,-d/2);
    //top
    vertices[16] = new PVector(-w/2,-h/2,d/2);
    vertices[17] = new PVector(-w/2,-h/2,-d/2);
    vertices[18] = new PVector(w/2,-h/2,-d/2);
    vertices[19] = new PVector(w/2,-h/2,d/2);
    //bottom
    vertices[20] = new PVector(-w/2,h/2,d/2);
    vertices[21] = new PVector(-w/2,h/2,-d/2);
    vertices[22] = new PVector(w/2,h/2,-d/2);
    vertices[23] = new PVector(w/2,h/2,d/2);
  }

  void create(color[]quadBG, PGraphics g)
  {
    // Draw cube
    for (int i=0; i<6; i++)
    {
      g.fill(quadBG[i]);
      g.beginShape(QUADS);
      for (int j=0; j<4; j++) g.vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      g.endShape();
    }
  }
}





