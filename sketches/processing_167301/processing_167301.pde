
int scene=1;

// #1. BULB
PImage bulb;

int RectRot=0, BulbX=0, BulbY=0, watt=0;
float bagR=255, bagG=255, bagB=255;
String BulbTxt;

// #2. IDEA MACHINE
PImage siluet;
float[] br=new float[50];
int[] bx=new int[50];
int[] by=new int[50];
int[] bz=new int[50];
int i=0, j=0, k=0;

float rSpeed=30;

boolean sw=false;
int CirX=435, CirY=448, CirXD=6, CirYD=7;

float x1=0, y1=0, z1=1, rot=0, brightness=1;
int Tx, Ty, Tz, num1=0, num2=0;
tri[] Tri=new tri[84];
float cosine;

float dotProduct(float X1, float Y1, float Z1, float X2, float Y2, float Z2) {
  //[x1 y1 z1] dot [x2 y2 z2]
  return X1*X2+Y1*Y2+Z1*Z2;
}

class tri {
  int R, G, B, Trans;
  float angle=0;

  float nX=0, nY=0, nZ=1; // normal vector

  tri(int r, int g, int b) {
    R=r;
    G=g;
    B=b;
    //Trans=trans;
  }

  void triDraw(float triX, float triY, float triZ, float Angle) {
    x1=triX;
    y1=triY;
    z1=triZ;
    angle=Angle;

    //compute light vector
    float lX=rot*20;//-Lx; //light vector
    float lY=rot*20;//-Ly; //light vector
    float lZ=100; //light vector
    println("Degree: "+rot);

    //normalize light vector
    float lMag=sqrt(lX*lX+lY*lY+lZ*lZ);
    lX/=lMag;
    lY/=lMag;
    lZ/=lMag;

    //compute dot product and cosine angle
    cosine = dotProduct(nX, nY, nZ, lX, lY, lZ);

    noStroke();
    fill(cosine*255, G, B);

    if (y1%100==50) {
      pushMatrix();
      translate(x1+25, y1, z1);
      rotateY(angle);
      beginShape();
      vertex(25, 0, 0);
      vertex(0, 50, 0);
      vertex(50, 50, 0);
      endShape();
      popMatrix();
    } else if (y1%100==0) {
      pushMatrix();
      translate(x1, y1, z1);
      rotateY(angle);
      beginShape();
      vertex(0, 0, 0);
      vertex(-25, 50, 0);
      vertex(25, 50, 0);
      endShape();
      popMatrix();
    }
  }
}

IdeaBubble[] b=new IdeaBubble[50];// = new IdeaBubble(30, 300, 300, 0); 

class IdeaBubble {
  float delta = 30;
  float r;// = 100;
  float x2, y2, z2;
  int constant=300;
  float angle=0.05;
  int scalar=300;
  float speed=0.05;
  float rot=0;
  float x1, y1, z1;
  float x=constant+sin(angle)*scalar;
  float y=constant+cos(angle)*scalar;

  IdeaBubble(float Br, int Bx, int By, int Bz) {
    r=Br;
    x1=Bx;
    y1=By;
    z1=Bz;
  }

  void BUpdate() {
    pushMatrix();
    translate(x1, y1, z1);
    rotateX(30);

    for (float deg=0; deg<360; deg += delta) {
      float theta = radians(deg);

      for (float deg2 = 0; deg2 < 360; deg2 += delta) {     
        float phi = radians(deg2);
        float x2 = r * sin(phi) * cos(theta);
        float y2 = r * sin(phi) * sin(theta);
        float z2 = r * cos(phi);
        drawSphere(5, x2, y2, z2);
      }
    }

    lights();
    directionalLight(255, 0, 0, 1, 1, 0);
    popMatrix();
  }

  void drawSphere(float r, float X, float Y, float Z) {
    for (float deg=0; deg<360; deg += delta)
    {
      float theta = radians(deg);

      for (float deg2 = 0; deg2 < 360; deg2 += delta) {     
        float phi = radians(deg2);
        float x = r * sin(phi) * cos(theta);
        float y = r * sin(phi) * sin(theta);
        float z = r * cos(phi);
        point(x+X, y+Y, z+Z);
        float clrR=random(255);
        float clrG=random(255);
        float clrB=random(255);
        stroke(clrR, clrG, clrB);
      }
    }
  }
}

// #3. SELFPORTRAIT BUBBLE
PImage me;
int SmallPixel, BigPixel;
String Porttxt="";
int timenow=0, timetmp=0;

void setup() {
  size(600, 600, P3D);
  background(255);
  frameRate(30);

  //#1. BULB
  bulb=loadImage("bulb.png");

  //#2. IDEA MACHINE
  siluet=loadImage("siluet.png");
  for (num1=0; num1<84; num1++) {
    Tri[num1]=new tri(255, 0, 0);
  }

  //#3. SELFPORTRAIT BUBBLE
  me=loadImage("selfie.jpg");
  SmallPixel = 2;
  BigPixel = 5;
}

void draw() {
  if (scene==1) {
    bulb();
  }

  if (scene==2) {
    idea_machine();
  }

  if (scene==3) {
    selfportrait_bubble();
  }

  if (frameCount%60==0) { //Timer
    timenow+=1;
  }
}

// #1. BULB
void bulb() {
  if (scene==1) {
    background(255);
    if (watt>=6000) {
      tint(255, 255, 130);
      background(255, 255, 220);
    }
    image(bulb, 200, 100);

    pushMatrix();
    translate(width/2, height/2+100, 0);
    fill(255, 255, 255);

    if (mousePressed==true) {
      if (watt<6000) {
        bagR=random(255);
        bagG=random(255);
        bagB=random(255);
        background(bagR, bagG, bagB, 10);
        watt=watt+20;
        for (int i=0; i<=10; i++) {
          rotateY(radians(RectRot));
          rect(BulbX, BulbY, 50, 50);
        }
        RectRot+=(TWO_PI*3)/5;
      }
    }

    textSize(20);
    stroke(5);
    fill(0, 0, 255);
    if (watt<6000) {
      rotateY(0);
      BulbTxt="Please click to start electric generator.";
    } else if (watt>=6000) {
      rotateY(0);
      BulbTxt="Good Job!  Press 'Space'";
    }

    rotateY(0);
    text(BulbTxt, -180, 130, 0);
    fill(255, 0, 0);
    text("Watt: "+watt+"mW", 130, -350);
    popMatrix();

    if (keyCode==32) { //Space Bar
      println("Space Bar! scene=2");
      keyCode=0;
      scene=2;
    }
  }
}

// #2. IDEA MACHINE
void idea_machine() {
  if (scene==2) {
    background(255, 255, 220);
    tint(255);
    image(siluet, 320, 380);
    println("rSpeed: "+rSpeed);

    if (mousePressed==true) {
      if (rSpeed>1) {
        rSpeed-=1;
      }
      
      timenow=0; // initialize timer
      
      br[0] = random(1, 35);
      b[0] = new IdeaBubble(br[0], 379, 412, 0);
      b[0].BUpdate();

      // Crazy 3D Triangles (use light vector)
      for (Ty=0; Ty<=600; Ty+=50) {
        if (Ty<350) {
          for (Tx=0; Tx<=600; Tx+=100) {
            Tri[num2].triDraw(Tx, Ty, Tz, rot);
            num2++;
          }
        } else if (Ty>=350) {
          for (Tx=0; Tx<=250; Tx+=100) {
            Tri[num2].triDraw(Tx, Ty, Tz, rot);
            num2++;
          }
          num2=0;
        }
      }

      if (rSpeed<=4) {
        rSpeed=4;
      }

      rot+=PI/rSpeed;

      if (rot>=TWO_PI) {
        rot=0;
      }

      //Shoot Gun 
      if (sw==false){
        CirX=435;
        CirY=450;
        CirXD=7;
        CirYD=7;
        sw=true;
      }
      if (sw==true){
        if (CirX<500){
          CirX+=10;
          CirY-=7;
        }
        if (CirX>=500){
          if (CirXD>=65){
            Porttxt="Idea!";
          }
          if (CirXD<80){
            CirXD+=5;
            CirYD+=5;
          } else{
            CirX=435;
            CirY=450;
            CirXD=7;
            CirYD=7;
            Porttxt="";
          }
        }
      }
      
      noStroke();
      fill(0, 0, 0);
      ellipse(CirX, CirY, CirXD, CirYD);

    } else {
      rSpeed=30;
      CirX=605;
      CirY=605;
      CirXD=7;
      CirYD=7;
      sw=false;
    }
    
     textSize(20);
     fill(255, 255, 255);
     text(Porttxt, CirX-23, CirY+7);
     println("text ok");
     println("Timer: "+timenow);
    
    
    if (keyCode==32) { //Space Bar
      println("Space Bar! scene=3");
      scene=3;
      background(255);
    }
  }
}


// #3. SELFPORTRAIT MOSAIC
void selfportrait_bubble() {
  if (scene==3) {
    background(255);
    for (i=0; i<20000; i++) {
      float PixelSize = map(mouseX, 0, width, SmallPixel, BigPixel);
      int pX = int(random(me.width));
      int pY = int(random(me.height));
      color pix = me.get(pX, pY);
      fill(pix, 128);
      noStroke();
      pushMatrix();
      translate(pX, pY, 0);
      box(PixelSize);
      popMatrix();
    }
    text("Min-Woo, Choo", width/2, height/2);
    camera(mouseX, mouseY, width/2, width/2, height/2, 0, 0, 1, 0);
  }
}


