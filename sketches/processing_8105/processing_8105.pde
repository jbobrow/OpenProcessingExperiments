
// Dimensions. Number of points in u and v directions.
int dim1 = 36*2;
int dim2 = 36*2;
PVector[][] points;
PVector[][] normals;

// Rotation code taken from the example sketch
// in Examples -> libraries -> OpenGL -> textured sphere
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;

int renderMode = 0;
boolean toggleNormals = false;

void setup()
{
  points = new PVector[dim1][dim2];
  normals = new PVector[dim1][dim2];

  // Trianguloid Trefoil limits u,v
  float deltau = 2*PI / (dim1-1);
  float deltav = 2*PI / (dim2-1);
  float startu = -PI;
  float startv = -PI;

  // Evaluate the surface in (u,v)
  for(int i=0; i<dim1; i++)
  for(int j=0; j<dim2; j++)
  {
    float u = startu + i * deltau;
    float v = startv + j * deltav;
    points[i][j] = trianguloidTrefoil(u, v, 0, 0);
    normals[i][j] = trianguloidTrefoil(u,v,1,1);
    normals[i][j].normalize();
  }
  
  size(500,500,P3D);
}

void draw()
{
  lights();  //default ambient lights	
  
  background(0);
  float ang = 0; //2*PI*mouseX / width;
  float r = 10;
  camera(0,0,r, 0,0,0, 0, 1, 0);
  
  lightSpecular(204, 204, 204);
  pointLight(102,102,102, 0, 0, -r);
  directionalLight(102, 102, 102, 0, 0, -1); 
  
  pushMatrix();
  rotateX( radians(-rotationX) );  
  rotateY( radians(270 - rotationY) );
  drawSurface();
  if(toggleNormals) drawNormals();
  popMatrix();
  
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;
  
  // Implements mouse control (interaction will be inverse when sphere is  upside down)
  if(mousePressed){
    velocityX += (mouseY-pmouseY) * 0.05;
    velocityY -= (mouseX-pmouseX) * 0.05;
  }
  
}
void keyReleased()
{
  if(key == 't' || key == 'T') toggleNormals=!toggleNormals;
  if(key == ' ') renderMode++; renderMode %= 4;
}

void drawSurface()
{
  colorMode(HSB, (dim2), 100, 100, 100); // HUE SAT BRIGHT
  pushMatrix();
  for(int i=0; i<dim1-1; i++)
  {
    switch(renderMode){
      case 0: beginShape(TRIANGLE_STRIP); break;
      case 1: beginShape(POINTS); break;
      case 2: beginShape(LINES); break;
      case 3: beginShape(TRIANGLE_STRIP); noStroke(); break; // also uses fill for each vertex
    }
    for(int j=0; j<dim2; j++){      
        if(renderMode == 3){ fill(i, 100, 100, 20);}
        else{
          noFill(); stroke(i, 100, 100, 50);
        }
        normal( normals[i][j].x, normals[i][j].y, normals[i][j].z );
        vertex( points[i][j].x, points[i][j].y, points[i][j].z);
       
        if(renderMode == 3){ fill(i+1, 100, 100, 20);}
        else{
          noFill(); stroke(i+1, 100, 100, 50);
        }
        normal( normals[i+1][j].x, normals[i+1][j].y, normals[i+1][j].z );
        vertex( points[i+1][j].x, points[i+1][j].y, points[i+1][j].z );
    }
    endShape();
  }
  popMatrix();
}

void drawNormals()
{
  colorMode(RGB,1,1,1,1);
  stroke(255,0,0);
  for(int i=0; i<dim1; i+=1)
  for(int j=0; j<dim2; j+=1)
  {
    float nx = points[i][j].x + normals[i][j].x/10;
    float ny = points[i][j].y + normals[i][j].y/10;
    float nz = points[i][j].z + normals[i][j].z/10;
    line(points[i][j].x, points[i][j].y, points[i][j].z, nx,ny,nz);
  }
}

PVector trianguloidTrefoil(float u, float v, int d1, int d2)
{
  /*
  float x = 2.0f*sin(3.0f*u) / (2+cos(v));
  float del1 = (2.0f*(sin(u) + 2*sin(2.0f*u)));
  float del2 = 2.0f+cos(v+2.0f*PI/3.0);
  float y = del1 / del2;
  float z = (cos(u) - 2.0f*cos(2.0f*u)) * (2.0f+cos(v)) * (2.0f+cos(v+2.0f*PI/3.0f)) / 4.0f;
  */
  // This code was adapted from GMlib.
  float su = sin(u);
  float cu = cos(u);
  float s2u = sin(2*u);
  float s3u = sin(3*u);
  float c2u = cos(2*u);
  float c3u = cos(3*u);
  
  float sv = sin(v);  
  float cv = cos(v);
  float cvp2 = cv+2;
  float sv23 = sin(v+TWO_PI/3);
  float cv23 = cos(v+TWO_PI/3);
  float cv23p2 = cv23+2;
  
  PVector fu0 = new PVector(2*s3u, 2*(su+2*s2u),  cu-2*c2u);
  PVector fv0 = new PVector(1/cvp2, 1/cv23p2,  cvp2*cv23p2/4);
  if(d1==0 && d2==0) return PVector.mult(fu0, fv0); // return point

  // else, we want the derivatives

  PVector fu1 = new PVector();
  PVector fv1 = new PVector();
  if(d1==1){ // partial derivative df/du
    fu1.set(6*c3u,  2*(cu+4*c2u), -su+4*s2u);
  }
  if(d2==1){ // partial derivative df/dv
    fv1.set(sv/(cvp2*cvp2),  sv23/(cv23p2*cv23p2), -(sv*cv23p2+cvp2*sv23)/4);
  }
  if(d1>0 && d2>0){
    // normal is given by the cross product of the partial derivatives
    PVector p10 = PVector.mult(fu1,fv0); 
    PVector p01 = PVector.mult(fu0,fv1);
    return p10.cross(p01); // return unnormalized normal
  }
  return new PVector(); // should never reach this point...
}

