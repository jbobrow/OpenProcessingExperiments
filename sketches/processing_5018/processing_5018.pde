

PFont font;
Cube stage; // external large cube
int baball = 30;


// controls cubie's movement
float[]x = new float[baball];
float[]y = new float[baball];
float[]z = new float[baball];
float[]xSpeed = new float[baball];
float[]ySpeed = new float[baball];
float[]zSpeed = new float[baball];


// size of external cube
float bounds = 400;

void setup(){
  size(1000, 1000, P3D);
  font = loadFont("ArialMT-48.vlw");
  frameRate(30);
  
  for (int i=0; i<baball; i++){
    x[i] = (random(-110,110));
    y[i] = (random(-180,180)); 
    z[i] = (random(-180,180));

    xSpeed[i] =( 3);
    ySpeed[i] = ( 3); 
    zSpeed[i] = (3); 
    
    
  }
  // instantiate external large cube
  stage =  new Cube(bounds, bounds, bounds);
}

void draw(){
    
 
  background(0);
  textFont(font, 32);
  text("To reset escaped balls press leftMouse", 440, 970);
  directionalLight(250, 250, 250, -2,1,0);
  ambientLight(-152, 152, 152);
  // center in display window
  translate(width/2, height/2,-130);
  rotateX(-3);
  rotateY(45);
  noFill(); 

  stroke(150,0,0);
  // draw external large cube
  stage.create();

  //move/rotate baballs
  for (int i=0; i<baball; i++){
    pushMatrix();
    translate(x[i], y[i], z[i]);
    
    noStroke();
    fill(150, 150, 255);
    
    sphere(20);
    sphereDetail(10);
    x[i]+=xSpeed[i];
    y[i]+=ySpeed[i];
    z[i]+=zSpeed[i];
    popMatrix();
    if(x[i]>bounds||y[i]>bounds){
    if(mousePressed==true){
    xSpeed[i] =( 3);
    ySpeed[i] = ( 3); 
    zSpeed[i] = (3); 
      pushMatrix();
      translate(x[i], y[i], z[i]);
    x[i]=(random(-110,110));
    y[i]=(random(-180,180));
    z[i]=(random(-180,180));
    popMatrix();
    }
    }
   

    // check wall collisions
    if (x[i]+20>bounds/2 || x[i]-20<-bounds/2){
      xSpeed[i]*=-2;
    }
    if (y[i]+20>bounds/2 || y[i]-20<-bounds/2){
      ySpeed[i]*=-2;
    }
    if (z[i]+20>bounds/2 || z[i]-20<-bounds/2){
      zSpeed[i]*=-2;
    }
    //collide
if (x[i] == x[i] - 20*0.5){
 xSpeed[i] *=-1;
    }
if (y[i] == y[i] - 20*0.5){
 ySpeed[i] *=-1;
    }
    if (z[i] == z[i] - 20*0.5){
 zSpeed[i] *=-1;
    }
    }
  }


 
// Custom Cube class

class Cube{
  Point3D[] vertices = new Point3D[24];
  float w, h, d;

  
 

  // constructor 
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

}


//  Extremely simple  class to hold each 3D vertex

class Point3D {
  float x, y, z;

  // constructor
  Point3D(){
  }

  Point3D(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
}

