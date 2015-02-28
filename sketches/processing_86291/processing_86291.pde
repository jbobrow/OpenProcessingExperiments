
float a;
float b;
float c;
float d;
float e;
float f;
float g;

void setup ()
{
  size (500,500);
  smooth ();
  
  
  //   taille des cylindres
  int tcyl;
  tcyl = 50;
  
  
  a = tcyl/5*1;
  b = tcyl/5*2;
  c = tcyl/5*3;
  d = tcyl/5*4;
  e = tcyl/10*9;
  f = tcyl/20*19;
  g = tcyl/60*59;
}



//   le but est de créer des cylindres par extrusion (en 2D)



void draw ()
{
  
  
  
 
  
  //   INT
  
  
  
  
  
  //   nombre de formes
  int nbdt;
  nbdt = 10;
  
  
  
  //   taille des cylindres
  int tcyl;
  tcyl = 100;
  
  
  
  //   vitesse 
  int vit;
  vit = 1;
  
  
  
  
  
  //   écarts
  int ech;
  ech = width/nbdt/2;
  int ecv;
  ecv = height/nbdt/2;
  
  //   écarts N
  int echn;
  echn = width/nbdt/2/3;
  int ecvn;
  ecvn = height/nbdt/2/3;
  
  
  // taille des cercles
  int tch;
  tch = width/nbdt;
  int tcv;
  tcv = width/nbdt;
  
  //   placements des points
  int phm2;
  phm2 = 0-width/nbdt*2;
  int pvm2;
  pvm2 = 0-width/nbdt*2;
  int phm1;
  phm1 = 0-width/nbdt*1;
  int pvm1;
  pvm1 = 0-width/nbdt*1;
  int ph1;
  ph1 = width/nbdt*1;
  int pv1;
  pv1 = width/nbdt*1;
  int ph2;
  ph2 = width/nbdt*2;
  int pv2;
  pv2 = width/nbdt*2;
  int ph3;
  ph3 = width/nbdt*3;
  int pv3;
  pv3 = width/nbdt*3;
  int ph4;
  ph4 = width/nbdt*4;
  int pv4;
  pv4 = width/nbdt*4;
  int ph5;
  ph5 = width/nbdt*5;
  int pv5;
  pv5 = width/nbdt*5;
  int ph6;
  ph6 = width/nbdt*6;
  int pv6;
  pv6 = width/nbdt*6;
  int ph7;
  ph7 = width/nbdt*7;
  int pv7;
  pv7 = width/nbdt*7;
  int ph8;
  ph8 = width/nbdt*8;
  int pv8;
  pv8 = width/nbdt*8;
  int ph9;
  ph9 = width/nbdt*9;
  int pv9;
  pv9 = width/nbdt*9;
  int ph10;
  ph10 = width/nbdt*10;
  int pv10;
  pv10 = width/nbdt*10;
  int pv11;
  pv11 = width/nbdt*11;
  int pv12;
  pv12 = width/nbdt*12;
  int pv13;
  pv13 = width/nbdt*13;
  int pv14;
  pv14 = width/nbdt*14;
  int pv15;
  pv15 = width/nbdt*15;
  
  //   extrusion plus ou moins importante
  int mm1;
  mm1 = 4;
  int mm2;
  mm2 = 5;
  int mm3;
  mm3 = 6;
  int mm4;
  mm4 = 7;
  int mm5;
  mm5 = 8;
  int mm6;
  mm6 = 9;
  
  int m1;
  m1 = (mouseY/mm1);
  int m2;
  m2 = (mouseY/mm2);
  int m3;
  m3 = (mouseY/mm3);
  int m4;
  m4 = (mouseY/mm4);
  int m5;
  m5 = (mouseY/mm5);
  int m6;
  m6 = (mouseY/mm6);
  
  //   couleurs
  color c1 = color(255,0,0);
  color c2 = color(255,150,0);
  color c3 = color(255,255,0);
  color c4 = color(0,0,0);
  color c5 = color(255,255,255);
  color c6 = color(150,100,50);
  color c7 = color(150,255,0);
  color c8 = color(0,175,255);
  
  
  
  
  //   DRAW
  
  
  
  
  
  background (0,125,205);
  noStroke ();
  
  
  
  
  
  //   FLOATS
  
  
  
  
  
  a = a - vit*1+0.5;
  if (a < tcyl/16*13) { 
  a = a - vit*2+1;}
  if (a < tcyl/2) { 
  a = a - vit*3+1.5;}
  if (a < tcyl/15) { 
  a = tcyl;}
  
  b = b - vit*1+0.5;
  if (b < tcyl/16*13) { 
  b = b - vit*2+1;}
  if (b < tcyl/2) { 
  b = b - vit*3+1.5;}
  if (b < tcyl/15) { 
  b = tcyl;}
  
  c = c - vit*1+0.5;
  if (c < tcyl/16*13) { 
  c = c - vit*2+1;}
  if (c < tcyl/2) { 
  c = c - vit*3+1.5;}
  if (c < tcyl/15) { 
  c = tcyl;}
  
  d = d - vit*1+0.5;
  if (d < tcyl/16*13) { 
  d = d - vit*2+1;}
  if (d < tcyl/2) { 
  d = d - vit*3+1.5;}
  if (d < tcyl/15) { 
  d = tcyl;}
  
  e = e - vit*1+0.5;
  if (e < tcyl/16*13) { 
  e = e - vit*2+1;}
  if (e < tcyl/2) { 
  e = e - vit*3+1.5;}
  if (e < tcyl/15) { 
  e = tcyl;}
  
  f = f - vit*1+0.5;
  if (f < tcyl/16*13) { 
  f = f - vit*2+1;}
  if (f < tcyl/2) { 
  f = f - vit*3+1.5;}
  if (f < tcyl/15) { 
  f = tcyl;}
  
  g = g - vit*1+0.5;
  if (g < tcyl/16*13) { 
  g = g - vit*2+1;}
  if (g < tcyl/2) { 
  g = g - vit*3+1.5;}
  if (g < tcyl/15) { 
  g = tcyl;}
  
  
  
  
  
  //   TRUCS
  
  
  
  
  
  //   PH3
  
  
  
  
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,0+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,0+ecvn,ph3+e+echn,0-e+ecvn,ph4+e-echn,pv1-e-ecvn,ph4-echn,pv1-ecvn);
  ellipse (ph4+e-ech,pv1-e-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+e-ech,pv1-e-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv1+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv1+ecvn,ph3+d+echn,pv1-d+ecvn,ph4+d-echn,pv2-d-ecvn,ph4-echn,pv2-ecvn);
  ellipse (ph4+d-ech,pv2-d-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+d-ech,pv2-d-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv2+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv2+ecvn,ph3+c+echn,pv2-c+ecvn,ph4+c-echn,pv3-c-ecvn,ph4-echn,pv3-ecvn);
  ellipse (ph4+c-ech,pv3-c-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+c-ech,pv3-c-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv3+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv3+ecvn,ph3+b+echn,pv3-b+ecvn,ph4+b-echn,pv4-b-ecvn,ph4-echn,pv4-ecvn);
  ellipse (ph4+b-ech,pv4-b-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+b-ech,pv4-b-ecv,tch,tcv);
  
  //   centre
  stroke (c8);
  fill (c8);
  if (a > tcyl-20) {
  stroke (5,180,255);
  fill (5,180,255);}
  if (a > tcyl-15) {
  stroke (15,190,255);
  fill (15,190,255);}
  if (a > tcyl-10) {
  stroke (25,200,255);
  fill (25,200,255);}
  if (a > tcyl-5) {
  stroke (50,225,255);
  fill (50,225,255);}
  ellipse (ph3+ech,pv4+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv4+ecvn,ph3+a+echn,pv4-a+ecvn,ph4+a-echn,pv5-a-ecvn,ph4-echn,pv5-ecvn);
  ellipse (ph4+a-ech,pv5-a-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+a-ech,pv5-a-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv5+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv5+ecvn,ph3+b+echn,pv5-b+ecvn,ph4+b-echn,pv6-b-ecvn,ph4-echn,pv6-ecvn);
  ellipse (ph4+b-ech,pv6-b-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+b-ech,pv6-b-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv6+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv6+ecvn,ph3+c+echn,pv6-c+ecvn,ph4+c-echn,pv7-c-ecvn,ph4-echn,pv7-ecvn);
  ellipse (ph4+c-ech,pv7-c-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+c-ech,pv7-c-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv7+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv7+ecvn,ph3+d+echn,pv7-d+ecvn,ph4+d-echn,pv8-d-ecvn,ph4-echn,pv8-ecvn);
  ellipse (ph4+d-ech,pv8-d-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+d-ech,pv8-d-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv8+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv8+ecvn,ph3+e+echn,pv8-e+ecvn,ph4+e-echn,pv9-e-ecvn,ph4-echn,pv9-ecvn);
  ellipse (ph4+e-ech,pv9-e-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+e-ech,pv9-e-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv9+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv9+ecvn,ph3+f+echn,pv9-f+ecvn,ph4+f-echn,pv10-f-ecvn,ph4-echn,pv10-ecvn);
  ellipse (ph4+f-ech,pv10-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+f-ech,pv10-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv10+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv10+ecvn,ph3+f+echn,pv10-f+ecvn,ph4+f-echn,pv11-f-ecvn,ph4-echn,pv11-ecvn);
  ellipse (ph4+f-ech,pv11-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+f-ech,pv11-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv11+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv11+ecvn,ph3+f+echn,pv11-f+ecvn,ph4+f-echn,pv12-f-ecvn,ph4-echn,pv12-ecvn);
  ellipse (ph4+f-ech,pv12-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+f-ech,pv12-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph3+ech,pv12+ecv,width/nbdt,height/nbdt);
  quad (ph3+echn,pv12+ecvn,ph3+f+echn,pv12-f+ecvn,ph4+f-echn,pv13-f-ecvn,ph4-echn,pv13-ecvn);
  ellipse (ph4+f-ech,pv13-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph4+f-ech,pv13-f-ecv,tch,tcv);
  
  
  
  
  
  //PH2
  
  
  
  
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,0+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,0+ecvn,ph2+e+echn,0-e+ecvn,ph3+e-echn,pv1-e-ecvn,ph3-echn,pv1-ecvn);
  ellipse (ph3+f-ech,pv1-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+f-ech,pv1-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv1+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv1+ecvn,ph2+e+echn,pv1-e+ecvn,ph3+e-echn,pv2-e-ecvn,ph3-echn,pv2-ecvn);
  ellipse (ph3+e-ech,pv2-e-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+e-ech,pv2-e-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv2+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv2+ecvn,ph2+d+echn,pv2-d+ecvn,ph3+d-echn,pv3-d-ecvn,ph3-echn,pv3-ecvn);
  ellipse (ph3+d-ech,pv3-d-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+d-ech,pv3-d-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv3+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv3+ecvn,ph2+c+echn,pv3-c+ecvn,ph3+c-echn,pv4-c-ecvn,ph3-echn,pv4-ecvn);
  ellipse (ph3+c-ech,pv4-c-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+c-ech,pv4-c-ecv,tch,tcv);
  
  //   centre
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv4+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv4+ecvn,ph2+b+echn,pv4-b+ecvn,ph3+b-echn,pv5-b-ecvn,ph3-echn,pv5-ecvn);
  ellipse (ph3+b-ech,pv5-b-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+b-ech,pv5-b-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv5+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv5+ecvn,ph2+c+echn,pv5-c+ecvn,ph3+c-echn,pv6-c-ecvn,ph3-echn,pv6-ecvn);
  ellipse (ph3+c-ech,pv6-c-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+c-ech,pv6-c-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv6+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv6+ecvn,ph2+d+echn,pv6-d+ecvn,ph3+d-echn,pv7-d-ecvn,ph3-echn,pv7-ecvn);
  ellipse (ph3+d-ech,pv7-d-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+d-ech,pv7-d-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv7+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv7+ecvn,ph2+e+echn,pv7-e+ecvn,ph3+e-echn,pv8-e-ecvn,ph3-echn,pv8-ecvn);
  ellipse (ph3+e-ech,pv8-e-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+e-ech,pv8-e-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv8+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv8+ecvn,ph2+e+echn,pv8-e+ecvn,ph3+e-echn,pv9-e-ecvn,ph3-echn,pv9-ecvn);
  ellipse (ph3+f-ech,pv9-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+f-ech,pv9-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv9+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv9+ecvn,ph2+e+echn,pv9-e+ecvn,ph3+e-echn,pv10-e-ecvn,ph3-echn,pv10-ecvn);
  ellipse (ph3+f-ech,pv10-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+f-ech,pv10-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv10+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv10+ecvn,ph2+e+echn,pv10-e+ecvn,ph3+e-echn,pv11-e-ecvn,ph3-echn,pv11-ecvn);
  ellipse (ph3+f-ech,pv11-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+f-ech,pv11-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv11+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv11+ecvn,ph2+e+echn,pv11-e+ecvn,ph3+e-echn,pv12-e-ecvn,ph3-echn,pv12-ecvn);
  ellipse (ph3+f-ech,pv12-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+f-ech,pv12-f-ecv,tch,tcv);
  
  stroke (c8);
  fill (c8);
  ellipse (ph2+ech,pv12+ecv,width/nbdt,height/nbdt);
  quad (ph2+echn,pv12+ecvn,ph2+e+echn,pv12-e+ecvn,ph3+e-echn,pv13-e-ecvn,ph3-echn,pv13-ecvn);
  ellipse (ph3+f-ech,pv13-f-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph3+f-ech,pv13-f-ecv,tch,tcv);
  
  
  
  
  
  //PH1
  /*
  
  
  
  
  stroke (c8);
  fill (c8);
  ellipse (ph1+ech,pv4+ecv,width/nbdt,height/nbdt);
  quad (ph1+echn,pv4+ecvn,ph1+c+echn,pv4-c+ecvn,ph2+c-echn,pv5-c-ecvn,ph2-echn,pv5-ecvn);
  ellipse (ph2+c-ech,pv5-c-ecv,tch,tcv);
  stroke (255,150);
  fill (255,150);
  ellipse (ph2+c-ech,pv5-c-ecv,tch,tcv);
  
  */
  
  
}
