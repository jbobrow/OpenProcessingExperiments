
int tamano = 10;
int bolas = 25;
PImage florindafondo;

float[] posX = new float [bolas];
float[] posY = new float [bolas];
float[] velX = new float [bolas];
float[] velY = new float [bolas];

void setup() {

  size(600, 600);
  florindafondo =loadImage("florindafondo.png");
  imageMode(CENTER); //para que el punto de referencia sea el centro


  for (int i = 0; i<bolas; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random(0, 12);
    velY[i] = random(0, 12);
  }
}
void draw() {
  background(255);

  for (int i = 0; i<bolas; i++) {
    posX[i] += velX[i];
    posY[i] += velY[i];


    if ((posX[i]<tamano/2)||(posX[i]>width-tamano/2)) {
      velX[i] = -velX[i];
    }

    if ((posY[i]<tamano/2)||(posY[i]>height-tamano/2)) {
      velY[i] = -velY[i];
    }
  }

  for (int i = 0; i<bolas; i++) {
    fill(0, 0, random(200, 255));
    ellipse(posX[i], posY[i], tamano, tamano);
  }
}
void mousePressed() {
  image (florindafondo, mouseX, mouseY);
  for(int i = 0; i<bolas; i++){
    velX[i] += 5;
    velY[i] += 5;
  }
}
void mouseClicked() {
image (florindafondo, mouseX, mouseY);
}
void mouseDragged(){
image (florindafondo, mouseX, mouseY);
}












