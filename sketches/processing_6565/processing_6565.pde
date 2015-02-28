
/*
 * Test by ko-suke.
 */

int bigcubies = 2;
Cube []stage = new Cube[bigcubies]; // external large cube
int cubies = 50; //number of internal little cubes
Cube[]c = new Cube[cubies]; // internal little cubes
color[][]quadBG = new color[cubies][6];

int backcol;

//backcol = 0;

// controls cubie's movement
float[]x = new float[cubies];
float[]y = new float[cubies];
float[]z = new float[cubies];
float[]xSpeed = new float[cubies];
float[]ySpeed = new float[cubies];
float[]zSpeed = new float[cubies];

// controls cubie's rotation
float[]xRot = new float[cubies];
float[]yRot = new float[cubies];
float[]zRot = new float[cubies];

// size of external cube
float bounds = 1000;

void setup(){
  
  size(640, 480, P3D);
   frameRate(30);
  
  for (int i=0; i<cubies; i++){
    // each cube face has a random color component
    float colorShift = random(128,255);
/*    quadBG[i][0] = color(colorShift*0.4, colorShift*0.5, colorShift);
    quadBG[i][1] = color(colorShift*0.5, colorShift*0.4, colorShift);
    quadBG[i][2] = color(colorShift, colorShift, colorShift);
    quadBG[i][3] = color(colorShift, colorShift, colorShift*0.5);
    quadBG[i][4] = color(colorShift*0.5, colorShift*0.5, colorShift);
    quadBG[i][5] = color(colorShift, colorShift*0.5, colorShift);
*/
    for(int j=0;j<6;j++){
      quadBG[i][j] = color(colorShift*j/6, colorShift*j/6, colorShift);
    }
    // cubies are randomly sized
    float cubieSize = random(5, 75);
    c[i] =  new Cube(cubieSize, cubieSize, cubieSize);
    
    //initialize cubie's position, speed and rotation
    x[i] = 0;//random(0,100);
    y[i] = 0;//random(0,100);
    z[i] = 0;//random(0,100);

    xSpeed[i] = random(-5, 5);
    ySpeed[i] = random(-5, 5); 
    zSpeed[i] = random(-5, 5); 

    xRot[i] = random(40, 100);
    yRot[i] = random(40, 100);
    zRot[i] = random(40, 100);
  }
  // instantiate external large cube
  for(int i=0;i<bigcubies;i++){
    stage[i] =  new Cube(bounds/(i*i*0.5+1), bounds/(i*i*0.5+1), bounds/(i*i*0.5+1));
  }
}

void draw(){
//  background(255,255,255);
    background(sin(frameCount/(PI*2)/10)*64+64);
//  lights();
  // center in display window
//  translate(width/2, -height*2+5*frameCount%(height*5),-512+sin(frameCount/(PI*2))*128);
    translate(width/2, height/2,-2048-cos(frameCount/(PI*2)/10)*2048);
  // outer transparent cube
  noFill(); 
  // rotate everything, including external large cube
  rotateX(frameCount*PI/255);
  rotateY(frameCount*PI/255);
  rotateZ(frameCount*PI/255);
  stroke(255);
  // draw external large cube
  for(int i=0;i<bigcubies;i++){
    stage[i].create();
  }
  //move/rotate cubies
  for (int i=0; i<cubies; i++){
    pushMatrix();
    translate(x[i], y[i], z[i]);
    rotateX(frameCount*PI/xRot[i]);
    rotateY(frameCount*PI/yRot[i]);
    rotateZ(frameCount*PI/zRot[i]);
    noStroke();
    c[i].create(quadBG[i]);
    x[i]+=xSpeed[i];
    y[i]+=ySpeed[i];
    z[i]+=zSpeed[i];
    popMatrix();

    // draw lines connecting cubbies
 //   stroke(10);
 //   if (i< cubies-1){
 //     line(x[i], y[i], z[i], x[i+1], y[i+1], z[i+1]);
 //   }

    // check wall collisions
 /*   if (x[i]>bounds*1.5 || x[i]<-bounds*1.5){
      xSpeed[i]*=-1;
    }
    if (y[i]>bounds/4 || y[i]<-bounds/4){
      ySpeed[i]*=-1;
    }
    if (z[i]>bounds/4 || z[i]<-bounds/4){
      zSpeed[i]*=-1;
    }
  */
    if(x[i]*x[i]+y[i]*y[i]+z[i]*z[i]>bounds*bounds/4){
      xSpeed[i]*=-1;
      ySpeed[i]*=-1;
      zSpeed[i]*=-1;
    }
  }
  
 //   mm.addFrame(); 

}


// Custom Cube class

class Cube{
  Point3D[] vertices = new Point3D[24];
  float w, h, d;

  // Constructors
  // default constructor
  Cube(){
  }

  // constructor 2
  Cube(float w, float h, float d){
    this.w = w;
    this.h = h;
    this.d = d;
    
    // cube composed of 6 quads
    //front
    vertices[0] = new Point3D(-w/2,-h/2,d/2);
    vertices[1] = new Point3D(w/2,-h/2,d/2);
    vertices[2] = new Point3D(w/2,h/2,d/2);
    vertices[3] = new Point3D(-w/2,h/2,d/2);
    //left
    vertices[4] = new Point3D(-w/2,-h/2,d/2);
    vertices[5] = new Point3D(-w/2,-h/2,-d/2);
    vertices[6] = new Point3D(-w/2,h/2,-d/2);
    vertices[7] = new Point3D(-w/2,h/2,d/2);
    //right
    vertices[8] = new Point3D(w/2,-h/2,d/2);
    vertices[9] = new Point3D(w/2,-h/2,-d/2);
    vertices[10] = new Point3D(w/2,h/2,-d/2);
    vertices[11] = new Point3D(w/2,h/2,d/2);
    //back
    vertices[12] = new Point3D(-w/2,-h/2,-d/2); 
    vertices[13] = new Point3D(w/2,-h/2,-d/2);
    vertices[14] = new Point3D(w/2,h/2,-d/2);
    vertices[15] = new Point3D(-w/2,h/2,-d/2);
    //top
    vertices[16] = new Point3D(-w/2,-h/2,d/2);
    vertices[17] = new Point3D(-w/2,-h/2,-d/2);
    vertices[18] = new Point3D(w/2,-h/2,-d/2);
    vertices[19] = new Point3D(w/2,-h/2,d/2);
    //bottom
    vertices[20] = new Point3D(-w/2,h/2,d/2);
    vertices[21] = new Point3D(-w/2,h/2,-d/2);
    vertices[22] = new Point3D(w/2,h/2,-d/2);
    vertices[23] = new Point3D(w/2,h/2,d/2);
  }
  void create(){
    // draw cube
    for (int i=0; i<6; i++){
      beginShape(QUADS);
      for (int j=0; j<4; j++){
        vertex(vertices[j+4*i].x, vertices[j+4*i].y, vertices[j+4*i].z);
      }
      endShape();
    }
  }
  void create(color[]quadBG){
    // draw cube
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


//  Extremely simple  class to hold each 3D vertex

class Point3D {
  float x, y, z;

  // constructors
  Point3D(){
  }

  Point3D(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
}


