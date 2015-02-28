
//import processing.opengl.*;

float pos1[ ];
float pos2[ ];
float velx[ ];
float vely[ ];
float col[ ];
int q = 2000;
void setup() {
  size(800, 400);
  background(0);
  smooth();

  velx = new float[q];
  vely = new float[q];
  pos1= new float[q];
  pos2= new float[q];
  col = new float[q];

  for (int i=0;i<q;i++) {

    pos1[i]= random(width);
    pos2[i]= random(height);
    col[i]= random(255);
  }
}

void draw() {
  strokeWeight(0.75);
  for (int i=0;i<q;i++) {
    velx[i] = random(-2, 2);
    vely[i] = random(-2, 2);
    stroke(col[i]);
    point(pos1[i], pos2[i]);
    pos1[i]+=random(velx[i]);
    pos2[i]+=random(vely[i]);

    if ((pos1[i] >= width) || (pos1[i] <= 0)) {
      pos1[i] = random(width);
    }
    if ((pos2[i] >= height) || (pos2[i] <= 0)) {
      pos2[i] = random(height);
    }
  }
}


