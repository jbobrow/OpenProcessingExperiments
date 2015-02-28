
int bulletOn;
int bulletX, bulletY;
int c;
int d;
int playerX, playerY;
PImage b;

void setup(){
  size(500,500);
  b = loadImage("bullet.png");
  frameRate(100000);
}

void draw(){
    background(123456);
    rect(0,250,210,5);
    //rect(270,250,230,5);
    //rect(125,100,230,5);
    //rect(125,400,230,5);
    //rect(60,
   //rect(60,
    //rect(440,
    //rect(440,
    rect(playerX,playerY,10,10);
     playerX=c+490; playerY=d+490;
  if (bulletOn==1) {
    image(b,bulletX,bulletY);
    if (bulletY<=0) bulletOn=0;
    if (inRect(0,250,210,5,bulletX,bulletY)==1) bulletOn=0;
    bulletY=bulletY-5;
  }
}

void mousePressed(){
  if (bulletOn==0){ //on create one bullet
  System.out.println(mouseX+" "+mouseY);
  bulletOn=1; bulletX=playerX; bulletY=playerY;
  }
}

void keyPressed() {
    if (key == 'w') {
      d=(d-10);
    }
    if (key == 's') {
      d=(d+10);
    }
     if (key == 'a') {
      c=(c-10); 
     }
     if (key == 'd') {
      c=(c+10);
     }
  
}

int inRect(int x, int y, int w, int h, int x1, int y1) {
  if (y1>=y && y1<=(y+h)) {
    if (x1>=x && x1<=(x+w)) {
      return 1;
    }
  }
  return 0;  //not in rectangle
}

