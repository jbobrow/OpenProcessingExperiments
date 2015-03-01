
// Variables globals

int total = 25;
float[] posx = new float[total];
float[] posy = new float[total];
float[] velx = new float[total];
float[] vely = new float[total];
float[] sz = new float[total];
float r;


void setup() {
  size (500, 500);
  smooth();
  for (int i=0; i<total; i++) {
    sz[i] = 30;
    posx[i] = random(sz[i]/2, width-sz[i]/2);
    posy[i] = random(sz[i]/2, height-sz[i]/2);
    velx[i] = random(-4, 4);
    vely[i] = random(-4, 4);
  }
}
void draw() { 
  background(0);

  for (int i=0; i<total; i++) {


    posx[i] += velx[i];
    posy[i] += vely[i];

    if (posx[i]<0+sz[i]/2 || posx[i]>width-sz[i]/2) {
      velx[i] = -velx[i];
      sz[i]--;
    }
    if (posy[i]<0+sz[i]/2 || posy[i]>height-sz[i]/2) {
      vely[i] = -vely[i];
      sz[i]--;
    }
    colorMode(HSB);
    float co = noise(i/10, r);
    fill(co*255, 175, 150);
    ellipse(posx[i], posy[i], sz[i], sz[i]);
  }
  r+=0.005;
}

void mousePressed() {
  for (int i=0; i<total; i++) {
    posx[i] = mouseX;
    posy[i] = mouseY;
    sz[i] = 30;
  }
}

