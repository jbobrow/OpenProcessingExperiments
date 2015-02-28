
//Copyright Eric Mackie, October 2011, Pittsburgh PA
// CMU: Computing in the Arts with Processing - 60-257 with Jim Roberts
float w;
float h;
float w2;
float w4;
float h2;
float h4;
float h8;
float wSizeBall;
float hSizeBall;

void setup() {
  size(450, 450, P3D);
  noStroke();
  w=width;
  w2=width/2;
  w4=width/4;
  h=height;
  h2=height/2;
  h4 = height/4;
  h8 = height/8;
  wSizeBall=width/35;
  hSizeBall=height/35;
}

void draw() {
  background(5,5,20);
  lighting();
  topSpheres();
  bottomSpheres();
  middleSpheres();
  connectSpheres();
}


void lighting() {
  directionalLight(160, 180, 40, 0, 1, 1);
  directionalLight(160, 180, 40, 0, -1, 1);
}

void topSpheres() {

  for (float i=.025; i<=3.2;i+=i) {
    pushMatrix();
    float xPos = w2+w4*(cos(radians(i*millis())));
    float yPos = h8+.5*h8*(cos(radians(2*i*millis())));
    translate(xPos, yPos, 0);
    sphere(wSizeBall+hSizeBall);
    popMatrix();
  }
}

void bottomSpheres() {
  for (float i=.025; i<=3.2;i+=i) {
    pushMatrix();
    float xPos = w2+w4*(cos(radians(i*millis())));
    float yPos = 7*h8-.5*h8*(cos(radians(2*i*millis())));
    translate(xPos, yPos, 0);
    sphere(wSizeBall+hSizeBall);
    popMatrix();
  }
}

void middleSpheres() {
  for (int i=2; i<7; i++) {
    pushMatrix();
    float xPos=w4+2*wSizeBall*i;
    float yPos=h2;  
    float zPos=0+30*(cos(radians(.5*millis()+25*i)));
    translate(xPos, yPos, zPos);
    sphere(wSizeBall+hSizeBall);
    popMatrix();
  }
}

void connectSpheres() {
  //======TOP Diagonol
  for(int i=0; i<3; i++){
  float zPos=0+30*(cos(radians(.5*millis()+25*i)));
  pushMatrix();
    translate(w4+wSizeBall*i,3*h8+hSizeBall*i,zPos);
    sphere(.5*wSizeBall+.5*hSizeBall);
  popMatrix();
  }
  
  
  //=====BOTTOM Diagonal
   for(int i=0; i<3; i++){
  float zPos=0+30*(cos(radians(.5*millis()+25*i)));
  pushMatrix();
    translate(w4+wSizeBall*i,5*h8-hSizeBall*i,zPos);
    sphere(.5*wSizeBall+.5*hSizeBall);
  popMatrix();
  }
  
  
}




