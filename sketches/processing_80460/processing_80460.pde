
Cube stage; // external large cube
int cubies = 100;
Cube[]c = new Cube[cubies]; // internal little cubes
color[][]quadBG = new color[cubies][6];

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
float bounds = 300;

void setup() {
  size(360, 360, P3D);
  
  for (int i = 0; i < cubies; i++){
    // Each cube face has a random color component
    float colorShift = random(-75, 75);
    quadBG[i][0] = color(0);
    quadBG[i][1] = color(51);
    quadBG[i][2] = color(237, 192, 29);
    quadBG[i][3] = color(153);
    quadBG[i][4] = color(204);
    quadBG[i][5] = color(255);

    // Cubies are randomly sized
    float cubieSize = random(5, 45);
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
}

void draw(){
  background(41, 47, 62);
  lights();
  
  rect(175, 175, 10, 10);  
  fill(252, 199, 3);
  tint(252, 199, 3);
  
  // Center in display window
  translate(width/2, height/2, -130);
  
  rect(-10, -10, 20, 20);  
  fill(252, 199, 3);
  tint(252, 199, 3);
  
  // Outer transparent cube
  noFill(); 
  
  // Rotate everything, including external large cube
  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.002);
  rotateZ(frameCount * 0.001);
  stroke(255);
  
  // Draw external large cube
  stage.create();

  // Move and rotate cubies
  for (int i = 0; i < cubies; i++){
    pushMatrix();
    translate(x[i], y[i], z[i]);
    rotateX(frameCount*PI/xRot[i]);
    rotateY(frameCount*PI/yRot[i]);
    rotateX(frameCount*PI/zRot[i]);
    noStroke();
    c[i].create(quadBG[i]);
    x[i] += xSpeed[i];
    y[i] += ySpeed[i];
    z[i] += zSpeed[i];
    popMatrix();

    // Check wall collisions
    if (x[i] > bounds/2 || x[i] < -bounds/2){
      xSpeed[i]*=-1;
    }
    if (y[i] > bounds/2 || y[i] < -bounds/2){
      ySpeed[i]*=-1;
    }
    if (z[i] > bounds/2 || z[i] < -bounds/2){
      zSpeed[i]*=-1;
    }
  }
}





// Custom Cube Class

class Cube{
  PVector[] vertices = new PVector[24];
  float w, h, d;

  // Default constructor
  Cube(){ }

  // Constructor 2
  Cube(float w, float h, float d) {
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
  void create(){
    // Draw cube
    for (int i=0; i<6; i++){
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
  void create(color[]quadBG){
    // Draw cube
    for (int i=0; i<6; i++){
      fill(quadBG[i]);
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
}


