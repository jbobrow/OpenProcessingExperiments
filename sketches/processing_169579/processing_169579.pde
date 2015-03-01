

sun theoneandonly = new sun();
earth ehnois = new earth();
bigclock bang = new bigclock();

PFont font;

int timeH;
int timeM;
int timeS;
int timeMs;

float seconds = timeMs /1000;
float minutes = 60*seconds;
float hours = 60*minutes;
float days = 24*hours;

float camRot = 0;

//stuff from earth texturized sphere
//https://processing.org/examples/texturesphere.html
int ptsW, ptsH;

PImage img;

int numPointsW;
int numPointsH_2pi; 
int numPointsH;

float[] coorX;
float[] coorY;
float[] coorZ;
float[] multXZ;


void setup() {
  smooth();
  size(900, 900, P3D);
  noStroke();

  //time font
  font = loadFont("ahh.vlw");

  //prime c. bodies' sizes
  theoneandonly.prime(250);
  ehnois.prime(15);

  //prime bigclock
  bang.prime(30);
  
  //stuff from texturized sphere 2
  img=loadImage("world32k.jpg");
  ptsW=30;
  ptsH=30;
  // Parameters below are the number of vertices around the width and height
  initializeSphere(ptsW, ptsH);
}

void draw() {

  timeH = hour();
  timeM = minute();
  timeS = second();
  timeMs = millis();

  background(0);
  //  pointLight(200, 170, 50, width/2, height/2, 200);

  //Camera
  //  camRot -= 0.01 % millis();
  camRot = HALF_PI;
  camera(width/2.0 + cos(camRot)*1000 +(map(mouseX, width, 0, -500, 500)), //X
  height/2.0 + (map(mouseY, height, 0, -500, 500)), //Y
  sin(camRot)*1000 +(map(mouseY, height, 0, -300, 300)), //Z 
  width/2.0, height/2.0, -200, //CAM TARGET
  0, 1, 0); // CAM UP VECTOR (set to Y)

  //Draw c. bodies
  theoneandonly.update();
  ehnois.update(); 
  bang.update();

  //Draw Time
  //Thanks Daniel for this insight.
  pushMatrix();
  fill(255);
  if (timeM < 10) {
    text(timeH + ":" + 0+timeM, width/2 - 18, height/2 - 25, 500);
  } else text(timeH + ":" + timeM, width/2 - 18, height/2 - 25, 500);
  popMatrix();
}

//I Copied this whole thing from the Mike 'Flux' Chang /Aaron Koblin/Toxi setup.  
void initializeSphere(int numPtsW, int numPtsH_2pi) {

  // The number of points around the width and height
  numPointsW=numPtsW+1;
  numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
  numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)

  coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
  coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
  coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
  multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)

  for (int i=0; i<numPointsW; i++) {  // For all the points around the width
    float thetaW=i*2*PI/(numPointsW-1);
    coorX[i]=sin(thetaW);
    coorZ[i]=cos(thetaW);
  }

  for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
    if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
      float thetaH=(i-1)*2*PI/(numPointsH_2pi);
      coorY[i]=cos(PI+thetaH); 
      multXZ[i]=0;
    } else {
      //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
      float thetaH=i*2*PI/(numPointsH_2pi);

      //PI+ below makes the top always the point instead of the bottom.
      coorY[i]=cos(PI+thetaH); 
      multXZ[i]=sin(thetaH);
    }
  }
}
void textureSphere(float rx, float ry, float rz, PImage t) { 
  // These are so we can map certain parts of the image on to the shape 
  float changeU=t.width/(float)(numPointsW-1); 
  float changeV=t.height/(float)(numPointsH-1); 
  float u=0;  // Width variable for the texture
  float v=0;  // Height variable for the texture

  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i=0; i< (numPointsH-1); i++) {  // For all the rings but top and bottom
    // Goes into the array here instead of loop to save time
    float coory=coorY[i];
    float cooryPlus=coorY[i+1];

    float multxz=multXZ[i];
    float multxzPlus=multXZ[i+1];

    for (int j=0; j<numPointsW; j++) {  // For all the pts in the ring
      normal(coorX[j]*multxz, coory, coorZ[j]*multxz);
      vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
      normal(coorX[j]*multxzPlus, cooryPlus, coorZ[j]*multxzPlus);
      vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
      u+=changeU;
    }
    v+=changeV;
    u=0;
  }
  endShape();
}

class bigclock {

  float clockSize;

  //float seconds = timeMs /1000;
  //float minutes = 60*seconds;
  //float hours = 60*minutes;
  
  //constructor
  void prime(float _clockSize) {
    clockSize = _clockSize;
  }

  void update() {
    pushMatrix();
    translate(width/2, height/2, 500);

    fill(20, 230, 255, 180);
    ellipse(0, 0, clockSize, clockSize);
  
    popMatrix();
  }
}

class earth {

  float earthSize;
  float earthRot = map(timeH, 0, 24, 0, 2*PI);
  float earthSpin = 0.1*millis();
  ;

  //constructor
  void prime(float _earthSize) {
    earthSize = _earthSize;
  }

  void update() {

    earthRot += earthSpin;

    pushMatrix();
    translate(width/2, height/2, 500);
    rotateY(radians(earthRot));
    //    ambientLight(10, 102, 150);
    //    ambient(51, 26, 100);
    textureSphere(earthSize, earthSize, earthSize, img);

    popMatrix();
  }
}

class sun {

  float sunSize;

  //constructor
  void prime(float _sunSize) {
    sunSize = _sunSize;
  }

  void update() {
    pushMatrix();
    translate(width/2, height/2, -200);
//    emissive(255, 200, 0);
    fill(255,220,90);
    sphere(sunSize);
    
//    filter(BLUR,10);
    fill(255,140,10,190);
    ellipse(0,0, 580,580);
    
    popMatrix();
  }
}



