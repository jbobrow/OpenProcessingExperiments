
// 3d Belousov-Zhabotinsky reaction _ Tommaso Casucci

// expansion of Alasdair Turner code 
// http://www.openprocessing.org/visuals/?visualID=1263

import controlP5.*;
ControlP5 controlP5;

import peasy.*;


PeasyCam cam01;

PMatrix3D currCameraMatrix;
PGraphics3D g3; 

int dimX = 60;
int dimY = 60;
int dimZ = 60;

float alfa = 1.0;
float beta = 1.0;
float gamma = 1.0;

boolean isWireframe=false;

float [][][][] a;
float [][][][] b;
float [][][][] c;

int p = 0, q = 1;

void setup (){
  size(800,600,P3D);
  colorMode(HSB ,1.0);
  g3 = (PGraphics3D)g;
  cam01 = new PeasyCam(this, dimX/2,dimY/2,dimZ/2, 150);
 
  controlP5 = new ControlP5(this);
  Slider s0 = controlP5.addSlider("dimX",20, 60, 60, 15,25,150,15);
  Slider s1 = controlP5.addSlider("dimY",20, 60, 60, 15,50,150,15);
  Slider s2 = controlP5.addSlider("dimZ",20, 60, 60, 15,75,150,15);
  Slider s3 = controlP5.addSlider("alfa",1 , 2, 1, 15,100,150,15);
  Slider s4 = controlP5.addSlider("beta",1 , 2, 1, 15,125,150,15);
  Slider s5 = controlP5.addSlider("gamma",1 , 2, 1, 15,150,150,15);
  controlP5.setAutoDraw(false);
  
  a = new float [dimX ][ dimY ][ dimZ ][2];
  b = new float [dimX ][ dimY ][ dimZ ][2];
  c = new float [dimX ][ dimY ][ dimZ ][2];

  for (int x = 0; x < dimX; x++) {
    for (int y = 0; y < dimY; y++) {
      for (int z = 0; z< dimZ; z++) {
        a[x][y][z][p] = random (0.0 ,1.0);
        b[x][y][z][p] = random (0.0 ,1.0);
        c[x][y][z][p] = random (0.0 ,1.0);
        }
      }
    }
}


void draw (){
  
  background(0,0,0);
  
  noFill();
  stroke(1);
  pushMatrix();
  translate ((dimX/2), (dimY/2), (dimZ/2));
  box(dimX,dimY,dimZ);
  popMatrix();

  for (int x = 0; x < dimX; x++) {
    for (int y = 0; y < dimY; y++) {
      for (int z = 0; z < dimZ; z++){
        float c_a = 0.0;
        float c_b = 0.0;
        float c_c = 0.0;

        for (int i = x - 1; i <= x+1; i++) {
          for (int j = y - 1; j <= y+1; j++) {
            for (int k = z - 1; k <= z+1; k++) {
              c_a += a[(i+dimX )% dimX ][(j+dimY )% dimY ][(k+dimZ )% dimZ ][p];
              c_b += b[(i+dimX )% dimX ][(j+dimY )% dimY ][(k+dimZ )% dimZ ][p];
              c_c += c[(i+dimX )% dimX ][(j+dimY )% dimY ][(k+dimZ )% dimZ ][p];
              }
            }
          }
          
        c_a /= 27.0;
        c_b /= 27.0;
        c_c /= 27.0;

        a[x][y][z][q] = constrain(c_a + c_a * ( alfa*c_b - gamma*c_c), 0, 1);
        b[x][y][z][q] = constrain(c_b + c_b * ( beta*c_c - alfa*c_a), 0, 1);
        c[x][y][z][q] = constrain(c_c + c_c * ( gamma*c_a - beta*c_b), 0, 1);


        if(a[x][y][z][q]>0.1&& a[x][y][z][q]<0.5){ 
          stroke(a[x][y][z][q],0.8,0.9);
          point(x,y,z);
        }
      }
    }
  }


  if (p == 0) {
    p = 1; q = 0;
    }else{
    p = 0; q = 1;
    }
  
  gui();
}

void gui() {
   if(mouseX<220&&mouseY<200){
     cam01.setActive(false);
   }else{cam01.setActive(true);
   }
   currCameraMatrix = new PMatrix3D(g3.camera);
   camera();
   controlP5.draw();
   g3.camera = currCameraMatrix;
   updateUI();

}

void updateUI(){
  dimX=(int)controlP5.controller("dimX").value();
  dimY=(int)controlP5.controller("dimY").value();
  dimZ=(int)controlP5.controller("dimZ").value();
  alfa=controlP5.controller("alfa").value();
  beta=controlP5.controller("beta").value();
  gamma=controlP5.controller("gamma").value();
}




