
// a program written for learning purposes

void setup() {
  size(640, 360, P3D); 
  background(0);
  frameRate(10);
}

void draw() {
  background(#FF66CC);
  lights();
  for (int i=0; i <= 32; i++) {
    for (int c=0; c < 20; c++) {     
      int plusz=0;
      int forgat=0;
      float tav=dist(i,c,int(mouseX/20),int((height-mouseY)/20));
      if (tav < 10) { 
        //plusz=int((11-tav)*4);
        forgat=int((11-tav)*3);
      }
      fill(255);
      lemez(i*23,360-plusz,-c*23,forgat);  
    } 
  }
}

void lemez (int x,int y,int z, int forgat) {
  pushMatrix();
  translate(x,y,z);

  rotateX(radians(random(forgat)));
  rotateY(radians(random(forgat)));
  rotateZ(radians(random(forgat)));

  scale(10);
  beginShape(QUADS);
  vertex(-1,  0,  -1);
  vertex(- 1,  0, 1);
  vertex( 1, 0,  1);
  vertex(1, 0,  - 1);
  endShape();
  popMatrix();
}

