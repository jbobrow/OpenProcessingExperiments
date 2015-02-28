
int bulletOn;
int bulletX, bulletY;
int c;
int d;
int playerX, playerY;
int slopeX, slopeY;
int X, Y;
PImage b;
float slope;
void setup1(){
  size(500,500);
  b = loadImage("bullet.png");
  frameRate(100);
}

void draw1(){
    background(123456);
    rect(playerX,playerY,10,10);
    rect(0,250,210,5);
    rect(290,250,210,5);
    rect(125,100,230,5);
    rect(125,400,230,5);
    if (inRect(0,250,210,5,bulletX,bulletY)==1) bulletOn=0;
    if (inRect(290,250,210,5,bulletX,bulletY)==1) bulletOn=0;
    if (inRect(125,100,230,5,bulletX,bulletY)==1) bulletOn=0;
    if (inRect(125,400,230,5,bulletX,bulletY)==1) bulletOn=0;
    playerX=c; playerY=d;
  if (bulletOn==1) {
    bulletX=bulletX+slopeX;
    bulletY=bulletY+slopeY;
    image(b,bulletX,bulletY);
    if (bulletY<=0) bulletOn=0;
    if (bulletY>=height) bulletOn=0;
    if (bulletX<=0) bulletOn=0;
    if (bulletX>width) bulletOn=0;
  }
}

void mousePressed1(){
  if (bulletOn==0){ //on create one bullet
  bulletOn=1;
  slopeX=mouseX-playerX; slopeY=mouseY-playerY;
  slope=(float)slopeY/(float)slopeX;
  slopeX=slopeX/abs(slopeX)*10;
  slopeY=(int)(slope*slopeX+0.5);
  System.out.print(mouseX+" "+mouseY+" ");
  System.out.println(slopeX+" "+slopeY);
  bulletX=playerX;  bulletY=playerY;
  }
}

void keyPressed() {
    if (key == 'w') {
      if (inRect(0,0,500,0,c,d)==0)
      if (inRect(125,400,230,5,c,d-3)==0) { //if doesn't hiaddt rectangle, go up
      if (inRect(125,100,230,5,c,d-3)==0)
      if (inRect(290,250,210,5,c,d-3)==0)
      if (inRect(0,250,210,5,c,d-3)==0)
      d=(d-5);
        System.out.println(playerX+" "+playerY);
      }
    }
    if (key == 's') {
      if (inRect(0,500,500,0,c,d+10)==0)
      if (inRect(125,400,230,5,c,d+10)==0) { //if doesn't hit rectangle, go down
      if (inRect(125,100,230,5,c,d+10)==0)
      if (inRect(290,250,210,5,c,d+10)==0)
      if (inRect(0,250,210,5,c,d+10)==0)
      d=(d+5);
      System.out.println(playerX+" "+playerY);
      }
    }
     if (key == 'a') {
      if (inRect(0,0,0,500,c,d)==0)
      c=(c-5); 
        System.out.println(playerX+" "+playerY);
     }
     if (key == 'd') {
       if (inRect(500,0,0,500,c+10,d)==0)
      c=(c+5);
        System.out.println(playerX+" "+playerY);
     }
  
}

int inRect(int x, int y, int w, int h, int x1, int y1) {
  if (y1>=y && y1<=(y+h)) {
    if (x1>=x && x1<=(x+w)) {
      return 1; //in rectangle
    }
  }
  return 0;  //not in rectangle
}

