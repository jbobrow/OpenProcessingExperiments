
Cat cat;
Sfw sfw;
Sta sta;

void setup() {
  size (600, 600);
  background(0);
  cat = new Cat(430, 130, 50);
  sfw = new Sfw(350, 600, 0, 0);
  sta = new Sta(0, 0, 255, 255, 0, 50, 100, 150, 0, 200);
  frameRate(100);
}

void draw() {


  cat.catherine();//Catherine Wheel Class and Function being called
  sta.star(); //Star Firework Class and Function being called
  sfw.sproutingfw(); //Sprouting Firework Class and Function being called
}
  
  

class Cat {
  float xPos = 0;
  float yPos = 0;
  float a = 100;

  public Cat(float xPos, float yPos, float a) {
    this.xPos=xPos;
    this.yPos=yPos;
    this.a=a;
  }
  public void catherine() {
    smooth();
    fill(0, 0, 0, 4);
    rect(300, 0, 600, 200);

    noStroke();
    fill(194, 232, 0, 25);
    ellipse(xPos, yPos, 60, 60 );
    fill(142, 0, 0, 20);
    ellipse(477, 97, 55, 55);
    fill(192, 192, 192);
    ellipse(477, 97, 5, 5);



    float xChange = 10*cos(radians(a));
    float yChange = 10*sin(radians(a));

    a-=10;//width

    xPos += xChange;
    yPos += yChange;
  }
}


class Sfw {
  int xPos = 350;
  int yPos = 600;
  int xsiz = 0;
  int ysiz = 0;

  public Sfw(int xPos, int yPos, int xsiz, int ysiz) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xsiz = xsiz;
    this.ysiz = ysiz;
  }
  public void sproutingfw() {
    fill(162, 0, 127);
    rect(345, 585, 10, 40);
    if (yPos>400) {
      noStroke();
      fill(random(127, 220), random(0, 220), 0, random(0, 30));
      ellipse(xPos, yPos, xsiz, ysiz);
      yPos--;
      xsiz++;
      ysiz++;
    }
    else {
      yPos = 600;
      xsiz = 0;
      ysiz = 0;
      background(0);
    }
  }
}
class Sta {
  float x2Pos=0;
  float y2Pos=0;
  int R = 255;
  int B = 255;
  int G = 0;
  int xCoord1 = 50;
  int xCoord2 = 100;
  int xCoord3 = 150;
  int xBoundaryLeft = 0;
  int xBoundaryRight = 200;

  public Sta(float x2Pos, float y2pos, int R, int B, int G, int xCoord1, int xCoord2, int xCoord3, int xBoundryLeft, int xBoundryRight) {
    this. x2Pos= x2Pos;
    this. y2Pos= y2Pos;
    this. R = R;
    this. B = B;
    this. G = G;
    this. xCoord1 = xCoord1;
    this. xCoord2 = xCoord2;
    this. xCoord3 = xCoord3;
    this. xBoundaryLeft = xBoundryLeft;
    this. xBoundaryRight = xBoundryRight;
  }
  public void star() {
    fill(0, 0, 0, 10);
    rect(0, 0, 200, 600);
    smooth();
    noStroke();
    fill(R, B, G);
    triangle(xCoord1, height, xCoord2, (height-100), xCoord3, height);
    triangle(xCoord1, (height-65), xCoord2, (height+50), xCoord3, (height-65));
    height = height -3 ;
    G = G + 2 ;
    

    if (xCoord3>=xBoundaryRight) {
      xCoord1=(xCoord1-10);
      xCoord2=(xCoord2-10);
      xCoord3=(xCoord3-10);
      xCoord1--;
      xCoord2--;
      xCoord3--;
    }
    else {
      xCoord1++;
      xCoord2++;
      xCoord3++;
      
    }

    if (xCoord1<xBoundaryLeft) {
      xCoord1++;
      xCoord1++;
      xCoord1++;
    }
   
    
  
}

  
}

