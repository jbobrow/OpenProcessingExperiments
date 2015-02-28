
float[][] hm = new float[(int)pow(2, 8)][(int)pow(2, 8)];
float zoom = 2;
Maker[] Worm = new Maker[1];
float M = 6;
float wormTemp;

void setup() {
  for(int i = 0; i < Worm.length; i++) {
    Worm[i] = new Maker();
  }
  size(800, 600, P3D);
  noStroke();
  generateLandscape();
  for(float x = 0; x < hm.length; x++) {
      for(float y = 0; y < hm.length; y++) {
        hm[(int)x][(int)y] = random(-1, 1);
      }
  }
  colorMode(HSB);
}

void draw() {
  background(255);
  
  lights();
  scale(zoom);
  translate(width/2/zoom, height/2/zoom);
  rotateY(map(mouseX*4,0,width,-PI,PI));
  rotateX(map(mouseY*4,0,height,-PI,PI));
  paintLandscape();
  temGen();
}

void keyPressed() {
  generateLandscape();
}

void generateLandscape() {
  for(float x = 0; x < hm.length; x++) {
      for(float y = 0; y < hm.length; y++) {
        hm[(int)x][(int)y] = 0;
      }
  }
  for(int i = 0; i < 600; i++) {
    temGen();
  }
}

void temGen() {
  for(int i = 0; i < Worm.length; i++) {
    wormTemp = 0;
    for(int q = 0; q < Worm.length; q++) {
      wormTemp += Worm[q].wormTheta;
    }
    wormTemp /= Worm.length;
    Worm[i].wormTheta = (wormTemp+Worm[i].wormTheta*2)/3;
    Worm[i].x += sin(Worm[i].wormTheta)*10;
    Worm[i].y += cos(Worm[i].wormTheta)*10;
    Worm[i].wormTheta += Worm[i].wormThetaDelta;
    Worm[i].wormThetaDelta += random(-0.1, 0.1);
    Worm[i].wormThetaDelta /= 1.05;
    if(Worm[i].x>hm.length/2)
      Worm[i].x=-hm.length/2;
    if(Worm[i].x<-hm.length/2) 
      Worm[i].x=hm.length/2;
    if(Worm[i].y>hm.length/2)
      Worm[i].y=-hm.length/2;
    if(Worm[i].y<-hm.length/2)
      Worm[i].y=hm.length/2;
    for(float x = 0; x < hm.length; x++) {
      for(float y = 0; y < hm.length; y++) {
        hm[(int)x][(int)y] += sin(TWO_PI/(dist((x-hm.length/2)/M, (y-hm.length/2)/M, Worm[i].x/M, Worm[i].y/M)*dist((x-hm.length/2)/M, (y-hm.length/2)/M, Worm[i].x/M, Worm[i].y/M)))*4.5*sin(Worm[i].wormTheta);
      }
    }
    for(float x = 1; x < hm.length-1; x++) {
        for(float y = 1; y < hm.length-1; y++) {
          hm[(int)x][(int)y] = (hm[(int)x][(int)y]*2 + hm[(int)x+1][(int)y] + hm[(int)x-1][(int)y] + hm[(int)x][(int)y+1] + hm[(int)x][(int)y-1])/6;
        }
    }
  }
}

void paintLandscape() {
  for(float x = 3; x < hm.length-5; x++) {
    for(float y = 3; y < hm.length-5; y++) {
      fill(abs(4*hm[(int)x][(int)y]), 255, 255);
      beginShape(QUADS);
        vertex(x-hm.length/2, y-hm.length/2, hm[(int)x][(int)y]);
        vertex(x+1-hm.length/2, y-hm.length/2, hm[(int)x+1][(int)y]);
        vertex(x+1-hm.length/2, y+1-hm.length/2, hm[(int)x+1][(int)y+1]);
        vertex(x-hm.length/2, y+1-hm.length/2, hm[(int)x][(int)y+1]);
      endShape(CLOSE);
    }
  }
}

class Maker {
  float x;
  float y;
  float wormTheta;
  float wormThetaDelta;
}

