
//import processing.opengl.*;



PGraphics pg;

float pos[][] = new float[2][9];
float radios[] = new float[27];

void setup() {
  size(600, 600, P3D);
  pos[0][0] = -1;
  pos[1][0] = -1;
  pos[0][1] = 0;
  pos[1][1] = -1;
  pos[0][2] = 1;
  pos[1][2] = -1;
  pos[0][3] = -1;
  pos[1][3] =  0;
  pos[0][4] = 0;
  pos[1][4] = 0;
  pos[0][5] = 1;
  pos[1][5] = 0;
  pos[0][6] = -1;
  pos[1][6] = 1;
  pos[0][7] = 0;
  pos[1][7] = 1;
  pos[0][8] = 1;
  pos[1][8] = 1;
  pg = createGraphics(width, height, P3D);
  strokeWeight(2);
 
  for (int i=0; i<27; i++) {
    radios[i] = random(50, 100);
  }

}

float r = 255;
float g = 0;
float b = 0;

float rT = 0;
float gT = 255;
float bT = 0;

void draw() {
  pg.beginDraw();
  pg.background(255);
  


 // pg.noStroke();
 
  pg.lights();
  r+=(rT - r)*.2;
  g+=(gT - g)*.2;
  b+=(bT - b)*.2;

  for (int i=0; i<27; i++) {
    radios[i] += (100-radios[i])*.05;
  }

  pg.fill(r, g, b);
  pg.translate(width/2, height/2);
  pg.rotateX(map(mouseX, 0, width, 0, TWO_PI));
  pg.rotateY(map(mouseY, 0, height, 0, TWO_PI));
  pg.translate(0, 0, -200);
  int kk=0;
  for (int j=0; j<3; j++) {

    for (int i=0; i<9; i++) {
      pg.pushMatrix();
      pg.translate(pos[0][i]*100, pos[1][i]*100, 100);
      if (random(0, 100)<5) {
        radios[kk] = random(50, 100);
      }
      pg.box(radios[kk++]);
      pg.popMatrix();
    }
    pg.translate(0, 0, 100);
  }




  pg.endDraw();
  image(pg, 1, 1); 
}



