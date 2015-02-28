
int bulletOn;
int bulletX, bulletY;
PImage b;

void setup() {
  size(500,500);  
  b = loadImage("bullet-bill.jpg");
}

void draw() {
  background(0xffffffff);
  if (bulletOn==1) {
    //fill(255,0,0);
    //rect(bulletX, bulletY,10,10);
    image(b, bulletX, bulletY);
    bulletY=bulletY+10;
    if (bulletY>=height) bulletY=0;
  }
}

void mousePressed() {
  if (bulletOn==0) { //only create 1 bullet  
    System.out.println(mouseX+" "+mouseY);
    bulletOn=1;  bulletX=mouseX; bulletY=0;
  }
}

