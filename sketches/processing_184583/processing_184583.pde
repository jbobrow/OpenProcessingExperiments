
// VARIABLES Y MATRICES
 
int total = 80;
float[] posx = new float[total];
float[] posy = new float[total];
float[] velx = new float[total];
float[] vely = new float[total];
float[] sz = new float[total];

 
 
void setup() {

  size (600, 500);
  for (int i=0; i<total; i++) {
    sz[i] = 20;
    posx[i] = random(sz[i], width-sz[i]);
    posy[i] = random(sz[i], height-sz[i]);
    velx[i] = random(0,5);
    vely[i] = random(-10,5);
  }
}

void draw() {
  background(67,66,66);
  noStroke();
 
  for (int i=0; i<total; i++) {
 
 
    posx[i] += velx[i];
    posy[i] += vely[i];
 
 //DECISIONES
    if (posx[i]<0+sz[i] || posx[i]>width-sz[i]) {
      velx[i] = -velx[i];
      sz[i]--;
    }
    if (posy[i]<0+sz[i] || posy[i]>height-sz[i]) {
      vely[i] = -vely[i];
      sz[i]--;
    }
  
    fill(255, random(255), random(255));
    ellipse(posx[i], posy[i], random(sz[i]), random(sz[i]));
  }

}
 
void mousePressed() {
  for (int i=0; i<total; i++) {
    posx[i] = mouseX-2;
    posy[i] = mouseY+2;
    sz[i] = random(-30,40);
   
  }
}

