
//megprobaltam class-szal, de valamiert ugy nem sikerult, es mivel nem volt alkalom megbeszelni, ezert nem is teljesen vilagos

float xv;
float yv;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x5;
float y5;
float x6;
float y6;
float x7;
float y7;
float x8;
float y8;
float x9;
float y9;
float x10;
float y10;
float x11;
float y11;
float x12;
float y12;
float x13;
float y13;
float x14;
float y14;
float x15;
float y15;
float x16;
float y16;
float x17;
float y17;
float x18;
float y18;
float x19;
float y19;
float x20;
float y20;

void setup()
{
  size(1024, 500);
  noFill();
  stroke(255);
}

void draw()
{
  background(0);
  szelet1(mouseX-30, mouseY-15,0.2);
  szelet2(mouseX-60, mouseY-25,0.18);
  szelet3(mouseX-90, mouseY-35,0.17);
  szelet4(mouseX-120, mouseY-45,0.15);
  szelet5(mouseX-150, mouseY-55,0.14);
  szelet6(mouseX-180, mouseY-65,0.13);
  szelet7(mouseX-210, mouseY-75,0.12);
  szelet8(mouseX-240, mouseY-85,0.11);
  szelet9(mouseX-270, mouseY-95,0.1);
  szelet10(mouseX-300, mouseY-105,0.09);
  szelet11(mouseX-330, mouseY-115,0.088);
  szelet12(mouseX-360, mouseY-125,0.084);
  szelet13(mouseX-390, mouseY-135,0.08);
  szelet14(mouseX-420, mouseY-145,0.078);
  szelet15(mouseX-450, mouseY-155,0.074);
  szelet16(mouseX-480, mouseY-165,0.07);
  szelet17(mouseX-510, mouseY-175,0.065);
  szelet18(mouseX-540, mouseY-185,0.06);
  szelet19(mouseX-570, mouseY-195,0.055);
  szelet20(mouseX-600, mouseY-205,0.05);
  vonal(mouseX, mouseY,0.2);
  kor();
}

class hsz
{
  void szelet1(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x1;
  if(abs(dx) > 1) {
    x1 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y1;
  if(abs(dy) > 1) {
    y1 += dy * easing;  
}
  triangle(x1,y1,x1+60,y1,x1+30,y1+30);
}
}

void szelet1(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x1;
  if(abs(dx) > 1) {
    x1 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y1;
  if(abs(dy) > 1) {
    y1 += dy * easing;  
}
  triangle(x1,y1,x1+60,y1,x1+30,y1+30);
}

void szelet2(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x2;
  if(abs(dx) > 1) {
    x2 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y2;
  if(abs(dy) > 1) {
    y2 += dy * easing;  
}
  triangle(x2,y2,x2+120,y2,x2+60,y2+60);
}

void szelet3(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x3;
  if(abs(dx) > 1) {
    x3 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y3;
  if(abs(dy) > 1) {
    y3 += dy * easing;  
}
  triangle(x3,y3,x3+180,y3,x3+90,y3+90);
}

void szelet4(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x4;
  if(abs(dx) > 1) {
    x4 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y4;
  if(abs(dy) > 1) {
    y4 += dy * easing;  
}
  triangle(x4,y4,x4+240,y4,x4+120,y4+120);
}

void szelet5(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x5;
  if(abs(dx) > 1) {
    x5 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y5;
  if(abs(dy) > 1) {
    y5 += dy * easing;  
}
  triangle(x5,y5,x5+300,y5,x5+150,y5+150);
}

void szelet6(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x6;
  if(abs(dx) > 1) {
    x6 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y6;
  if(abs(dy) > 1) {
    y6 += dy * easing;  
}
  triangle(x6,y6,x6+360,y6,x6+180,y6+180);
}

void szelet7(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x7;
  if(abs(dx) > 1) {
    x7 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y7;
  if(abs(dy) > 1) {
    y7 += dy * easing;  
}
  triangle(x7,y7,x7+420,y7,x7+210,y7+210);
}

void szelet8(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x8;
  if(abs(dx) > 1) {
    x8 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y8;
  if(abs(dy) > 1) {
    y8 += dy * easing;  
}
  triangle(x8,y8,x8+480,y8,x8+240,y8+240);
}

void szelet9(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x9;
  if(abs(dx) > 1) {
    x9 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y9;
  if(abs(dy) > 1) {
    y9 += dy * easing;  
}
  triangle(x9,y9,x9+540,y9,x9+270,y9+270);
}

void szelet10(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x10;
  if(abs(dx) > 1) {
    x10 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y10;
  if(abs(dy) > 1) {
    y10 += dy * easing;  
}
  triangle(x10,y10,x10+600,y10,x10+300,y10+300);
}

void szelet11(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x11;
  if(abs(dx) > 1) {
    x11 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y11;
  if(abs(dy) > 1) {
    y11 += dy * easing;  
}
  triangle(x11,y11,x11+660,y11,x11+330,y11+330);
}

void szelet12(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x12;
  if(abs(dx) > 1) {
    x12 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y12;
  if(abs(dy) > 1) {
    y12 += dy * easing;  
}
  triangle(x12,y12,x12+720,y12,x12+360,y12+360);
}

void szelet13(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x13;
  if(abs(dx) > 1) {
    x13 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y13;
  if(abs(dy) > 1) {
    y13 += dy * easing;  
}
  triangle(x13,y13,x13+780,y13,x13+390,y13+390);
}

void szelet14(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x14;
  if(abs(dx) > 1) {
    x14 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y14;
  if(abs(dy) > 1) {
    y14 += dy * easing;  
}
  triangle(x14,y14,x14+840,y14,x14+420,y14+420);
}

void szelet15(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x15;
  if(abs(dx) > 1) {
    x15 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y15;
  if(abs(dy) > 1) {
    y15 += dy * easing;  
}
  triangle(x15,y15,x15+900,y15,x15+450,y15+450);
}

void szelet16(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x16;
  if(abs(dx) > 1) {
    x16 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y16;
  if(abs(dy) > 1) {
    y16 += dy * easing;  
}
  triangle(x16,y16,x16+960,y16,x16+480,y16+480);
}

void szelet17(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x17;
  if(abs(dx) > 1) {
    x17 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y17;
  if(abs(dy) > 1) {
    y17 += dy * easing;  
}
  triangle(x17,y17,x17+1020,y17,x17+510,y17+510);
}

void szelet18(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x18;
  if(abs(dx) > 1) {
    x18 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y18;
  if(abs(dy) > 1) {
    y18 += dy * easing;  
}
  triangle(x18,y18,x18+1080,y18,x18+540,y18+540);
}

void szelet19(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x19;
  if(abs(dx) > 1) {
    x19 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y19;
  if(abs(dy) > 1) {
    y19 += dy * easing;  
}
  triangle(x19,y19,x19+1140,y19,x19+570,y19+570);
}

void szelet20(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - x20;
  if(abs(dx) > 1) {
    x20 += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - y20;
  if(abs(dy) > 1) {
    y20 += dy * easing;  
}
  triangle(x20,y20,x20+1200,y20,x20+600,y20+600);
}

void vonal(float inputx, float inputy, float easing)
{ 
  float targetX = inputx;
  float dx = targetX - xv;
  if(abs(dx) > 1) {
    xv += dx * easing;
 }
  float targetY = inputy;
  float dy = targetY - yv;
  if(abs(dy) > 1) {
    yv += dy * easing;  
}
  line(xv,yv,mouseX,mouseY);
}

void kor()
{
  fill(255);
  ellipse(mouseX, mouseY, 20, 20);
  noFill();
}
