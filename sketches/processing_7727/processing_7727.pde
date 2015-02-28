
import javax.media.opengl.*; 
import processing.opengl.*;

import toxi.geom.*;

int splineRes = 180;
int PARTICLE_COUNT = 100;
float GND_COLOR = 20;
float deltar=0;
float deltaazymuth=0;
float deltatheta=0;

float r = random(5, 8);
float azymuth = random(PI/1);
float theta = random(PI/0.3);

Vec3D[] particleCloud;
Vec3D[] particleCloud01;
Vec3D[] particleCloud02;
Spline3D[] splines;
PGraphicsOpenGL pgl;
GL gl; 
void setup(){
  size(1440,852, OPENGL);
  hint(DISABLE_OPENGL_2X_SMOOTH);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  noFill();
  smooth();

  colorMode(HSB, 360,100,100,100);
  initParticleClouds();
}

void draw(){
  pgl = (PGraphicsOpenGL)g;
  gl = pgl.gl;

  gl.glClear(GL.GL_DEPTH_BUFFER_BIT);
  //draw shit
  //  additive blending
  pgl.beginGL();
  // This fixes the overlap issue
  gl.glDisable(GL.GL_DEPTH_TEST);
  gl.glDepthMask(false); 
  // Turn on the blend mode
  gl.glEnable(GL.GL_BLEND);
  // Define the blend mode
   gl.glBlendFunc(GL.GL_SRC_ALPHA,GL.GL_ONE);
  //gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE_MINUS_SRC_ALPHA);
  pgl.endGL();

  
  //view
  background(GND_COLOR);
  float cameraX = height/2.0;
  float cameraY = height/2.0;
  float fov = PI/1.8;
  float cameraZ = height/tan(PI/6);
  float aspect = float(width)/float(height);
  perspective(fov, aspect, cameraZ/100.0, cameraZ*100.0);
  translate(width/2, height/2, cameraZ/3);

  updatePerspective();
  updateParticleClouds();
  updateSplines();
}

void updatePerspective(){
  rotateY(PI*2*mouseX/width);
  rotateZ(PI*2*mouseY/height);
}

void initParticleClouds(){
  particleCloud = new Vec3D[PARTICLE_COUNT];
  particleCloud01 = new Vec3D[PARTICLE_COUNT];
  particleCloud02 = new Vec3D[PARTICLE_COUNT];
  for(int i=0; i<PARTICLE_COUNT; i++){
    particleCloud[i] = new Vec3D( r*13, azymuth, theta ).toCartesian();
    particleCloud01[i] = new Vec3D( r*21, azymuth*1.2, theta*1.2).toCartesian();
    particleCloud02[i] = new Vec3D( r*34, azymuth*0.9, theta*1.5 ).toCartesian();

    if(r<=13){
      println(r);
      deltar+=random(0.1);
    }
    else{
      println(r);
      deltar-=random(0.1);
    }

    if(azymuth<=TWO_PI){
      deltaazymuth+=random(TWO_PI/3600);
    }
    else{
      deltaazymuth-=random(TWO_PI/4800);
    }
    if(deltatheta<=TWO_PI/3){
      deltatheta+=random(TWO_PI/4800);
    }
    else{
      deltatheta-=random(TWO_PI/4800);
    }
    r+=deltar;
    azymuth+=deltaazymuth;
    theta+=deltatheta;
  }
}
void updateParticleClouds(){
  for(int i=0; i<PARTICLE_COUNT; i++){
    particleCloud[i].jitter(0.30);
    particleCloud01[i].jitter(0.20);
    particleCloud02[i].jitter(5.0);
  }
}
void updateSplines(){
  for(int i=0; i<PARTICLE_COUNT; i++){
    splines=new Spline3D[PARTICLE_COUNT];
    splines[i] = new Spline3D();
    splines[i].add(new Vec3D(0,0,0));
    splines[i].add(particleCloud[i]);
    splines[i].add(particleCloud01[i]);
    splines[i].add(particleCloud02[i]);

    java.util.List vOne=splines[i].computeVertices(splineRes);

    int cOne=0; 
    Vec3D prev=null;
    for(Iterator j=vOne.iterator(); j.hasNext();) {
      Vec3D pOne=(Vec3D)j.next();

      pushMatrix();
      translate(pOne.x, pOne.y, pOne.z);

      gl.glEnable(GL.GL_BLEND);

      //red shite     
      strokeWeight(21);
      stroke(r,  r*4, 50-azymuth/5, (80-azymuth)/120 );
      println(r);
      point(0,0);

      //white dot
      strokeWeight(3);
      stroke(theta*0.31-random(10), 1-2*r, 100-azymuth, (22-azymuth)/3 );
      point(0,0);



      //black shite       
//      gl.glDisable(GL.GL_BLEND);
      strokeWeight(21);
      stroke(0, 90-2*r, 0, azymuth/20 );
      point(0,0);

      popMatrix();
      prev=pOne;
      cOne++;
    }
  }
}






