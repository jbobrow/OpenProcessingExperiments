
PImage img;
int centerXX = 50;
int centerYY = 100;
int centerX = 795;
int centerY = 200;
int centerXXX = 200;
int centerYYY = 50;

float cr = 200;
float cro = 400;
float a = 0;
float b = -50;
float c = -100;
float d = -150;
float e = -200;
float f = -300;
float fg = -350;
float g = -400;
float h = -450;
float i = -500;
float j = -550;
float k = -600;
float la = -700;
float aa = -800;
float bb = -850;
float cc = -900;
float dd = -950;
float ee = -1000;
float ff = -1100;
float ffg = -1150;
float gg = -1200;
float hh = -1250;
float ii = -1300;
float jj = -1350;
float kk = -1400;
float kkl = -1500;
float l = -1600;
float m = -1700;
float n = -1800;
float o = -1900;
float op = -1950;
float p = -2000;
float q = -2050;
float r = -2100;
float s = -2150;
float t = -2200;
float tl = -2300;
float ll = -2400;
float mm = -2500;
float nn = -2600;
float oo = -2700;
float oop = -2750;
float pp = -2800;
float qq = -2850;
float rr = -2900;
float ss = -2950;
float tt = -3000;
float tu = -3100;
float u = -3200;
float v = -3250;
float w = -3300;
float x = -3350;
float y = -3400;
float yz = -3500;
float yzz = -3550;
float z = -3600;
float aba = -3800;
float abau = -3900;
float uu = -4000;
float vv = -4050;
float ww = -4100;
float xx = -4150;
float yy = -4200;
float yyz = -4300;
float yyzz = -4350;
float zz = -4400;
float aaaa = -4600;
float elsa = -4800;
float elsab = -4805;


float r1 = 20;
float r2 = 20;
float r3 = 20;
float r4 = 20;
float r5 = 20;
float r6 = 20;
float r7 = 20;
float r8 = 20;
float r9 = 20;
float r10 = 20;
float r11 = 20;

float r12 = 20;
float r13 = 20;
float r14 = 20;
float r15 = 20;
float r16 = 20;
float r17 = 20;
float r18 = 20;
float r19 = 20;
float r20 = 20;
float r21 = 20;
float r22 = 20;

float r23 = 20;
float r24 = 20;
float r25 = 20;
float r26 = 20;
float r27 = 20;
float r28 = 20;
float r29 = 20;
float r30 = 20;
float r31 = 20;
float r32 = 20;
float r33 = 20;
float r34 = 20;
float r35 = 20;
float r36 = 20;
float r37 = 20;
float r38 = 20;
float r39 = 20;
float r40 = 20;

float r41 = 20;
float r42 = 20;
float r43 = 20;
float r44 = 20;
float r45 = 20;
float r46 = 20;
float r47 = 20;
float r48 = 20;
float r49 = 20;
float r50 = 20;
float r51 = 20;
float r52 = 20;
float r53 = 20;
float r54 = 20;
float r55 = 20;
float r56 = 20;
float r57 = 20;
float r58 = 20;
float r59 = 20;
float r60 = 20;



void setup() {
  size(800, 600);
  img = loadImage("restpng2.png");
}

void draw() {
  background(127, 255, 212);
  textFont(createFont("cursive"));
  textSize(36);
  fill(0);
  text("1", cro, 450);
  text("2", cr, 450);
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
   centerX = 799;
 }
 if(centerXX > 800) {
   centerXX = 0;
 }
  if(centerXXX > 800) {
   centerXXX = 0;
 }
  noStroke();
  fill(0);
ellipse(a, 450, r1, r1);
ellipse(b, 450, r2, r2);
ellipse(c, 450, r3, r3);
ellipse(d, 450, r4, r4);
ellipse(e, 450, r5, r5);
ellipse(f, 450, r6, r6);
ellipse(g, 450, r7, r7);
ellipse(h, 450, r8, r8);
ellipse(i, 450, r9, r9);
ellipse(j, 450, r10, r10);
ellipse(k, 450, r11, r11);
stroke(0);
strokeWeight(1);
line(a+10, 450, a+10, 400);
line(b+10, 450, b+10, 400);
line(c+10, 450, c+10, 400);
line(d+10, 450, d+10, 400);
line(a+10, 400, d+10, 400);
line(a+10, 405, d+10, 405);
line(e+10, 450, e+10, 400);
line(f+10, 450, f+10, 400);
line(e+10, 400, f+10, 400);
line(g+10, 450, g+10, 400);
line(h+10, 450, h+10, 400);
line(i+10, 450, i+10, 400);
line(j+10, 450, j+10, 400);
line(g+10, 400, j+10, 400);
line(g+10, 405, j+10, 405);
line(k+10, 450, k+10, 400);
ellipse(aa, 450, r12, r12);
ellipse(bb, 450, r13, r13);
ellipse(cc, 450, r14, r14);
ellipse(dd, 450, r15, r15);
ellipse(ee, 450, r16, r16);
ellipse(ff, 450, r17, r17);
ellipse(gg, 450, r18, r18);
ellipse(hh, 450, r19, r19);
ellipse(ii, 450, r20, r20);
ellipse(jj, 450, r21, r21);
ellipse(kk, 450, r22, r22);
line(aa+10, 450, aa+10, 400);
line(bb+10, 450, bb+10, 400);
line(cc+10, 450, cc+10, 400);
line(dd+10, 450, dd+10, 400);
line(aa+10, 400, dd+10, 400);
line(aa+10, 405, dd+10, 405);
line(ee+10, 450, ee+10, 400);
line(ff+10, 450, ff+10, 400);
line(ff+10, 400, ee+10, 400);
line(gg+10, 450, gg+10, 400);
line(hh+10, 450, hh+10, 400);
line(ii+10, 450, ii+10, 400);
line(jj+10, 450, jj+10, 400);
line(jj+10, 400, gg+10, 400);
line(jj+10, 405, gg+10, 405);
line(kk+10, 450, kk+10, 400);
ellipse(l, 450, r23, r23);
ellipse(m, 450, r24, r24);
ellipse(n, 450, r25, r25);
ellipse(o, 450, r26, r26);
ellipse(p, 450, r27, r27);
ellipse(q, 450, r28, r28);
ellipse(r, 450, r29, r29);
ellipse(s, 450, r30, r30);
ellipse(t, 450, r31, r31);
ellipse(ll, 450, r32, r32);
ellipse(mm, 450, r33, r33);
ellipse(nn, 450, r34, r34);
ellipse(oo, 450, r35, r35);
ellipse(pp, 450, r36, r36);
ellipse(qq, 450, r37, r37);
ellipse(rr, 450, r38, r38);
ellipse(ss, 450, r39, r39);
ellipse(tt, 450, r40, r40);
line(l+10, 450, l+10, 400);
line(m+10, 450, m+10, 400);
line(l+10, 400, m+10, 400);
line(n+10, 450, n+10, 400);
line(o+10, 450, o+10, 400);
line(n+10, 400, o+10, 400);
line(p+10, 450, p+10, 400);
line(q+10, 450, q+10, 400);
line(r+10, 450, r+10, 400);
line(s+10, 450, s+10, 400);
line(p+10, 400, s+10, 400);
line(p+10, 405, s+10, 405);
line(t+10, 450, t+10, 400);
line(ll+10, 450, ll+10, 400);
line(mm+10, 450, mm+10, 400);
line(ll+10, 400, mm+10, 400);
line(nn+10, 450, nn+10, 400);
line(oo+10, 450, oo+10, 400);
line(nn+10, 400, oo+10, 400);
line(pp+10, 450, pp+10, 400);
line(qq+10, 450, qq+10, 400);
line(rr+10, 450, rr+10, 400);
line(ss+10, 450, ss+10, 400);
line(pp+10, 400, ss+10, 400);
line(pp+10, 405, ss+10, 405);
line(tt+10, 450, tt+10, 400);
fill(0);
stroke(0);
ellipse(u, 450, r41, r41);
ellipse(v, 450, r42, r42);
ellipse(w, 450, r43, r43);
ellipse(x, 450, r44, r44);
ellipse(y, 450, r45, r45);
ellipse(yz, 450, r53, r53);
image(img,z, 400);
ellipse(aba, 450, r46, r46);
line(u+10, 450, u+10, 400);
line(v+10, 450, v+10, 400);
line(w+10, 450, w+10, 400);
line(x+10, 450, x+10, 400);
line(x+10, 400, u+10, 400);
line(x+10, 405, u+10, 405);
line(y+10, 450, y+10, 400);
line(yz+10, 450, yz+10, 400);
line(y+10, 400, yz+10, 400);
line(aba+10, 450, aba+10, 400);
line(uu+10, 450, uu+10, 400);
line(vv+10, 450, vv+10, 400);
line(ww+10, 450, ww+10, 400);
line(xx+10, 450, xx+10, 400);
line(uu+10, 400, xx+10, 400);
line(uu+10, 405, xx+10, 405);
line(yy+10, 450, yy+10, 400);
line(yyz+10, 450, yyz+10, 400);
line(yyz+10, 400, yy+10, 400);
line(aaaa+10, 450, aaaa+10, 400);
ellipse(uu, 450, r47, r47);
ellipse(vv, 450, r48, r48);
ellipse(ww, 450, r49, r49);
ellipse(xx, 450, r50, r50);
ellipse(yy, 450, r51, r51);
ellipse(yyz, 450, r54, r54);
image(img,zz, 400);
ellipse(aaaa, 450, r52, r52);

strokeWeight(.5);
line(fg, 455, fg, 395);
line(la, 455, la, 395);
line(ffg, 455, ffg, 395);
line(kkl, 455, kkl, 395);
line(tl, 455, tl, 395);
line(op, 455, op, 395);
line(tu, 455, tu, 395);
line(yzz, 455, yzz, 395);
line(oop, 455, oop, 395);
line(abau, 455, abau, 395);
line(yyzz, 455, yyzz, 395);
line(elsa, 455, elsa, 395);
line(elsab, 455, elsab, 395);

if(mousePressed) {
   cr = 200;
cro = 400;
 a = 0;
 b = -50;
c = -100;
 d = -150;
 e = -200;
 f = -300;
fg = -350;
 g = -400;
 h = -450;
 i = -500;
 j = -550;
 k = -600;
 la = -700;
 aa = -800;
bb = -850;
 cc = -900;
 dd = -950;
ee = -1000;
 ff = -1100;
 ffg = -1150;
 gg = -1200;
 hh = -1250;
 ii = -1300;
 jj = -1350;
kk = -1400;
 kkl = -1500;
l = -1600;
 m = -1700;
 n = -1800;
 o = -1900;
 op = -1950;
 p = -2000;
 q = -2050;
 r = -2100;
 s = -2150;
 t = -2200;
 tl = -2300;
 ll = -2400;
 mm = -2500;
 nn = -2600;
 oo = -2700;
 oop = -2750;
pp = -2800;
 qq = -2850;
 rr = -2900;
ss = -2950;
 tt = -3000;
 tu = -3100;
 u = -3200;
 v = -3250;
 w = -3300;
 x = -3350;
 y = -3400;
 yz = -3500;
yzz = -3550;
 z = -3600;
 aba = -3800;
 abau = -3900;
 uu = -4000;
 vv = -4050;
 ww = -4100;
 xx = -4150;
 yy = -4200;
 yyz = -4300;
 yyzz = -4350;
 zz = -4400;
 aaaa = -4600;
 elsa = -4800;
 elsab = -4805;
 }



yyzz = yyzz+2.5;
abau = abau+2.5;
oop = oop+2.5;
yzz = yzz+2.5;
op = op+2.5;
tu = tu+2.5;
fg = fg+2.5;
la = la+2.5;
ffg = ffg+2.5;
kkl = kkl+2.5;
tl = tl+2.5;
elsa = elsa+2.5;
elsab = elsab + 2.5;

centerXX = centerXX + .2;
centerX = centerX - 1.5;
centerXXX= centerXXX + 1;

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
aa = aa+2.5;
bb = bb+2.5;
cc = cc+2.5;
dd = dd+2.5;
ee = ee+2.5;
ff = ff+2.5;
gg = gg+2.5;
hh = hh+2.5;
ii = ii+2.5;
jj = jj+2.5;
kk = kk+2.5;
l = l+2.5;
m = m+2.5;
n = n+2.5;
o = o+2.5;
p = p+2.5;
q = q+2.5;
r = r+2.5;
s = s+2.5;
t = t+2.5;
ll = ll+2.5;
mm = mm+2.5;
nn = nn+2.5;
oo = oo+2.5;
pp = pp+2.5;
qq = qq+2.5;
rr = rr+2.5;
ss = ss+2.5;
tt = tt+2.5;
u = u+2.5;
v = v+2.5;
w = w+2.5;
x = x+2.5;
y = y+2.5;
z = z+2.5;
aba = aba+2.5;
uu = uu+2.5;
vv = vv+2.5;
ww = ww+2.5;
xx = xx+2.5;
yy = yy+2.5;
zz = zz+2.5;
aaaa = aaaa+2.5;
yz = yz + 2.5;
yyz = yyz + 2.5;
cr = cr+2.5;
cro = cro+2.5;

if (a == 300) {
    r1 = r1*1.5;
  }
  
  if (a == 330) {
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
  
  if (c == 330) {
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
  
  if (aa == 300) {
    r12 = r12*1.5;
  }
  
  if (aa == 330) {
    r12 = 20;
  }
   if (bb == 300) {
    r13 = r13*1.5;
  }
  
  if (bb == 330) {
    r13 = 20;
  }
   if (cc == 300) {
    r14 = r14*1.5;
  }
  
  if (cc == 330) {
    r14 = 20;
  }
   if (dd == 300) {
    r15 = r15*1.5;
  }
  
  if (dd == 330) {
    r15 = 20;
  }
  if (ee == 300) {
    r16 = r16*1.5;
  }
  
  if (ee == 330) {
    r16 = 20;
  }
   if (ff == 300) {
    r17 = r17*1.5;
  }
  
  if (ff == 330) {
    r17 = 20;
  }
   if (gg == 300) {
    r18 = r18*1.5;
  }
  
  if (gg == 330) {
    r18 = 20;
  }
   if (hh == 300) {
    r19 = r19*1.5;
  }
  
  if (hh == 330) {
    r19 = 20;
  }
   if (ii == 300) {
    r20 = r20*1.5;
  }
  
  if (ii == 330) {
    r20 = 20;
  }
   if (jj == 300) {
    r21 = r21*1.5;
  }
  
  if (jj == 330) {
    r21 = 20;
  }
  if (kk == 300) {
    r22 = r22*1.5;
  }
  
  if (kk == 360) {
    r22 = 20;
  }
  if (l == 300) {
    r23 = r23*1.5;
  }
  
  if (l == 330) {
    r23 = 20;
  }
   if (m == 300) {
    r24 = r24*1.5;
  }
  
  if (m == 330) {
    r24 = 20;
  }
   if (n == 300) {
    r25 = r25*1.5;
  }
  
  if (n == 330) {
    r25 = 20;
  }
   if (o == 300) {
    r26 = r26*1.5;
  }
  
  if (o == 330) {
    r26 = 20;
  }
  if (p == 300) {
    r27 = r27*1.5;
  }
  
  if (p == 330) {
    r27 = 20;
  }
   if (q == 300) {
    r28 = r28*1.5;
  }
  
  if (q == 330) {
    r28 = 20;
  }
   if (r == 300) {
    r29 = r29*1.5;
  }
  
  if (r == 330) {
    r29 = 20;
  }
   if (s == 300) {
    r30 = r30*1.5;
  }
  
  if (s == 330) {
    r30 = 20;
  }
 if (t == 300) {
    r31 = r31*1.5;
  }
  
  if (t == 330) {
    r31 = 20;
  }
  if (ll == 300) {
    r32 = r32*1.5;
  }
  
  if (ll == 330) {
    r32 = 20;
  }
   if (mm == 300) {
    r33 = r33*1.5;
  }
  
  if (mm == 330) {
    r33 = 20;
  }
   if (nn == 300) {
    r34 = r34*1.5;
  }
  
  if (nn == 330) {
    r34 = 20;
  }
   if (oo == 300) {
    r35 = r35*1.5;
  }
  
  if (oo == 360) {
    r35 = 20;
  }
  if (pp == 300) {
    r36 = r36*1.5;
  }
  
  if (pp == 330) {
    r36 = 20;
  }
   if (qq == 300) {
    r37 = r37*1.5;
  }
  
  if (qq == 330) {
    r37 = 20;
  }
   if (rr == 300) {
    r38 = r38*1.5;
  }
  
  if (rr == 330) {
    r38 = 20;
  }
   if (ss == 300) {
    r39 = r39*1.5;
  }
  
  if (ss == 330) {
    r39 = 20;
  }
 if (tt == 300) {
    r40 = r40*1.5;
  }
  
  if (tt == 360) {
    r40 = 20;
  }
   if (u == 300) {
    r41 = r41*1.5;
  }
  
  if (u == 330) {
    r41 = 20;
  }
   if (v == 300) {
    r42 = r42*1.5;
  }
  
  if (v == 330) {
    r42 = 20;
  }
   if (w == 300) {
    r43 = r43*1.5;
  }
  
  if (w == 330) {
    r43 = 20;
  }
   if (x == 300) {
    r44 = r44*1.5;
  }
  
  if (x == 330) {
    r44 = 20;
  }
  if (y == 300) {
    r45 = r45*1.5;
  }
  
  if (y == 330) {
    r45 = 20;
  }
   if (aba == 300) {
    r46 = r46*1.5;
  }
  
  if (aba == 360) {
    r46 = 20;
  }
  if (uu == 300) {
    r47 = r47*1.5;
  }
  
  if (uu == 330) {
    r47 = 20;
  }
   if (vv == 300) {
    r48 = r48*1.5;
  }
  
  if (vv == 330) {
    r48 = 20;
  }
   if (ww == 300) {
    r49 = r49*1.5;
  }
  
  if (ww == 330) {
    r49 = 20;
  }
   if (xx == 300) {
    r50 = r50*1.5;
  }
  
  if (xx == 330) {
    r50 = 20;
  }
  if (yy == 300) {
    r51 = r51*1.5;
  }
  
  if (yy == 330) {
    r51 = 20;
  }
   if (aaaa == 300) {
    r52 = r52*1.5;
  }
  
  if (aaaa == 360) {
    r52 = 20;
  }
  if (yz == 300) {
    r53 = r53*1.5;
  }
  
  if (yz == 330) {
    r53 = 20;
  }
   if (yyz == 300) {
    r54 = r54*1.5;
  }
  
  if (yyz == 360) {
    r54 = 20;
  }
  

}
  


