
import processing.opengl.*;
import javax.media.opengl.*;

int lastTime;

PVector[] vertices;
int[] indices;

PGraphicsOpenGL pgl;
GL gl;

void setup()
{
  size(500, 500, OPENGL);
  noFill();
  //ortho(0, width, 0, height, -10, 10);
  lastTime = millis();

  pgl = (PGraphicsOpenGL) g;
  gl = pgl.gl;

  // Built an icosehedron
  vertices = new PVector[12];
  float t = (1.0 + sqrt(5.0)) / 2.0;
  vertices[0] = new PVector(-1, t, 0);
  vertices[1] = new PVector(1, t, 0);
  vertices[2] = new PVector(-1, -t, 0);
  vertices[3] = new PVector(1, -t, 0);
  vertices[4] = new PVector(0, -1, t);
  vertices[5] = new PVector(0, 1, t);
  vertices[6] = new PVector(0, -1, -t);
  vertices[7] = new PVector(0, 1, -t);
  vertices[8] = new PVector(t, 0, -1);
  vertices[9] = new PVector(t, 0, 1);
  vertices[10] = new PVector(-t, 0, -1);
  vertices[11] = new PVector(-t, 0, 1);

  // Fill the index buffer
  indices = new int[]
  {
    // 5 faces around p0
    0, 11, 5, 
    0, 5, 1, 
    0, 1, 7, 
    0, 7, 10, 
    0, 10, 11, 
    // 5 adjacent faces
    1, 5, 9, 
    5, 11, 4, 
    11, 10, 2, 
    10, 7, 6, 
    7, 1, 8, 
    // 5 faces around point p3
    3, 9, 4, 
    3, 4, 2, 
    3, 2, 6, 
    3, 6, 8, 
    3, 8, 9, 
    // 5 adjacent faces
    4, 9, 5, 
    2, 4, 11, 
    6, 2, 10, 
    8, 6, 7, 
    9, 8, 1
  };

  int len = indices.length;
  int verLen = vertices.length;
  println(verLen);
  for (int i = 0; i < len; i += 3)
  {
    PVector p0 = vertices[indices[i]];
    PVector p1 = vertices[indices[i + 1]];
    PVector p2 = vertices[indices[i + 2]];

    // For each face, compute the barycenter
    PVector c = new PVector((p0.x + p1.x + p2.x) / 3.0, (p0.y + p1.y + p2.y) / 3.0, (p0.z + p1.z + p2.z) / 3.0);
    float cLen = c.mag();
    c.mult(0.75);
    vertices = (PVector[])append(vertices, c);
    verLen++;

    // Replace the current index list
    int i0 = indices[i];
    int i1 = indices[i + 1];
    int i2 = indices[i + 2];    
    int i3 = verLen - 1;

    indices[i + 1] = i3;
    // Add second new face
    indices = append(indices, i0);
    indices = append(indices, i1);
    indices = append(indices, i3);
    // Add third new face
    indices = append(indices, i1);
    indices = append(indices, i2);
    indices = append(indices, i3);
  }
  println(vertices.length);
  println(indices.length);
}

void draw()
{
  colorMode(RGB, 255);
  background(0);
  colorMode(HSB, 100);
  float elapsedTime = float(millis() - lastTime) / 1000.0;
  lastTime = millis();
  float t = float(millis()) / 1000.0 / 30.0;

  if (false)
  {
    pgl.beginGL();

    // This fixes the overlap issue
    gl.glDisable(GL.GL_DEPTH_TEST);

    // Turn on the blend mode
    gl.glEnable(GL.GL_BLEND);

    // Define the blend mode
    gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);

    pgl.endGL();
  }

  lights();
  //fill((t * 100) % 100.0, 100, 100);
  fill(100, 10, 80);
  stroke(100);
  strokeWeight(2);
  pushMatrix();
  translate(width / 2, height / 2, 0);
  scale(70, 70, 70);
  
  float xRot = float(mouseX) / float(width) * TWO_PI;
  float yRot = float(mouseY) / float(height) * TWO_PI;
  float tRot = t * TWO_PI* 10;
  //rotateX(t *  5 * TWO_PI);
  //rotateY(t * 5 * TWO_PI);
  //rotateY(PI / 4);
  //rotateZ(PI / 3);
  rotateY(xRot);
  rotateX(yRot);
  rotateX(PI/2);

  beginShape(TRIANGLES);
  PVector lookVec = new PVector(0, -1, 0);
  // Increment by 3 to do each face
  for (int i = 0; i < indices.length; i += 3)
  {
    int i0 = indices[i];
    int i1 = indices[i + 1];
    int i2 = indices[i + 2];
    PVector p0 = vertices[i0];
    PVector p1 = vertices[i1];
    PVector p2 = vertices[i2];

    // Backface culling 
    PVector cp = p0.cross(p1);
    //if (cp.dot(lookVec) > 0)
    {
      
      if (i0 == -1 || i0 == -1)
      {
        endShape();
   
        fill(100, 100, 100);
        pushMatrix();
        //rotateX(xRot * p0.x);
        //rotateY(xRot * p0.y);
        //rotateZ(xRot * p0.z);
        rotateS(tRot, p0.x, p0.y, p0.z);
        beginShape();
      }
      else
        fill(100, 10, 80);
        
      vertex(p0.x, p0.y, p0.z);
      vertex(p1.x, p1.y, p1.z);
      vertex(p2.x, p2.y, p2.z);
      
      if (i0 == -1 || i0 == -1)
      {
        endShape();
        popMatrix();
        beginShape(TRIANGLES); 
      }
    }
  }
  endShape();
  popMatrix();
}

void rotateS(float r, float x, float y, float z) {
  float d = sqrt(x*x+y*y+z*z);
  float a = x/d, b = y/d, c = z/d;
  float t[][]={{a*a,a*b,a*c},{b*a,b*b,b*c},{c*a,c*b,c*c}};
  float s[][]={{0,-c,b},{c,0,-a},{-b,a,0}};
  float cosr=cos(r);
  float sinr=sin(r);
  float m[][]={{1,0,0},{0,1,0},{0,0,1}};
  for (int i=0; i<3; i++)
     for (int j=0; j<3; j++)
      m[i][j] = t[i][j] + cosr*(m[i][j]-t[i][j])+sinr*s[i][j];
  applyMatrix (m[0][0],m[0][1],m[0][2],0,
           m[1][0],m[1][1],m[1][2],0,
           m[2][0],m[2][1],m[2][2],0,
           0,0,0,1);
} 

