
/**
 * Moon Textured Sphere
 * by Luis Correia
 * based on the OpenGL processing library example
 * by Mike 'Flux' Chang (cleaned up by Aaron Koblin). 
 * Based on code by Toxi. 
 * 
 * A 3D textured sphere with simple rotation control.
 * Note: Controls will be inverted when sphere is upside down. 
 * Use an "arc ball" to deal with this appropriately.
 */ 
PImage texmap;

int sDetail=72;  // Sphere detail setting
float rotationX=0;
float rotationY=0;
float velocityX=0;
float velocityY=0;

float[] cx, cz, sphereX, sphereY, sphereZ;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION=0.5;
int SINCOS_LENGTH=int(360.0/SINCOS_PRECISION);
int PushBack;

void setup() {
  size(512, 512, P3D);
  //texmap=loadImage("WAC_GLOBAL_E000N0000_016P.png");
  texmap=loadImage("WAC_GLOBAL_E000N0000_016P.JPG");
  initializeSphere(sDetail);
  PushBack=-height;
}

void draw() {    
  background(0);            
  renderGlobe(); 
}

void renderGlobe() {
  translate(width/2.0, height/2.0, PushBack);
  rotateX(radians(-rotationX));  
  rotateY(radians(270-rotationY));
  scale(1.0, 1.73597/1.73814, 1.0);
  textureMode(IMAGE);  
  texturedSphere(height/1.25, texmap);
  //wireframeSphere(height/1.245, 1);
  rotationX+=velocityX;
  rotationY+=velocityY;
  velocityX*=0.95;
  velocityY*=0.95;
  
  // Implements mouse control (interaction will be inverse when sphere is  upside down)
  if(mousePressed) {
    if(mouseButton==LEFT){
      velocityX+=(mouseY-pmouseY)*0.01;
      velocityY-=(mouseX-pmouseX)*0.01;
    }
    else {
      PushBack+=mouseX-pmouseX+mouseY-pmouseY;
      constrain(PushBack, -height*3, 0);
    }
  }
  //else {
  //  velocityY-=0.02;
  //}
  //if(keyPressed) {
  //  save("MoonSphere.png");
  //}
}

void initializeSphere(int res)
{
  sinLUT=new float[SINCOS_LENGTH];
  cosLUT=new float[SINCOS_LENGTH];

  for(int i=0; i<SINCOS_LENGTH; i++) {
    sinLUT[i]=(float)Math.sin(i*DEG_TO_RAD*SINCOS_PRECISION);
    cosLUT[i]=(float)Math.cos(i*DEG_TO_RAD*SINCOS_PRECISION);
  }

  float delta=(float)SINCOS_LENGTH/res;
  float[] cx=new float[res];
  float[] cz=new float[res];
  
  // Calc unit circle in XZ plane
  for(int i=0; i<res; i++) {
    cx[i]=-cosLUT[(int)(i*delta)%SINCOS_LENGTH];
    cz[i]=sinLUT[(int)(i*delta)%SINCOS_LENGTH];
  }
  
  // Computing vertexlist vertexlist starts at south pole
  int vertCount=res*(res-1)+2;
  int currVert=0;
  
  // Re-init arrays to store vertices
  sphereX=new float[vertCount];
  sphereY=new float[vertCount];
  sphereZ=new float[vertCount];
  float angle_step=(SINCOS_LENGTH*0.5f)/res;
  float angle=angle_step;
  
  // Step along Y axis
  for(int i=1; i<res; i++) {
    float curradius=sinLUT[(int)angle%SINCOS_LENGTH];
    float currY=-cosLUT[(int)angle%SINCOS_LENGTH];
    for (int j=0; j<res; j++) {
      sphereX[currVert]=cx[j]*curradius;
      sphereY[currVert]=currY;
      sphereZ[currVert++]=cz[j]*curradius;
    }
    angle+=angle_step;
  }
  sDetail=res;
}

// Generic routine to draw textured sphere
void texturedSphere(float r, PImage t) 
{
  int v1, v11, v2;
  noStroke();
  beginShape(TRIANGLE_STRIP);
  texture(t);
  float iu=(float)(t.width-1)/(sDetail);
  float iv=(float)(t.height-1)/(sDetail);
  float u=0,v=iv;
  for(int i=0; i<sDetail; i++) {
    vertex(0, -r, 0, u, 0);
    vertex(sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r, u, v);
    u+=iu;
  }
  vertex(0, -r, 0, u, 0);
  vertex(sphereX[0]*r, sphereY[0]*r, sphereZ[0]*r, u, v);
  endShape();   
  
  // Middle rings
  int voff=0;
  for(int i= 2; i<sDetail; i++) {
    v1=v11=voff;
    voff+=sDetail;
    v2=voff;
    u=0;
    beginShape(TRIANGLE_STRIP);
    texture(t);
    for(int j=0; j<sDetail; j++) {
      vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1++]*r, u, v);
      vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2++]*r, u, v+iv);
      u+=iu;
    }
  
    // Close each ring
    v1=v11;
    v2=voff;
    vertex(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1]*r, u, v);
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v+iv);
    endShape();
    v+=iv;
  }
  u=0;
  
  // Add the northern cap
  beginShape(TRIANGLE_STRIP);
  texture(t);
  for(int i=0; i<sDetail; i++) {
    v2 = voff+i;
    vertex(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, u, v);
    vertex(0, r, 0, u, v+iv);    
    u+=iu;
  }
  vertex(sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r, u, v);
  endShape();
}
/*
void wireframeSphere(float r, float sw) 
{
  int v1, v11, v2;
  int i, j;

  stroke(255);
  strokeWeight(sw);
  for(i=0; i<sDetail; i++) {
    line(0, -r, 0, sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r);
    if(i<sDetail-1) line(sphereX[i]*r, sphereY[i]*r, sphereZ[i]*r, sphereX[i+1]*r, sphereY[i+1]*r, sphereZ[i+1]*r);
  }
  line(sphereX[i-1]*r, sphereY[i-1]*r, sphereZ[i-1]*r, sphereX[0]*r, sphereY[0]*r, sphereZ[0]*r);
  
  // Middle rings
  int voff=0;
  for(i=2; i<sDetail; i++) {
    v1=v11=voff;
    voff+=sDetail;
    v2=voff;
    for(j=0; j<sDetail; j++) {
      line(sphereX[v1]*r, sphereY[v1]*r, sphereZ[v1++]*r, sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r);
      if(j<sDetail-1) line(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, sphereX[v2+1]*r, sphereY[v2+1]*r, sphereZ[v2+1]*r);
      v2++;
    }
    line(sphereX[v2-1]*r, sphereY[v2-1]*r, sphereZ[v2-1]*r, sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r);
  }
  
  // Add the northern cap
  for(i=0; i<sDetail; i++) {
    v2=voff+i;
    line(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, 0, r, 0);
  }
  v2=voff+i-1;
  line(sphereX[v2]*r, sphereY[v2]*r, sphereZ[v2]*r, sphereX[voff]*r, sphereY[voff]*r, sphereZ[voff]*r);
}
*/

