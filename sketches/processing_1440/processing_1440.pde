
/*
  CrystalCubes
  by Stinging Eyes, 19 Sep 08 (Processing 0135)
  use mouse movement to zoom
  looks better under OpenGL (enable OPENGL comments) */

//import processing.opengl.*;

float ang;
int maxCubes = 500; // number of cubes
int cubeSize = 60; // size of cubes
Cube[]cubes = new Cube[maxCubes];

void setup() {
  size(600,600,P3D);
  //size(600,600,OPENGL);
  //hint(ENABLE_OPENGL_2X_SMOOTH);
  stroke(102,51,204);

  for (int i = 0; i < cubes.length; i++){
    cubes[i] = new Cube(int(random(-30,30)), int(random(-30,30)), int(random(-30,30)));
      // x, y, depth
  }
}

void draw() {

  background(0); 
  shininess(5.0);
  lightSpecular(200,200,200);
  directionalLight(153,153,255,-1,0,0);
  pointLight(50,50,200,65,60,100); 
  ambientLight(102,51,204);
  specular(255,255,255);
  translate(width/2, height/2, -200 + mouseX); 
  rotateY(radians(ang));
  rotateX(radians(ang));

  for (int i=0; i < cubes.length; i++){
    cubes[i].drawCube();  
  }

  ang++; 
}

class Cube {

  int x;
  int y;
  int d;

  Cube(int x, int y, int d){
    this.x = x;
    this.y = y;
    this.d = d;
  }

  void drawCube(){
    translate(this.x, this.y, this.d);
    box(cubeSize);
    rotateY(radians(20));
    rotateX(radians(20));
    rotateZ(radians(20));
      // rotate individual cubes
  }
}

