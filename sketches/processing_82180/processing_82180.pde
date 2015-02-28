
PImage BG, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25;

int r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r40,r41,r42,r43,r44,r45,r46,r47,r48,r49;

int info;
  
void setup()
{
  size(400,400);
  BG = loadImage("back.JPG");
  p1 = loadImage("1.JPG");
  p2 = loadImage("2.JPG");
  p3 = loadImage("3.JPG");
  p4 = loadImage("4.JPG");
  p5 = loadImage("5.JPG");
  p6 = loadImage("6.JPG");
  p7 = loadImage("7.JPG");
  p8 = loadImage("8.JPG");
  p9 = loadImage("9.JPG");
  p10 = loadImage("1.JPG");
  p11 = loadImage("2.JPG");
  p12 = loadImage("3.JPG");
  p13 = loadImage("4.JPG");
  p14 = loadImage("5.JPG");
  p15 = loadImage("6.JPG");
  p16 = loadImage("7.JPG");
  p17 = loadImage("9.JPG");
  p18 = loadImage("8.JPG");
  p19 = loadImage("1.JPG");
  p20 = loadImage("2.JPG");
  p21 = loadImage("4.JPG");
  p22 = loadImage("6.JPG");
  p23 = loadImage("7.JPG");
  p24 = loadImage("3.JPG");
  p25 = loadImage("9.JPG");
}
 
void draw()
{
  background (BG);
  info = int(random(0,100));
  r1 = int(random(0,8));
  r2 = int(random(0,6));
  r3 = int(random(0,8));
  r4 = int(random(0,6));
  r5 = int(random(0,8));
  r6 = int(random(0,6));
  r7 = int(random(0,8));
  r8 = int(random(0,6));
  r9 = int(random(0,8));
  r10 = int(random(0,6));
  r11 = int(random(0,8));
  r12 = int(random(0,6));
  r13 = int(random(0,8));
  r14 = int(random(0,6));
  r15 = int(random(0,8));
  r16 = int(random(0,6));
  r17 = int(random(0,8));
  r18 = int(random(0,6));
  r19 = int(random(0,8));
  r20 = int(random(0,6));
  r21 = int(random(0,8));
  r22 = int(random(0,6));
  r23 = int(random(0,8));
  r24 = int(random(0,6));
  r25 = int(random(0,8));
  r26 = int(random(0,6));
  r27 = int(random(0,8));
  r28 = int(random(0,6));
  r29 = int(random(0,8));
  r30 = int(random(0,6));
  r31 = int(random(0,8));
  r32 = int(random(0,6));
  r33 = int(random(0,6));
  r34 = int(random(0,8));
  r35 = int(random(0,6));
  r36 = int(random(0,8));
  r37 = int(random(0,6));
  r38 = int(random(0,8));
  r39 = int(random(0,6));
  r40 = int(random(0,8));
  r41 = int(random(0,6));
  r42 = int(random(0,8));
  r43 = int(random(0,6));
  r44 = int(random(0,8));
  r45 = int(random(0,6));
  r46 = int(random(0,8));
  r47 = int(random(0,6));
  r48 = int(random(0,8));
  r49 = int(random(0,6));

  
  if(keyPressed == false){
  image(p1, 80*r1,80*r2);
  image(p2, 80*r3,80*r4);
  image(p3, 80*r5,80*r6);
  image(p4, 80*r7,80*r8);
  image(p5, 80*r9,80*r10);
  image(p6, 80*r11,80*r12);
  image(p7, 80*r13,80*r14);
  image(p8, 80*r15,80*r16);
  image(p9, 80*r17,80*r18);
  image(p10, 80*r19,80*r20);
  image(p11, 80*r20,80*r21);
  image(p12, 80*r22,80*r23);
  image(p13, 80*r24,80*r25);
  image(p14, 80*r26,80*r27);
  image(p15, 80*r28,80*r29);
  image(p16, 80*r30,80*r31);
  image(p17, 80*r32,80*r33);
  image(p18, 80*r34,80*r35);
  image(p19, 80*r36,80*r37);
  image(p20, 80*r38,80*r39);
  image(p21, 80*r40,80*r41);
  image(p22, 80*r42,80*r43);
  image(p23, 80*r44,80*r45);
  image(p24, 80*r46,80*r47);
  image(p25, 80*r48,80*r49);
  
  }
  if(info == 0 || key == ' ')
  {
    fill(0);
    rect(width/2,height/2,80,80);
    fill(255);
  }
  noLoop();
}
 
void keyPressed()
{
  if (key == ' ')
  {
    pushMatrix();
    scale(0.5);
    translate(320,160);
    image(p1, 40*r1*2,40*r2*2);
    image(p2, 40*r3*2,40*r4*2);
    image(p3, 40*r5*2,40*r6*2);
    image(p4, 40*r7*2,40*r8*2);
    image(p5, 40*r9*2,40*r10*2);
    image(p6, 40*r11*2,40*r12*2);
    image(p7, 40*r13*2,40*r14*2);
    image(p8, 40*r15*2,40*r16*2);
    image(p9, 40*r17*2,40*r18*2);
    image(p10, 40*r19*2,40*r20*2);
    image(p11, 40*r20*2,40*r21*2);
    image(p12, 40*r22*2,40*r23*2);
    image(p13, 40*r24*2,40*r25*2);
    image(p14, 40*r26*2,40*r27*2);
    image(p15, 40*r28*2,40*r29*2);
    image(p16, 40*r30*2,40*r31*2);
    image(p17, 40*r32*2,40*r33*2);
    image(p18, 40*r34*2,40*r35*2);
    image(p19, 40*r36*2,40*r37*2);
    image(p20, 40*r38*2,40*r39*2);
    image(p21, 40*r40*2,40*r41*2);
    image(p22, 40*r42*2,40*r43*2);
    image(p23, 40*r44*2,40*r45*2);
    image(p24, 40*r46*2,40*r47*2);
    image(p25, 40*r48*2,40*r49*2);
    popMatrix();
  }
  else if (key == ' ') {
    pushMatrix();
    scale(4);
    image(p1, 80*r1,80*r2);
    image(p2, 80*r3,80*r4);
    image(p3, 80*r5,80*r6);
    image(p4, 80*r7,80*r8);
    image(p5, 80*r9,80*r10);
    image(p6, 80*r11,80*r12);
    image(p7, 80*r13,80*r14);
    image(p8, 80*r15,80*r16);
    image(p9, 80*r17,80*r18);
    image(p10, 80*r19,80*r20);
    image(p11, 80*r20,80*r21);
    image(p12, 80*r22,80*r23);
    image(p13, 80*r24,80*r25);
    image(p14, 80*r26,80*r27);
    image(p15, 80*r28,80*r29);
    image(p16, 80*r30,80*r31);
    image(p17, 80*r32,80*r33);
    image(p18, 80*r34,80*r35);
    image(p19, 80*r36,80*r37);
    image(p20, 80*r38,80*r39);
    image(p21, 80*r40,80*r41);
    image(p22, 80*r42,80*r43);
    image(p23, 80*r44,80*r45);
    image(p24, 80*r46,80*r47);
    image(p25, 80*r48,80*r49);
    popMatrix();
  }
  else{
     
  fill(0);
  rect(0,0,400,400);
  fill(255);
  }
}
 
  void mousePressed()  {
    redraw();
  }



