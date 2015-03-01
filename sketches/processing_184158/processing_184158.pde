
float midaG = 50;
int numGats = 60;
float[] gatoRandom = new float[numGats];
float[] posicioX = new float[numGats];
float[] posicioY = new float[numGats];
float[] velocitatX = new float[numGats];
float[] velocitatY = new float[numGats];
PImage[] imagesCats = new PImage[3]; //image array
PImage cat1;
PImage cat2;
PImage cat3;
PImage camp;

void setup() {
  size(600, 400);
  imageMode(CENTER);
  cat1 = loadImage ("0.png");
  cat2 = loadImage ("1.png");
  cat3 = loadImage ("2.png");
  camp = loadImage ("fons.jpg");
  imagesCats[0] = cat1;
  imagesCats[1] = cat2;
  imagesCats[2] = cat3;
  
  for (int i = 0; i<numGats; i++) {
    posicioX[i] = width/2;
    posicioY[i] = height/2;
    velocitatX[i] = random(1, 4);
    velocitatY[i] = random(1, 4);
    gatoRandom[i] = random(3);
  }
}

void draw() {
  background(0);
  image(camp,width-midaG,height-midaG);
  for (int i = 0; i<numGats; i++) {
    posicioX[i] += velocitatX[i];
    posicioY[i] += velocitatY[i];
    if ((posicioX [i] -midaG/2 <= 0)||(posicioX [i] +midaG/2 >= width)) {
      velocitatX[i] = -velocitatX[i];
    }
    if ((posicioY [i] -midaG/2 <= 0)||(posicioY [i] +midaG/2 >= height)) {
      velocitatY[i] = -velocitatY[i];
    }
    image(imagesCats[int(gatoRandom[i])], posicioX[i], posicioY[i]);
    //image(imagesCats[int(random(imagesCats.length))], posicioX[i], posicioY[i]);
    cat1.resize(40, 50);
    cat2.resize(40, 50);
    cat3.resize(40, 50);
      }
}
void mousePressed() {
  for (int i = 0; i<numGats; i++) {
    velocitatX[i] = random(-5, 5);
    velocitatY[i] = random(-5, 5);
  }
}


