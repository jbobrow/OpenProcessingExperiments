
//Variables 
int total = 20;
float sz = 10;
float[] posX = new float[total];
float[] posY = new float[total];
float[] velX = new float[total];
float[] velY = new float[total];
PImage foto;
 
void setup() {
  size (300, 300);
  foto = loadImage("images.jpg");

  for (int i=0; i<total; i++) {
    posX[i]= random (width);
    posY[i]= random (height);
    velX[i]= random (-5, 5);
    velY[i]= random (-5, 5);
  }
}

void draw() {
  image(foto, 0, 0);

  for (int i= 0; i< posX.length; i++ ) {
    posX[i] = posX [i] + velX[i];
    posY[i] = posY [i] + velY[i];
 
    if ((posX [i] >= width)||(posX [i] <= 0)) {
      velX [i] = -velX[i];
    }
    if ((posY [i] >= height)||(posY [i] <= 0)) {
      velY[i] = -velY[i];
    }
   
    if ((posX [i] >= height/5)||(posX [i] <= 0)) {
       fill(random(0,255));
    }
    noStroke();
    smooth();
    ellipse(posX[i], posY[i], sz, sz);
  }
}
void mousePressed() {
  for (int i=0; i<total; i++) {
    posX[i] = mouseX;
    posY[i] = mouseY;
  }
}


  


