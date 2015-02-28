
void setup ()
{
  size (500,500);
  smooth ();
}
void draw ()
{
  
  background (0);
  strokeWeight (random (0,0));
  
  
  //   INT
  
  
  int phm2;
  phm2 = 0-width/10*2;
  int pvm2;
  pvm2 = 0-width/10*2;
  int phm1;
  phm1 = 0-width/10*1;
  int pvm1;
  pvm1 = 0-width/10*1;
  int ph1;
  ph1 = width/10*1;
  int pv1;
  pv1 = width/10*1;
  int ph2;
  ph2 = width/10*2;
  int pv2;
  pv2 = width/10*2;
  int ph3;
  ph3 = width/10*3;
  int pv3;
  pv3 = width/10*3;
  int ph4;
  ph4 = width/10*4;
  int pv4;
  pv4 = width/10*4;
  int ph5;
  ph5 = width/10*5;
  int pv5;
  pv5 = width/10*5;
  int ph6;
  ph6 = width/10*6;
  int pv6;
  pv6 = width/10*6;
  int ph7;
  ph7 = width/10*7;
  int pv7;
  pv7 = width/10*7;
  int ph8;
  ph8 = width/10*8;
  int pv8;
  pv8 = width/10*8;
  int ph9;
  ph9 = width/10*9;
  int pv9;
  pv9 = width/10*9;
  int ph10;
  ph10 = width/10*10;
  int pv10;
  pv10 = width/10*10;
  int pv11;
  pv11 = width/10*11;
  int pv12;
  pv12 = width/10*12;
  int pv13;
  pv13 = width/10*13;
  int pv14;
  pv14 = width/10*14;
  int pv15;
  pv15 = width/10*15;
  
  
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
  
  color c1 = color(255,0,0);
  color c2 = color(255,150,0);
  color c3 = color(255,255,0);
  color c4 = color(0,0,0);
  color c5 = color(255,255,255);
  color c6 = color(150,100,50);
  color c7 = color(150,255,0);
  
  
  
  
  //   DRAW
  
  
  
  
  //   PH7
  
  
  
  
  
  stroke (0,175,255);
  fill (0,175,255);
  rect (ph7,0,width/10,height/10);
  quad (ph7,0,ph7+height/mm2-m2,0-height/mm2+m2,ph8+height/mm2-m2,pv1-height/mm2+m2,ph8,pv1);
  ellipse (ph8+height/mm2-m2-(width/10/2),pv1-height/mm2+m2-(width/10/2),width/7,height/7);
  
  stroke (0);
  fill (0);
  rect (ph7,pv1,width/10,height/10);
  quad (ph7,pv1,ph7+height/mm1-m1,pv1-height/mm1+m1,ph8+height/mm1-m1,pv2-height/mm1+m1,ph8,pv2);
  ellipse (ph8+height/mm1-m1-(width/10/2),pv2-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (150,100,5);
  fill (150,100,5);
  rect (ph7,pv2,width/10,height/10);
  quad (ph7,pv2,ph7+height/mm3-m3,pv2-height/mm3+m3,ph8+height/mm3-m3,pv3-height/mm3+m3,ph8,pv3);
  ellipse (ph8+height/mm3-m3-(width/10/2),pv3-height/mm3+m3-(width/10/2),width/7,height/7);
  
  stroke (255);
  fill (255);
  rect (ph7,pv3,width/10,height/10);
  quad (ph7,pv3,ph7+height/mm4-m4,pv3-height/mm4+m4,ph8+height/mm4-m4,pv4-height/mm4+m4,ph8,pv4);
  ellipse (ph8+height/mm4-m4-(width/10/2),pv4-height/mm4+m4-(width/10/2),width/7,height/7);
  
  stroke (255,255,0);
  fill (255,255,0);
  rect (ph7,pv4,width/10,height/10);
  quad (ph7,pv4,ph7+height/mm5-m5,pv4-height/mm5+m5,ph8+height/mm5-m5,pv5-height/mm5+m5,ph8,pv5);
  ellipse (ph8+height/mm5-m5-(width/10/2),pv5-height/mm5+m5-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph7,pv5,width/10,height/10);
  quad (ph7,pv5,ph7+height/mm6-m6,pv5-height/mm6+m6,ph8+height/mm6-m6,pv6-height/mm6+m6,ph8,pv6);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv6-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (150,255,0);
  fill (150,255,0);
  rect (ph7,pv6,width/10,height/10);
  quad (ph7,pv6,ph7+height/mm4-m4,pv6-height/mm4+m4,ph8+height/mm4-m4,pv7-height/mm4+m4,ph8,pv7);
  ellipse (ph8+height/mm4-m4-(width/10/2),pv7-height/mm4+m4-(width/10/2),width/7,height/7);
  
  stroke (255,150,0);
  fill (255,150,0);
  rect (ph7,pv7,width/10,height/10);
  quad (ph7,pv7,ph7+height/mm1-m1,pv7-height/mm1+m1,ph8+height/mm1-m1,pv8-height/mm1+m1,ph8,pv8);
  ellipse (ph8+height/mm1-m1-(width/10/2),pv8-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (0,175,255);
  fill (0,175,255);
  rect (ph7,pv8,width/10,height/10);
  quad (ph7,pv8,ph7+height/mm1-m1,pv8-height/mm1+m1,ph8+height/mm1-m1,pv9-height/mm1+m1,ph8,pv9);
  ellipse (ph8+height/mm1-m1-(width/10/2),pv9-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (0);
  fill (0);
  rect (ph7,pv9,width/10,height/10);
  quad (ph7,pv9,ph7+height/mm6-m6,pv9-height/mm6+m6,ph8+height/mm6-m6,pv10-height/mm6+m6,ph8,pv10);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv10-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (150,100,50);
  fill (150,100,50);
  rect (ph7,pv10,width/10,height/10);
  quad (ph7,pv10,ph7+height/mm6-m6,pv10-height/mm6+m6,ph8+height/mm6-m6,pv11-height/mm6+m6,ph8,pv11);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv11-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255);
  fill (255);
  rect (ph7,pv11,width/10,height/10);
  quad (ph7,pv11,ph7+height/mm6-m6,pv11-height/mm6+m6,ph8+height/mm6-m6,pv12-height/mm6+m6,ph8,pv12);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv12-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255,255,0);
  fill (255,255,0);
  rect (ph7,pv12,width/10,height/10);
  quad (ph7,pv12,ph7+height/mm6-m6,pv12-height/mm6+m6,ph8+height/mm6-m6,pv13-height/mm6+m6,ph8,pv13);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv13-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph7,pv13,width/10,height/10);
  quad (ph7,pv13,ph7+height/mm6-m6,pv13-height/mm6+m6,ph8+height/mm6-m6,pv14-height/mm6+m6,ph8,pv14);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv14-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (150,255,0);
  fill (150,255,0);
  rect (ph7,pv14,width/10,height/10);
  quad (ph7,pv14,ph7+height/mm6-m6,pv14-height/mm6+m6,ph8+height/mm6-m6,pv15-height/mm6+m6,ph8,pv15);
  ellipse (ph8+height/mm6-m6-(width/10/2),pv15-height/mm6+m6-(width/10/2),width/7,height/7);
  
  
  
  
  
  //   PH6
  
  
  
  
  
  stroke (0,175,255);
  fill (0,175,255);
  rect (ph6,0,width/10,height/10);
  quad (ph6,0,ph6+height/mm2-m2,0-height/mm2+m2,ph7+height/mm2-m2,pv1-height/mm2+m2,ph7,pv1);
  ellipse (ph7+height/mm2-m2-(width/10/2),pv1-height/mm2+m2-(width/10/2),width/7,height/7);
  
  stroke (0);
  fill (0);
  rect (ph6,pv1,width/10,height/10);
  quad (ph6,pv1,ph6+height/mm1-m1,pv1-height/mm1+m1,ph7+height/mm1-m1,pv2-height/mm1+m1,ph7,pv2);
  ellipse (ph7+height/mm1-m1-(width/10/2),pv2-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (150,100,5);
  fill (150,100,5);
  rect (ph6,pv2,width/10,height/10);
  quad (ph6,pv2,ph6+height/mm3-m3,pv2-height/mm3+m3,ph7+height/mm3-m3,pv3-height/mm3+m3,ph7,pv3);
  ellipse (ph7+height/mm3-m3-(width/10/2),pv3-height/mm3+m3-(width/10/2),width/7,height/7);
  
  stroke (255);
  fill (255);
  rect (ph6,pv3,width/10,height/10);
  quad (ph6,pv3,ph6+height/mm4-m4,pv3-height/mm4+m4,ph7+height/mm4-m4,pv4-height/mm4+m4,ph7,pv4);
  ellipse (ph7+height/mm4-m4-(width/10/2),pv4-height/mm4+m4-(width/10/2),width/7,height/7);
  
  stroke (255,255,0);
  fill (255,255,0);
  rect (ph6,pv4,width/10,height/10);
  quad (ph6,pv4,ph6+height/mm5-m5,pv4-height/mm5+m5,ph7+height/mm5-m5,pv5-height/mm5+m5,ph7,pv5);
  ellipse (ph7+height/mm5-m5-(width/10/2),pv5-height/mm5+m5-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph6,pv5,width/10,height/10);
  quad (ph6,pv5,ph6+height/mm6-m6,pv5-height/mm6+m6,ph7+height/mm6-m6,pv6-height/mm6+m6,ph7,pv6);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv6-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (150,255,0);
  fill (150,255,0);
  rect (ph6,pv6,width/10,height/10);
  quad (ph6,pv6,ph6+height/mm4-m4,pv6-height/mm4+m4,ph7+height/mm4-m4,pv7-height/mm4+m4,ph7,pv7);
  ellipse (ph7+height/mm4-m4-(width/10/2),pv7-height/mm4+m4-(width/10/2),width/7,height/7);
  
  stroke (255,150,0);
  fill (255,150,0);
  rect (ph6,pv7,width/10,height/10);
  quad (ph6,pv7,ph6+height/mm1-m1,pv7-height/mm1+m1,ph7+height/mm1-m1,pv8-height/mm1+m1,ph7,pv8);
  ellipse (ph7+height/mm1-m1-(width/10/2),pv8-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (0,175,255);
  fill (0,175,255);
  rect (ph6,pv8,width/10,height/10);
  quad (ph6,pv8,ph6+height/mm1-m1,pv8-height/mm1+m1,ph7+height/mm1-m1,pv9-height/mm1+m1,ph7,pv9);
  ellipse (ph7+height/mm1-m1-(width/10/2),pv9-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (0);
  fill (0);
  rect (ph6,pv9,width/10,height/10);
  quad (ph6,pv9,ph6+height/mm6-m6,pv9-height/mm6+m6,ph7+height/mm6-m6,pv10-height/mm6+m6,ph7,pv10);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv10-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (150,100,50);
  fill (150,100,50);
  rect (ph6,pv10,width/10,height/10);
  quad (ph6,pv10,ph6+height/mm6-m6,pv10-height/mm6+m6,ph7+height/mm6-m6,pv11-height/mm6+m6,ph7,pv11);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv11-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255);
  fill (255);
  rect (ph6,pv11,width/10,height/10);
  quad (ph6,pv11,ph6+height/mm6-m6,pv11-height/mm6+m6,ph7+height/mm6-m6,pv12-height/mm6+m6,ph7,pv12);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv12-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255,255,0);
  fill (255,255,0);
  rect (ph6,pv12,width/10,height/10);
  quad (ph6,pv12,ph6+height/mm6-m6,pv12-height/mm6+m6,ph7+height/mm6-m6,pv13-height/mm6+m6,ph7,pv13);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv13-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph6,pv13,width/10,height/10);
  quad (ph6,pv13,ph6+height/mm6-m6,pv13-height/mm6+m6,ph7+height/mm6-m6,pv14-height/mm6+m6,ph7,pv14);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv14-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (150,255,0);
  fill (150,255,0);
  rect (ph6,pv14,width/10,height/10);
  quad (ph6,pv14,ph6+height/mm6-m6,pv14-height/mm6+m6,ph7+height/mm6-m6,pv15-height/mm6+m6,ph7,pv15);
  ellipse (ph7+height/mm6-m6-(width/10/2),pv15-height/mm6+m6-(width/10/2),width/7,height/7);
  
  
  
  
  
  //   PH5
  
  
  
  
  
  stroke (150,100,50);
  fill (150,100,50);
  rect (ph5,0,width/10,height/10);
  quad (ph5,0,ph5+height/mm4-m4,0-height/mm4+m4,ph6+height/mm4-m4,pv1-height/mm4+m4,ph6,pv1);
  ellipse (ph6+height/mm4-m4-(width/10/2),pv1-height/mm4+m4-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph5,pv1,width/10,height/10);
  quad (ph5,pv1,ph5+height/mm3-m3,pv1-height/mm3+m3,ph6+height/mm3-m3,pv2-height/mm3+m3,ph6,pv2);
  ellipse (ph6+height/mm3-m3-(width/10/2),pv2-height/mm3+m3-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph5,pv1,width/10,height/10);
  quad (ph5,pv1,ph5+height/mm5-m5,pv1-height/mm5+m5,ph6+height/mm5-m5,pv2-height/mm5+m5,ph6,pv2);
  ellipse (ph6+height/mm5-m5-(width/10/2),pv2-height/mm5+m5-(width/10/2),width/7,height/7);
  
  stroke (255,150,0);
  fill (255,150,0);
  rect (ph5,pv2,width/10,height/10);
  quad (ph5,pv2,ph5+height/mm1-m1,pv2-height/mm1+m1,ph6+height/mm1-m1,pv3-height/mm1+m1,ph6,pv3);
  ellipse (ph6+height/mm1-m1-(width/10/2),pv3-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (255,255,0);
  fill (255,255,0);
  rect (ph5,pv3,width/10,height/10);
  quad (ph5,pv3,ph5+height/mm2-m2,pv3-height/mm2+m2,ph6+height/mm2-m2,pv4-height/mm2+m2,ph6,pv4);
  ellipse (ph6+height/mm2-m2-(width/10/2),pv4-height/mm2+m2-(width/10/2),width/7,height/7);
  
  stroke (0);
  fill (0);
  rect (ph5,pv4,width/10,height/10);
  quad (ph5,pv4,ph5+height/mm3-m3,pv4-height/mm3+m3,ph6+height/mm3-m3,pv5-height/mm3+m3,ph6,pv5);
  ellipse (ph6+height/mm3-m3-(width/10/2),pv5-height/mm3+m3-(width/10/2),width/7,height/7);
  
  stroke (150,255,0);
  fill (150,255,0);
  rect (ph5,pv5,width/10,height/10);
  quad (ph5,pv5,ph5+height/mm2-m2,pv5-height/mm2+m2,ph6+height/mm2-m2,pv6-height/mm2+m2,ph6,pv6);
  ellipse (ph6+height/mm2-m2-(width/10/2),pv6-height/mm2+m2-(width/10/2),width/7,height/7);
  
  stroke (0,175,255);
  fill (0,175,225);
  rect (ph5,pv6,width/10,height/10);
  quad (ph5,pv6,ph5+height/mm6-m6,pv6-height/mm6+m6,ph6+height/mm6-m6,pv7-height/mm6+m6,ph6,pv7);
  ellipse (ph6+height/mm6-m6-(width/10/2),pv7-height/mm6+m6-(width/10/2),width/7,height/7);
  
  stroke (255);
  fill (255);
  rect (ph5,pv7,width/10,height/10);
  quad (ph5,pv7,ph5+height/mm2-m2,pv7-height/mm2+m2,ph6+height/mm2-m2,pv8-height/mm2+m2,ph6,pv8);
  ellipse (ph6+height/mm2-m2-(width/10/2),pv8-height/mm2+m2-(width/10/2),width/7,height/7);
  
  stroke (150,100,50);
  fill (150,100,50);
  rect (ph5,pv8,width/10,height/10);
  quad (ph5,pv8,ph5+height/mm5-m5,pv8-height/mm5+m5,ph6+height/mm5-m5,pv9-height/mm5+m5,ph6,pv9);
  ellipse (ph6+height/mm5-m5-(width/10/2),pv9-height/mm5+m5-(width/10/2),width/7,height/7);
  
  stroke (255,0,0);
  fill (255,0,0);
  rect (ph5,pv9,width/10,height/10);
  quad (ph5,pv9,ph5+height/mm5-m5,pv9-height/mm5+m5,ph6+height/mm5-m5,pv10-height/mm5+m5,ph6,pv10);
  ellipse (ph6+height/mm5-m5-(width/10/2),pv10-height/mm5+m5-(width/10/2),width/7,height/7);
  
  stroke (205,100,0);
  fill (205,100,0);
  rect (ph5,pv10,width/10,height/10);
  quad (ph5,pv10,ph5+height/mm4-m4,pv10-height/mm4+m4,ph6+height/mm4-m4,pv11-height/mm4+m4,ph6,pv11);
  ellipse (ph6+height/mm4-m4-(width/10/2),pv11-height/mm4+m4-(width/10/2),width/7,height/7);
  
  stroke (255,255,100);
  fill (255,255,100);
  rect (ph5,pv11,width/10,height/10);
  quad (ph5,pv11,ph5+height/mm1-m1,pv11-height/mm1+m1,ph6+height/mm1-m1,pv12-height/mm1+m1,ph6,pv12);
  ellipse (ph6+height/mm1-m1-(width/10/2),pv12-height/mm1+m1-(width/10/2),width/7,height/7);
  
  stroke (0);
  fill (0);
  rect (ph5,pv12,width/10,height/10);
  quad (ph5,pv12,ph5+height/mm5-m5,pv12-height/mm5+m5,ph6+height/mm5-m5,pv13-height/mm5+m5,ph6,pv13);
  ellipse (ph6+height/mm5-m5-(width/10/2),pv13-height/mm5+m5-(width/10/2),width/7,height/7);
  
  stroke (150,255,0);
  fill (150,255,0);
  rect (ph5,pv13,width/10,height/10);
  quad (ph5,pv13,ph5+height/mm2-m2,pv13-height/mm2+m2,ph6+height/mm2-m2,pv14-height/mm2+m2,ph6,pv14);
  ellipse (ph6+height/mm2-m2-(width/10/2),pv14-height/mm2+m2-(width/10/2),width/7,height/7);
  
  stroke (0,175,255);
  fill (0,175,255);
  rect (ph5,pv14,width/10,height/10);
  quad (ph5,pv14,ph5+height/mm3-m3,pv14-height/mm3+m3,ph6+height/mm3-m3,pv15-height/mm3+m3,ph6,pv15);
  ellipse (ph6+height/mm3-m3-(width/10/2),pv15-height/mm3+m3-(width/10/2),width/7,height/7);
  
  
}
