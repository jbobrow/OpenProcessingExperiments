
int scene=1, timenow=1;
String Porttxt="";

// #2. IDEA MACHINE
PImage me;
PImage bg;
float[] br=new float[50];
int[] bx=new int[50];
int[] by=new int[50];
int[] bz=new int[50];
int i=0, j=0, k=0;

float rSpeed=30;

boolean sw=false;
int CirX=435, CirY=450, CirXD=7, CirYD=7;

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
    fill(cosine*255, cosine*255, B);

    if (y1%100==50) {
      pushMatrix();
      translate(x1+75, y1+50, z1);
      rotateY(angle);
      beginShape();
      //vertex(25, 0, 0);
      //vertex(0, 50, 0);
      //vertex(50, 50, 0);
      vertex(0+25, -25);
      vertex(7+25, -10);
      vertex(23.5+25, -7.5);
      vertex(11.5+25, 3.5);
      vertex(14.5+25, 20);
      vertex(0+25, 12.5);
      vertex(-14.5+25, 20);
      vertex(-11.5+25, 3.5);
      vertex(-23.5+25, -7.5);
      vertex(-7+25, -10);
      endShape(CLOSE);
      popMatrix();
    } else if (y1%100==0) {
      pushMatrix();
      translate(x1+50, y1+50, z1);
      rotateY(angle);
      beginShape();
      //vertex(0, 0, 0);
      //vertex(-25, 50, 0);
      //vertex(25, 50, 0);
      vertex(0, -25);
      vertex(7, -10);
      vertex(23.5, -7.5);
      vertex(11.5, 3.5);
      vertex(14.5, 20);
      vertex(0, 12.5);
      vertex(-14.5, 20);
      vertex(-11.5, 3.5);
      vertex(-23.5, -7.5);
      vertex(-7, -10);
      endShape(CLOSE);
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

  IdeaBubble() {//(float Br, float Bx, float By, float Bz) {
    //r=Br;
    //x1=Bx;
    //y1=By;
    //z1=Bz;
  }

  void Bubble(float Br, float Bx, float By, float Bz) {
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

void setup() {
  size(600, 600, P3D);
  background(255);
  frameRate(30);

  //#2. IDEA MACHINE
  bg=loadImage("bg.jpg");
  me=loadImage("me.png");
  for (num1=0; num1<84; num1++) {
    Tri[num1]=new tri(255, 255, 0);
  }

  for (num1=0; num1<50; num1++) {
    b[num1]=new IdeaBubble();
    br[num1]=1;
    bubX[num1]=random(30, width-30);
    bubY[num1]=random(30, 200);
  }
}

void draw() {
  idea_machine();


  if (frameCount%30==0) { //Timer
    timenow+=1;
  }
}

int BubNum=1;
float[] bubX=new float[50];
float[] bubY=new float[50];

int Hx=50;
int Hy=540;
boolean Ht=false;

// #2. IDEA MACHINE
void idea_machine() {
  //if (scene==2) {
  background(255, 255, 220);
  tint(255);
  image(bg, 0, 0);
  image(me, 0, 358);
  println("rSpeed: "+rSpeed);

  if (mousePressed==true) {
    if (rSpeed>1) {
      rSpeed-=1;
    }

    timenow=0; // initialize timer

    if (BubNum==49) {
      BubNum=1;
    }
    
    // Heart Beat (use Sphere)
    Ht=!Ht;
    if (Ht==true) {
      noStroke();
      fill(255, 0, 0);
      beginShape();
      vertex((50+Hx), (15+Hy));
      bezierVertex((50+Hx), (-5+Hy), (90+Hx), (5+Hy), (50+Hx), (40+Hy));
      vertex((50+Hx), (15+Hy));
      bezierVertex((50+Hx), (-5+Hy), (10+Hx), (5+Hy), (50+Hx), (40+Hy));
      endShape();
    }
    
    // 3D Stars (use light vector)
    for (Ty=0; Ty<=600; Ty+=50) {
      if (Ty<200) {
        for (Tx=0; Tx<=500; Tx+=100) {
          Tri[num2].triDraw(Tx, Ty, Tz, rot);
          num2++;
        }
      } else num2=0;
    }

    if (rSpeed<=4) {
      rSpeed=4;
    }

    rot+=PI/rSpeed;

    if (rot>=TWO_PI) {
      rot=0;
    }

    //Shoot Gun (use Sphere)
    if (sw==false) {
      CirX=100;
      CirY=355;
      CirXD=7;
      CirYD=7;
      sw=true;
    }
    if (sw==true) {
      if (CirX<190) {
        CirX+=10;
        CirY-=7;
      }
      if (CirX>=190) {
        if (CirXD>=55) {
          Porttxt="Idea!";
        }
        if (CirXD<85) {
          CirXD+=5;
          CirYD+=5;
        } else {
          CirX=100;
          CirY=355;
          CirXD=7;
          CirYD=7;
          Porttxt="";
        }
      }
    }

    noStroke();
    fill(255, 100, 100);
    ellipse(CirX, CirY, CirXD, CirYD);
  } else {
    br[BubNum] += 10;
    b[BubNum].Bubble(br[BubNum], bubX[BubNum], bubY[BubNum], 0);
    b[BubNum].BUpdate();
    BubNum++;
    br[BubNum] += 10;
    b[BubNum].Bubble(br[BubNum], bubX[BubNum], bubY[BubNum], 0);
    b[BubNum].BUpdate();
    BubNum++;
    br[BubNum] += 10;
    b[BubNum].Bubble(br[BubNum], bubX[BubNum], bubY[BubNum], 0);
    b[BubNum].BUpdate();
    BubNum=1;

    if (br[BubNum]>=80) {
      bubX[BubNum]=random(30, width-30);
      bubY[BubNum]=random(30, 200);
      br[BubNum]=1;
    }
    if (br[BubNum+1]>=80) {
      bubX[BubNum+1]=random(30, width-30);
      bubY[BubNum+1]=random(30, 200);
      br[BubNum+1]=1;
    }
    if (br[BubNum+2]>=80) {
      bubX[BubNum+2]=random(30, width-30);
      bubY[BubNum+2]=random(30, 200);
      br[BubNum+2]=1;
    }

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
    //println("Space Bar! scene=3");
    //scene=3;
    //background(255);
  }
  //}
}


