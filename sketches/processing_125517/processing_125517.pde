
// dream of spring:when real petals're turning into bubbles, the beautiful pink still remains
// Chang Kuo Ping from department of industrial design 
int numChildren=9; //how many branches within a level //orig=3
int maxLevels=4;  // how many levels  //orig=3
STAR shining;
PImage img;

void setup() {
  size(750, 500);
  background(0);
  noFill();
  newStar();
  frameRate(25);
  img=loadImage("moon.jpg");
}

void draw() {
  background(0);
  image(img,0,0);
  shining.updateMe(width/2, height/4);
  shining.drawMe();
}

void newStar() {
  shining=new STAR(1, 0, width/2, 50); //original 50
  shining.drawMe();
}


class STAR {
  float level, index;
  float x, y;
  float endx, endy;
  float radius1;
  float strokeW, alph1;
  float alph2;
  float len, lenChange;
  float rot, rotChange;
  STAR[] children = new STAR[0];

  STAR(float lev, float ind, float ex, float ey) {
    level=lev;
    index=ind;
    strokeW=(1/level)*10; //original number=100
    alph1=300/level;
    alph2=1/level;
    len=(1/level)*random(100);  //original is 1
    lenChange=random(20)-10;
    rotChange=random(10)-5;
    radius1=random(250);
    updateMe(ex, ey);

    if (level<maxLevels) {
      children= new STAR[numChildren]; //to check how many sub-objects within this array   
      for (int x=0;x<numChildren;x++) {
        children[x]=new STAR(level+1, x, endx, endy);  //each object means a new branch item
      }
    }
  }

  void updateMe(float nx, float ny) {
    x=nx;
    y=ny;
    rot+=rotChange;
    len-=lenChange;

    float radian=radians(rot);
    endx=x+(len*cos(radian)); //original no random
    endy=y+(len*sin(radian));  // original no random

    for (int i=0;i<children.length;i++) {  // change each branch's end position as variation
      children[i].updateMe(endx, endy);
    }
    // start to change alph
    boolean touching=false;
    for (int i=0;i<children.length;i++) {

      if (children[i]!=this) {
        float dis =dist(endx, endy, children[i].endx, children[i].endy);
        if ((dis-this.len/6-children[6].len/6)<0) {
          touching=true;
        }
      }
    }
    if (touching) {
      if (alph1>0) {
        alph1+=2;
        
      }
    }
    else {
      if (alph1<255) {
        alph1=alph1-1;
        alph2+=0.8;
      }
    }
    //stop changing alph;
  }

  void drawMe() {
    float midx=((x+endx)/2);
    float midy=((y+endy)/2);

    noFill();
    strokeWeight(2*strokeW); 
    stroke(255, alph2);
    ellipse(midx, midy, radius1, radius1);

    noStroke();
    fill(200,100,100, alph1);
    ellipse(endx, endy, len/5, len/5); //original=len/6

    for (int i=0;i<children.length;i++) {
      children[i].drawMe();
    }
    
  }
}



