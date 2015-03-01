
int val = 5;
float vel= 6;
int posX, posY, velX, velY;


void setup() {
 // frameRate(5);
  size(300, 250);
  velX = 8;
  velY = 8;
  posX = width/2;
  posY = height/2;
}

void draw() {
  background(0);
  
  posX = posX+velX;
    posY = posY+velY;
   if ((posX<0)||(posX>width)) {
      velX = -velX;
    } 

    if ((posY<0)||(posY>height)) {
      velY = -velY;
    }

  for (int i=0; i<300; i=i+val) {
    
    stroke(255, 255, 0);
    line(posX, posY, 300, i);
    line(posX, posY, i, 300);
    line(0,i, posX, posY);
    line(i,0, posX, posY);

 
  }
}



