
Dot d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29;

boolean dropEvent=false;
float gravity=2.9;

void setup() {
  size(500, 500);
  smooth();
  //float rate=map(mouseY,1,500,0.1,4);
  frameRate(50);
  d1=new Dot(78, 60, 50, 50, 213,255,99);
  d2=new Dot(143, 40, 25, 25,234,239,173);
  d3=new Dot(273, 15, 10, 10,181,219,168);
  d4=new Dot(357, 25, 25, 25,140,201,108);
  d5=new Dot(360, 25, 28, 28,213,255,99);
  d6=new Dot(324, 94, 30, 30,213,255,99);
  d7=new Dot(425, 71, 20, 20,140,201,108);
  d8=new Dot(478, 82, 37, 37,243,240,233);
  d9=new Dot(28, 142, 32, 32,213,255,99);
  d10=new Dot(189, 161, 34, 34,243,240,233);
  d11=new Dot(276, 163, 10, 10,181,219,168);
  d12=new Dot(394, 172, 15, 15,140,201,108);
  d13=new Dot(223, 83, 35, 35,243,240,233);
  d14=new Dot(28, 137, 25, 25,213,255,99);
  d15=new Dot(100, 210, 14, 14,140,201,108);
  d16=new Dot(231, 265, 26, 26,213,255,99);
  d17=new Dot(342, 223, 37, 37,181,219,168);
  d18=new Dot(393, 172, 26, 26,234,239,173);
  d19=new Dot(467, 191, 30, 30,213,255,99);
  d20=new Dot(342, 400, 39, 39,140,201,108);
  d21=new Dot(120, 356, 36, 36,213,255,99);
  d22=new Dot(62, 303, 30, 30,181,219,168);
  d23=new Dot(156, 287, 13, 13,234,239,173);
  d24=new Dot(256, 318, 20, 20,181,219,168);
  d25=new Dot(420, 311, 27, 27,140,201,108);
  d26=new Dot(55, 440, 35, 35,234,239,173);
  d27=new Dot(225, 381, 18, 18,213,255,99);
  d28=new Dot(300, 444, 40, 40,243,240,233);
  d29=new Dot(449, 476, 30, 30,181,219,168);
}

void draw() {
  background(15);

  if (dropEvent==false) {
    d1.drawDot();
    d2.drawDot();
    d3.drawDot();
    d4.drawDot();
    d5.drawDot();
    d6.drawDot();
    d7.drawDot();
    d8.drawDot();
    d9.drawDot();
    d10.drawDot();
    d11.drawDot();
    d12.drawDot();
    d13.drawDot();
    d14.drawDot();
    d15.drawDot();
    d16.drawDot();
    d17.drawDot();
    d18.drawDot();
    d19.drawDot();
    d20.drawDot();
    d21.drawDot();
    d22.drawDot();
    d23.drawDot();
    d24.drawDot();
    d25.drawDot();
    d26.drawDot();
    d27.drawDot();
    d28.drawDot();
    d29.drawDot();
  } else {
    d1.dropDot();
    d2.dropDot();
    d3.dropDot();
    d4.dropDot();
    d5.dropDot();
    d6.dropDot();
    d7.dropDot();
    d8.dropDot();
    d9.dropDot();
    d10.dropDot();
    d11.dropDot();
    d12.dropDot();
    d13.dropDot();
    d14.dropDot();
    d15.dropDot();
    d16.dropDot();
    d17.dropDot();
    d18.dropDot();
    d19.dropDot();
    d20.dropDot();
    d21.dropDot();
    d22.dropDot();
    d23.dropDot();
    d24.dropDot();
    d25.dropDot();
    d26.dropDot();
    d27.dropDot();
    d28.dropDot();
    d29.dropDot();
  }
}

void mousePressed() {
  dropEvent=true;
}

void mouseReleased() {
  dropEvent=false;
}

class Dot {
  float DotX;
  float DotY;
  float DotW;
  float DotH;
  float speedy;
  float ballRadius;
  float color1;
  float color2;
  float color3;

  Dot(float tempDotX, float tempDotY, float tempDotW, float tempDotH,float tempcolor1, float tempcolor2, float tempcolor3) {
    DotX=tempDotX;
    DotY=tempDotY;
    DotW=tempDotW;
    DotH=tempDotH;
    speedy=2;
    ballRadius=DotH/2;
    color1=tempcolor1;
    color2=tempcolor2;
    color3=tempcolor3;
}

  void drawDot() {
    fill(color1,color2,color3);
    noStroke();
    ellipse(DotX, DotY, DotW, DotH);
  }

  void dropDot() {
    fill(color1,color2,color3);
    noStroke();
    ellipse(DotX, DotY, DotW, DotH);
    
    DotY=DotY+speedy;
    speedy=speedy+gravity;
    if (DotY+ballRadius>height) {
      speedy=speedy*-0.95;
    }
  }
}



