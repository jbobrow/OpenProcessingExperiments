
PImage cielo;
int cant = 25;
float sz = 10;
float [] posX = new float[cant];
float [] posY = new float[cant];
float [] velX = new float[cant];
float [] velY = new float[cant];



  
  
  
void setup() {
  size (600,600);
 cielo = loadImage ("japon.jpg");
  background(0);
  image (cielo,0,0);
  
  
  
  noStroke();
  
    for (int i=0; i<cant; i++) {
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i]= random(-5, 0);
    velY[i]= random(-5, 0);
  }
}
 

void draw() {
  fill(mouseX,mouseY,0,random(50,100));

  
   for (int i=0; i<cant; i++) {
    posX[i] = posX[i] + velX[i];
    posY[i] = posY[i] + velY[i];
 
    noStroke();
    ellipse(posX[i], posY[i], sz, sz);
    
    if ((posX[i] > width)||(posX[i] < 0)) {
      velX[i] = -velX[i];
    }
 
    if ((posY[i] > height)||(posY[i] < 0)) {
      velY[i] = -velY[i];
   }
   
}
}

void mousePressed() {
  image (cielo,0,0);

  
for (int i=0; i<cant; i++) {
  posX[i]=mouseX;
  posY[i]=mouseY;
 
}

}


