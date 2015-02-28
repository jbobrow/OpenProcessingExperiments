
int datascale = 160;
int ddivt = datascale / 2;
float[][] data = new float [datascale][datascale];
float incrementation = 0.015;
int dataheight = 190;
int g;
int p;
float fram;
float z = 0.9;
float zoff = 3;
boolean stop;
boolean lnon;
float framspeed = 0.01;
boolean keyprevpressed;
boolean mouseprevpressed;
boolean hisb = true;
void setup() {
  background(0);
  stroke(255);
  strokeWeight(1);
  size(600, 500, P3D);
}
void draw() {
  lights();
  if(stop==false) {
    fram += framspeed;
  }
  scale(z);
  translate(width/2/z, height/2/z);
  rotateY(map(mouseX,0,width,-PI,PI));
  rotateX(map(mouseY,0,height,-PI,PI));
  if(keyPressed) {
      if(key=='a') {
        g += 4;
      }else if(key == 'd') {
        g -= 4;
      }else if(key == 'w') {
        p += 4;
      }else if(key == 's') {
        p -= 4;
      }else if(key == 'z') {
        z += 0.02;
      }else if(key == 'x') {
        z -= 0.02;
      }else if(key == 'c') {
        incrementation += 0.002;
      }else if(key == 'v') {
        incrementation -= 0.002;
      }else if(key == 'b') {
        zoff += 0.05;
      }else if(key == 'n') {
        zoff -= 0.05;
      }else if(key == 'r') {
        incrementation = 0.015;
        dataheight = 190;
        g = 0;
        p = 0;
        fram = 0;
        z = 0.9;
        zoff = 3;
        lnon = false;
        framspeed = 0.01;
        hisb = true;
      }else if(key == 'o') {
        framspeed += 0.001;
      }else if(key == 'p') {
        framspeed -= 0.001;
      }else if(key == 'y') {
        saveFrame("output.png");
    }
    if(keyprevpressed != true) {
          if(key == 'l') {
            lnon = !lnon;
          }else if(key == 'h') {
            hisb = !hisb;
          }
        }
    keyprevpressed = true;
  }else{
    keyprevpressed = false;
  }
  if(mousePressed) {
    if(mouseprevpressed != true) {
      stop = !stop;
    }
    mouseprevpressed = true;
  }else{
    mouseprevpressed = false;
  }
    for(int i = 0; i < datascale; i++) {
      for(int j = 0; j < datascale; j++) {
        data[i][j] = 2 * noise((i+g)*incrementation/4+52, (j+p)*incrementation/4+35, fram/4) + (noise((i+g)*incrementation, (j+p)*incrementation + pow(noise((i+g)*incrementation, (j+p)*incrementation, fram)*2, 2), fram+zoff)) * dataheight;
      }
    }
  background(0);
  for(int i = 1; i < datascale-1; i++) {
    for(int j = 1; j < datascale-1; j++) {
      if(hisb == true) {
        colorMode(HSB);
        fill((data[i][j]*2)-30, 255, 255);
        stroke((data[i][j]*2)-30, 255, 255);
      }else{
        colorMode(RGB);
        stroke(data[i][j], data[i][j]*2-90, (1.5*data[i][j])+20);
        fill(data[i][j], data[i][j]*2-90, (1.5*data[i][j])+20);
      }
      if(lnon == true) {
        line((i-ddivt)*2, (j-ddivt)*2, data[i][j], (i-1-ddivt)*2, (j-1-ddivt)*2, data[i-1][j-1]);
        line((i-ddivt)*2, (j-ddivt)*2, data[i][j], (i-1-ddivt)*2, (j+1-ddivt)*2, data[i-1][j+1]);
      }else{
        noStroke();
        beginShape(TRIANGLE_STRIP);
          vertex((i-ddivt)*2, (j-ddivt)*2, data[i][j]);
          vertex((i-ddivt)*2, (j+1-ddivt)*2, data[i][j+1]);
          vertex((i+1-ddivt)*2, (j-ddivt)*2, data[i+1][j]);
          vertex((i+1-ddivt)*2, (j+1-ddivt)*2, data[i+1][j+1]);
        endShape(CLOSE);
      }
    }
  }
}

