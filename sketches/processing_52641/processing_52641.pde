
/* a mesh grid attached by its four corners,
gravity is adjusted in both x and y directions by the cursor location
moving the mouse also provides a degree of rotation
the readout on the upper right corner displays the x and y force on the mesh
*/

import netscape.javascript.*;

import simong.*;
import simong.particles.*;

ParticleSystem ps;
Particle [][] p;
Spring [][] sp1;
Spring [][] sp2;

//set the number of particles across (fu), and down (fv)
int fu = 20;
int fv = 20;
//the variable L is the lineweight multiplier
float L = 0.025;


void setup () {
 
  size (600, 600, P3D);
  ps = new ParticleSystem (this);
  
  ps.defaultSpringStrength = 4;
 
//our particles and springs
  p = new Particle[fu][fv];
  sp1 = new Spring[fu][fv];
  sp2 = new Spring[fv][fu];

//this is the grid of particles composing our mesh
for (int i=0; i<fu; i++) {
  for (int j=0; j<fv; j++){
    
    p[i][j] = new Particle (ps,(i*fu),1, (j*fv));   
  }
}

//these are the springs
for (int i=0; i<fu; i++) {
  for (int j=0; j<fv; j++){
    if (j<(fv-1)) sp1[i][j] = new Spring(p[i][j], p[i][j+1]);
    if (i<(fu-1)) sp2[i][j] = new Spring(p[i][j], p[i+1][j]);
  }
}

//this is the location of the spring anchors, at each corner of the grid
for (int i=0; i<fu; i++) {
  for (int j=0; j<fv; j++){
    p[0][0].fix();
    p[0][fv-1].fix();
    p[fu-1][0].fix();
    p[fu-1][fv-1].fix();
  }
}

}


void draw () {
 

  smooth();
  background (0);
  //center the mesh
  translate (width/6, height/3,-250);
  
 //rotate the camera slightly
  rotateX(mouseX*0.0005);
  rotateY(mouseY*0.0005);
  
 //draw the particle system
  for (int i=0; i<(fu); i++) {
  for (int j=0; j<(fv-1); j++){
  
  float dsp1 = dist((float)sp1[i][j].a.pos[0], (float)sp1[i][j].a.pos[1], (float)sp1[i][j].a.pos[2],(float)sp1[i][j].b.pos[0], (float)sp1[i][j].b.pos[1], (float)sp1[i][j].b.pos[2]);
  line((float)sp1[i][j].a.pos[0], (float)sp1[i][j].a.pos[1], (float)sp1[i][j].a.pos[2],(float)sp1[i][j].b.pos[0], (float)sp1[i][j].b.pos[1], (float)sp1[i][j].b.pos[2]);
  strokeWeight (dsp1*L);
  stroke (100,25,10*dsp1);
  strokeCap (ROUND);
      }
  }
  
  for (int i=0; i<(fu-1); i++) {
  for (int j=0; j<(fv); j++){
    
  float dsp2 = dist((float)sp2[i][j].a.pos[0], (float)sp2[i][j].a.pos[1], (float)sp2[i][j].a.pos[2],(float)sp2[i][j].b.pos[0], (float)sp2[i][j].b.pos[1], (float)sp2[i][j].b.pos[2]);
  line((float)sp2[i][j].a.pos[0], (float)sp2[i][j].a.pos[1], (float)sp2[i][j].a.pos[2],(float)sp2[i][j].b.pos[0], (float)sp2[i][j].b.pos[1], (float)sp2[i][j].b.pos[2]);
  strokeWeight (dsp2*L);
  stroke (100,25,10*dsp2);
  strokeCap (ROUND);
      }
  }
  
  
 //define variables for gravity 
  float mmy = mouseY*0.01;
  float mmx = (mouseX-width/2)*0.01;
  
 //gravity acting on particle system
  ps.gY = mmy;
  ps.gX = mmx;
  
 //fix text independant of camera movement
   camera();
//((PGraphicsOpenGL)g).gl.glClear(GL.GL_DEPTH_BUFFER_BIT);
    text (mmx, 60, 41, 20);
    text (mmy, 60, 61, 20);
    text ("gX", 30, 40, 20);
    text ("gY", 30, 60, 20);

}

void mouseDragged() {
  
for (int i=0; i<fu; i++) {
  for (int j=0; j<fv; j++){
  
float md = dist ((float)p[i][j].pos[0], (float)p[i][j].pos[1], 0, mouseX, mouseY, 0);
  
//mouse attracting variables 
float att = 100;
float mX = (mouseX);
float mY = (mouseY);

//this sets the attractor zone from within the particles are selected
if (md<att) { 

p[i][j].fix();
p[i][j].pos[0] = mX; 
p[i][j].pos[1] = mY; 

    }
   }
  }
}



