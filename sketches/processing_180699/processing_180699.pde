
int centerXX = 50;
int centerYY = 100;
int centerX = 795;
int centerY = 200;
int centerXXX=600;
int centerYYY = 50;

float A = 300;
float B = 200;
float C = 100;
float a = 0;
float b = -200;
float bc = -250;
float c = -300;
float d = -500;
float de = -550;
float e = -600;
float f = -700;
float g = -750;
float h = -800;
float hi = -850;
float i = -900;
float j = -1000;
float k = -1050;
float l = -1100;
float lm = -1150;
float m = -1200;
float n = -1300;
float no = -1400;
float o = -1500;

float p = -1600;
float pq = -1700;
float q = -1800;
float r = -1900;
float s = -2000;
float t = -2050;
float tu = -2075;
float u = -2100;
float v = -2200;
float vw = -2300;
float vww = -2305;
float w = -2400;
//float x = 2600;

float r1 = 25;
float r2 = 25;
float r3 = 25;
float r4 = 25;
float r5 = 25;
float r6 = 25;
float r7 = 25;
float r8 = 25;
float r9 = 25;
float r10 = 25;
float r11 = 25;

float r12 = 25;
float r13 = 25;
float r14 = 25;
float r15 = 25;
float r16 = 25;
float r17 = 25;
float r18 = 25;
float r19 = 25;
float r20 = 25;
float r21 = 25;
float r22 = 25;
float r23 = 25;
float r24 = 25;
float r25 = 25;
float r26 = 25;
float r27 = 25;
float r28 = 25;
float r29 = 25;
float r30 = 25;
float r31 = 25;

void setup() {
  size(800, 600);
}
void draw() {
  background(102, 153, 204);
  noStroke();
 fill(162, 0, 255);
 ellipse(centerX, centerY, 80, 40);
 triangle(centerX + 35, 200, centerX + 45, 170, centerX + 45, 230);
 fill(255, 0, 0);
 ellipse(centerXX, centerYY, 80, 40);
 triangle(centerXX-35, 100, centerXX - 45, 70, centerXX - 45, 130);
 
 
 fill(255, 255, 0);
 ellipse(centerX-300, centerY+100, 80, 40);
  triangle(centerX - 300 + 35, 200+100, centerX-300 + 45, 170+100, centerX -300+ 45, 230+100);
 fill(34,139,34);
 ellipse(centerXXX, centerYYY, 100, 40);
 triangle(centerXXX-45, 50, centerXXX-55, 20, centerXXX-55, 80);
 if(centerX < 0) {
   centerX = 795;
 }
 if(centerXX > 800) {
   centerXX = 0;
 }
 if(centerXXX > 800) {
   centerXXX = 0;
 }
 strokeWeight(2);
 stroke();
 noFill();
 textFont(createFont("cursive"));
 textSize(36);
 fill(255);
 text("1", A, 450);
 text("2", B, 450);
 text("3", C, 450);
 noFill();
ellipse(a, 450, r1, r1);
fill(255);
ellipse(b, 450, r2, r2);
noFill();
ellipse(c, 450, r3, r3);
fill();
ellipse(d, 450, r4, r4);

ellipse(e, 450, r5, r5);
ellipse(f, 450, r6, r6);
ellipse(g, 450, r7, r7);
ellipse(h, 450, r8, r8);
ellipse(i, 450, r9, r9);
ellipse(j, 450, r10, r10);
ellipse(k, 450, r11, r11);
ellipse(l, 450, r12, r12);
ellipse(m, 450, r13, r13);
noFill();
ellipse(n, 450, r14, r14);
fill();
ellipse(o, 450, r15, r15);
noFill();
ellipse(p, 450, r16, r16);
fill(255);
stroke(255);
ellipse(q, 450, r17, r17);
ellipse(r, 450, r18, r18);
ellipse(s, 450, r19, r19);
ellipse(t, 450, r20, r20);
ellipse(u, 450, r21, r21);
noFill();
ellipse(v, 450, r22, r22);
fill();
strokeWeight(1);
line(a+12.5, 450, a+12.5, 400);
line(b+12.5, 450, b+12.5, 400);
line(c+12.5, 450, c+12.5, 400);
line(d+12.5, 450, d+12.5, 400);
line(e+12.5, 450, e+12.5, 400);
line(f+12.5, 450, f+12.5, 400);
line(g+12.5, 450, g+12.5, 400);
line(f+12.5, 400, g+12.5, 400);
line(h+12.5, 450, h+12.5, 400);
line(i+12.5, 450, i+12.5, 400);
line(j+12.5, 450, j+12.5, 400);
line(k+12.5, 450, k+12.5, 400);
line(k+12.5, 400, j+12.5, 400);
line(l+12.5, 450, l+12.5, 400);
line(m+12.5, 450, m+12.5, 400);
line(n+12.5, 450, n+12.5, 400);
line(o+12.5, 450, o+12.5, 400);
line(p+12.5, 450, p+12.5, 400);
line(q+12.5, 450, q+12.5, 400);
line(r+12.5, 450, r+12.5, 400);
line(s+12.5, 450, s+12.5, 400);
line(t+12.5, 450, t+12.5, 400);
line(s+12.5, 400, t+12.5, 400);
line(u+12.5, 450, u+12.5, 400);
line(v+12.5, 450, v+12.5, 400);
stroke(.3);
fill(128, 128, 128);
line(bc, 460, bc, 395);
line(de, 460, de, 395);
line(hi, 460, hi, 395);
line(lm, 460, lm, 395);
line(no, 460, no, 395);
line(pq, 460, pq, 395);
line(tu, 460, tu, 395);
line(vw, 460, vw, 395);
line(vww, 460, vww, 395);
if(mousePressed) {
 A = 300;
 B = 200;
 C = 100;
 a = 0;
 b = -200;
 bc = -250;
 c = -300;
 d = -500;
 de = -550;
 e = -600;
 f = -700;
 g = -750;
 h = -800;
hi = -850;
 i = -900;
 j = -1000;
 k = -1050;
 l = -1100;
 lm = -1150;
 m = -1200;
 n = -1300;
 no = -1400;
 o = -1500;

 p = -1600;
 pq = -1700;
 q = -1800;
 r = -1900;
 s = -2000;
 t = -2050;
 tu = -2075;
 u = -2100;
 v = -2200;
 vw = -2300;
 vww = -2305;
 w = -2400;
//float x = 2600;
  
}


centerXX = centerXX + .2;
centerX = centerX - .5;
centerXXX = centerXXX + 1;
bc = bc+2.5;
de = de+2.5;
hi = hi+2.5;
lm = lm+2.5;
no = no+2.5;
pq = pq+2.5;
tu = tu+2.5;
vw = vw+2.5;
vww = vww+2.5;
a = a+2.5;
b = b+2.5;
c = c+2.5;
d = d+2.5;
e = e+2.5;
f = f+2.5;
g = g+2.5;
h = h+2.5;
i = i+2.5;
j = j+2.5;
k = k+2.5;
l = l+2.5;
m = m+2.5;
n = n+2.5;
o = o+2.5;
p = p+2.5;
q = q+2.5;
r = r+2.5;
s = s+2.5;
t = t+2.5;
u = u+2.5;
v = v+2.5;
A = A+2.5;
B = B+2.5;
C = C+2.5;
//w = w+2.5;

if (a == 300) {
    r1 = r1*1.5;
  }
  
  if (a == 360) {
    r1 = 20;
  }
   if (b == 300) {
    r2 = r2*1.5;
  }
  
  if (b == 330) {
    r2 = 20;
  }
   if (c == 300) {
    r3 = r3*1.5;
  }
  
  if (c == 360) {
    r3 = 20;
  }
   if (d == 300) {
    r4 = r4*1.5;
  }
  
  if (d == 330) {
    r4 = 20;
  }
  if (e == 300) {
    r5 = r5*1.5;
  }
  
  if (e == 330) {
    r5 = 20;
  }
   if (f == 300) {
    r6 = r6*1.5;
  }
  
  if (f == 330) {
    r6 = 20;
  }
   if (g == 300) {
    r7 = r7*1.5;
  }
  
  if (g == 330) {
    r7 = 20;
  }
   if (h == 300) {
    r8 = r8*1.5;
  }
  
  if (h == 330) {
    r8 = 20;
  }
   if (i == 300) {
    r9 = r9*1.5;
  }
  
  if (i == 330) {
    r9 = 20;
  }
   if (j == 300) {
    r10 = r10*1.5;
  }
  
  if (j == 330) {
    r10 = 20;
  }
  if (k == 300) {
    r11 = r11*1.5;
  }
  
  if (k == 360) {
    r11 = 20;
  }
  if (l == 300) {
    r12 = r12*1.5;
  }
  
  if (l == 330) {
    r12 = 20;
  }
   if (m == 300) {
    r13 = r13*1.5;
  }
  
  if (m == 330) {
    r13 = 20;
  }
   if (n == 300) {
    r14 = r14*1.5;
  }
  
  if (n == 360) {
    r14 = 20;
  }
   if (o == 300) {
    r15 = r15*1.5;
  }
  
  if (o == 330) {
    r15 = 20;
  }
  if (p == 300) {
    r16 = r16*1.5;
  }
  
  if (p == 360) {
    r16 = 20;
  }
   if (q == 300) {
    r17 = r17*1.5;
  }
  
  if (q == 330) {
    r17 = 20;
  }
   if (r == 300) {
    r18 = r18*1.5;
  }
  
  if (r == 330) {
    r18 = 20;
  }
   if (s == 300) {
    r19 = r19*1.5;
  }
  
  if (s == 330) {
    r19 = 20;
  }
 if (t == 300) {
    r20 = r20*1.5;
  }
  
  if (t == 330) {
    r20 = 20;
  }
  if (u == 300) {
    r21 = r21*1.5;
  }
  
  if (u == 330) {
    r21 = 20;
  }
  if (v == 300) {
    r22 = r22*1.5;
  }
  
  if (v == 360) {
    r22 = 20;
  }
  //if (w == 300) {
   // r23 = r23*1.5;
  //}
  
  //if (w == 330) {
   // r23 = 20;
  //}
 
  }






