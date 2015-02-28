

int z = 0;
int maxrow = 20;
int boxSize = 10;
int gridSize = maxrow * boxSize;
float noiseStep = 0.01;
float c = 0.0;
void setup() {
  size(400,400,P3D);
  noStroke();
}

void draw() {
  background(0);
    lights();
      if (mousePressed == true) {
    z = mouseY;
  }

  translate(width/2,height/2,z);
  rotateX(map(mouseY,0,width,0,TWO_PI));
  rotateY(map(mouseX,0,width,0,TWO_PI));
  pushMatrix();
  translate(-(gridSize/2),-(gridSize/2),0);
  c += 0.1;
  for (int i = 0; i<maxrow; i++) {
    for (int j = 0; j<maxrow; j++) {
     pushMatrix();
     float n = noise(map(i+c,0,maxrow,-1,1),map(j,0,maxrow,-1,1))*boxSize*10;
     translate(0,0,n/2);
     // box(boxSize,boxSize,noise(map(i,0,maxrow,0,1),map(j,0,maxrow,0,1),c)*boxSize*(boxSize/2));
     fill(n);
      box(boxSize,boxSize,n);
      popMatrix();
      translate(boxSize,0,0);
    }
    translate(-(boxSize)*maxrow,boxSize,0);
  }
  popMatrix();
}


