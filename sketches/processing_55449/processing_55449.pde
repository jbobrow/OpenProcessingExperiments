
PImage sphere_tex;
 
float rotx = 0.0;
float roty = 0.0;
float rotz = 0.0;
float deltax = 0.01;
 
int sDetail = 75;  // Sphere detail setting
float pushBack = 0; // z coordinate of the center of the sphere
float factor = 0.99; // magnification factor
 
float[] sphereX, sphereY, sphereZ;
float[] sphereX1, sphereY1, sphereZ1;
float sinLUT[];
float cosLUT[];
float SINCOS_PRECISION = 0.5;
int SINCOS_LENGTH = int(360.0 / SINCOS_PRECISION);
 
boolean distortion = false;
boolean inside = true;
boolean outline = false;
boolean textured = true;
 
void setup()
{
  size(512, 384, P3D);
  pushBack = height;
  initializeSphere(sDetail);
  sphere_tex = loadImage("narthex_equirect.jpg");
}
 
void draw()
{
  background(0);
  if(inside) {
    translate(width / 2.0, height / 2.0, pushBack);
  }
  else {
    translate(width / 2.0, height / 2.0, -pushBack);
  }
  if(abs(rotx) > PI / 2) {
    deltax = -deltax;
  }
  rotateX(rotx += deltax);
  rotateY(roty += 0.01);
  rotateZ(rotz);
  //rotateZ(rotz -= 0.02);
  textureMode(IMAGE);
  if(!outline) {
    noStroke();
  }
  else {
    stroke(0);
  }
  texturedSphere(pushBack *= factor, sphere_tex);
  if(pushBack < height / 2.0) {
    factor = 1.01;
  }
  else {
    if(pushBack > height) {
      factor = 0.99;
    }
  }
}
 
//void mousePressed()
//{
//  save("panorama1.jpg");
//}
 
void keyPressed() {
  if (key == 'd' || key == 'D') {
    distortion = !distortion;
  }
  else {
    if (key == 'i' || key == 'I') {
      inside = !inside;
    }
    else {
      if (key == 's' || key == 'S') {
        outline = !outline;
      }
      else {
        if (key == 't' || key == 'T') {
          textured = !textured;
        }
      }
    }
  }
}
 
void initializeSphere(int res)
{
  sinLUT = new float[SINCOS_LENGTH];
  cosLUT = new float[SINCOS_LENGTH];
 
  for(int i = 0; i < SINCOS_LENGTH; i++) {
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SINCOS_PRECISION);
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SINCOS_PRECISION);
  }
 
  float delta = (float)SINCOS_LENGTH / res;
  float[] cx = new float[res];
  float[] cz = new float[res];
   
  // Calc unit circle in XZ plane
  for(int i = 0; i < res; i++) {
    cx[i] = -cosLUT[(int) (i * delta) % SINCOS_LENGTH];
    cz[i] = sinLUT[(int) (i * delta) % SINCOS_LENGTH];
  }
   
  // Computing vertexlist vertexlist starts at south pole
  int vertCount = res * (res - 1) + 2;
  int currVert = 0;
   
  // Re-init arrays to store vertices
  sphereX = new float[vertCount];
  sphereY = new float[vertCount];
  sphereZ = new float[vertCount];
  sphereX1 = new float[vertCount];
  sphereY1 = new float[vertCount];
  sphereZ1 = new float[vertCount];
  float angle_step = (SINCOS_LENGTH * 0.5f) / res;
  float angle = angle_step;
   
  // Step along Y axis
  for(int i = 1; i < res; i++) {
    float curradius = sinLUT[(int) angle % SINCOS_LENGTH];
    float currY = -cosLUT[(int) angle % SINCOS_LENGTH];
    for(int j = 0; j < res; j++) {
      sphereX[currVert] = cx[j] * curradius;
      sphereY[currVert] = currY;
      sphereZ[currVert++] = cz[j] * curradius;
    }
    angle += angle_step;
  }
  sDetail = res;
}
 
// Generic routine to draw textured sphere
void texturedSphere(float r, PImage t)
{
  int v1, v11, v2;
  //r = (r + 240 ) * 0.33;
  float r1 = r, r2 = r;
  if(distortion) {
    r1 = r * (0.975 + random(5) / 100);
  }
  beginShape(TRIANGLE_STRIP);
  if(textured) {
    texture(t);
  }
  float iu = (float) (t.width - 1) / (sDetail);
  float iv = (float) (t.height - 1) / (sDetail);
  float u = 0, v = iv;
  for(int i = 0; i < sDetail; i++) {
    if(distortion) {
      sphereX1[i] = sphereX[i] * (0.975 + random(5) / 100);
      sphereY1[i] = sphereY[i] * (0.975 + random(5) / 100);
      sphereZ1[i] = sphereZ[i] * (0.975 + random(5) / 100);
      if(textured) {
        vertex(0, -r1, 0, u, 0);
        vertex(sphereX1[i] * r, sphereY1[i] * r, sphereZ1[i] * r, u, v);
      }
      else {
        vertex(0, -r1, 0);
        vertex(sphereX1[i] * r, sphereY1[i] * r, sphereZ1[i] * r);
      }
    }
    else {
      if(textured) {
        vertex(0, -r, 0, u, 0);
        vertex(sphereX[i] * r, sphereY[i] * r, sphereZ[i] * r, u, v);
      }
      else {
        vertex(0, -r, 0);
        vertex(sphereX[i] * r, sphereY[i] * r, sphereZ[i] * r);
      }
    }
    u += iu;
  }
  if(distortion) {
    if(textured) {
      vertex(0, -r1, 0, u, 0);
      vertex(sphereX1[0] * r, sphereY1[0] * r, sphereZ1[0] * r, u, v);
    }
    else {
      vertex(0, -r1, 0);
      vertex(sphereX1[0] * r, sphereY1[0] * r, sphereZ1[0] * r);
    }
  }
  else {
    if(textured) {
      vertex(0, -r, 0, u, 0);
      vertex(sphereX[0] * r, sphereY[0] * r, sphereZ[0] * r, u, v);
    }
    else {
      vertex(0, -r, 0);
      vertex(sphereX[0] * r, sphereY[0] * r, sphereZ[0] * r);
    }
  }
  endShape();  
   
  // Middle rings
  int voff = 0;
  for(int i = 2; i < sDetail; i++) {
    v1 = v11 = voff;
    voff += sDetail;
    v2 = voff;
    u = 0;
    beginShape(TRIANGLE_STRIP);
    if(textured) {
      texture(t);
    }
    for(int j = 0; j < sDetail; j++) {
      if(distortion) {
        sphereX1[v2] = sphereX[v2] * (0.975 + random(5) / 100);
        sphereY1[v2] = sphereY[v2] * (0.975 + random(5) / 100);
        sphereZ1[v2] = sphereZ[v2] * (0.975 + random(5) / 100);
        if(textured) {
          vertex(sphereX1[v1] * r, sphereY1[v1] * r, sphereZ1[v1++] * r, u, v);
          vertex(sphereX1[v2] * r, sphereY1[v2] * r, sphereZ1[v2++] * r, u, v + iv);
        }
        else {
          vertex(sphereX1[v1] * r, sphereY1[v1] * r, sphereZ1[v1++] * r);
          vertex(sphereX1[v2] * r, sphereY1[v2] * r, sphereZ1[v2++] * r);
        }
      }
      else {
        if(textured) {
          vertex(sphereX[v1] * r, sphereY[v1] * r, sphereZ[v1++] * r, u, v);
          vertex(sphereX[v2] * r, sphereY[v2] * r, sphereZ[v2++] * r, u, v + iv);
        }
        else {
          vertex(sphereX[v1] * r, sphereY[v1] * r, sphereZ[v1++] * r);
          vertex(sphereX[v2] * r, sphereY[v2] * r, sphereZ[v2++] * r);
        }
      } 
      u += iu;
    }
   
    // Close each ring
    v1 = v11;
    v2 = voff;
    if(distortion) {
      if(textured) {
        vertex(sphereX1[v1] * r, sphereY1[v1] * r, sphereZ1[v1] * r, u, v);
        vertex(sphereX1[v2] * r, sphereY1[v2] * r, sphereZ1[v2] * r, u, v + iv);
      }
      else {
        vertex(sphereX1[v1] * r, sphereY1[v1] * r, sphereZ1[v1] * r);
        vertex(sphereX1[v2] * r, sphereY1[v2] * r, sphereZ1[v2] * r);
      } 
    }
    else {
      if(textured) {
        vertex(sphereX[v1] * r, sphereY[v1] * r, sphereZ[v1] * r, u, v);
        vertex(sphereX[v2] * r, sphereY[v2] * r, sphereZ[v2] * r, u, v + iv);
      }
      else {
        vertex(sphereX[v1] * r, sphereY[v1] * r, sphereZ[v1] * r);
        vertex(sphereX[v2] * r, sphereY[v2] * r, sphereZ[v2] * r);
      } 
    } 
    endShape();
    v += iv;
  }
  u = 0;
   
  if(distortion) {
    r2 = r * (0.975 + random(5) / 100);
  }
 // Add the northern cap
  beginShape(TRIANGLE_STRIP);
  if(textured) {
    texture(t);
  }
  for(int i = 0; i < sDetail; i++) {
    v2 = voff + i;
    if(distortion) {
      if(textured) {
        vertex(sphereX1[v2] * r, sphereY1[v2] * r, sphereZ1[v2] * r, u, v);
        vertex(0, r2, 0, u, v + iv);
      }
      else {
        vertex(sphereX1[v2] * r, sphereY1[v2] * r, sphereZ1[v2] * r);
        vertex(0, r2, 0);
      } 
    }
    else {
      if(textured) {
        vertex(sphereX[v2] * r, sphereY[v2] * r, sphereZ[v2] * r, u, v);
        vertex(0, r, 0, u, v + iv);
      }
      else {
        vertex(sphereX[v2] * r, sphereY[v2] * r, sphereZ[v2] * r);
        vertex(0, r, 0);
      } 
    } 
    u += iu;
  }
  if(distortion) {
    if(textured) {
      vertex(sphereX1[voff] * r, sphereY1[voff] * r, sphereZ1[voff] * r, u, v);
    }
    else {
      vertex(sphereX1[voff] * r, sphereY1[voff] * r, sphereZ1[voff] * r);
    } 
  }
  else {
    if(textured) {
      vertex(sphereX[voff] * r, sphereY[voff] * r, sphereZ[voff] * r, u, v);
    }
    else {
      vertex(sphereX[voff] * r, sphereY[voff] * r, sphereZ[voff] * r);
    } 
  } 
  endShape();
   
}

