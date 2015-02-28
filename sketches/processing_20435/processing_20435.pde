

PImage cupcake01,cupcake02,cupcake03,cupcake04,cupcake05;
PImage cupcake06,cupcake07,cupcake08,cupcake09,cupcake10;
PImage cupcake11,cupcake12,cupcake13,cupcake14,cupcake15;
PImage cupcake16,cupcake17,cupcake18,cupcake19,cupcake20;
PImage cupcake21,cupcake22,cupcake23,cupcake24,cupcake25;
PImage cupcake26,cupcake27,cupcake28,cupcake29,cupcake30;
 
int r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24;
int r25,r26,r27,r28,r29,r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r40,r41,r42,r43,r44,r45,r46,r47,r48,r49;
int r50,r51,r52,r53,r54,r55,r56,r57,r58,r59;
int info;

  //s+mouseclick = scale images to 0.5
  //x+mouseclick = scale images to 0.3
  //any key(aside from s,x) = clear screen
 
 
 
void setup()
{
  size(640,480);
  background(0);
  cupcake01 = loadImage("cupcake01.jpg");
  cupcake02 = loadImage("cupcake02.jpg");
  cupcake03 = loadImage("cupcake03.jpg");
  cupcake04 = loadImage("cupcake04.jpg");
  cupcake05 = loadImage("cupcake05.jpg");
  cupcake06 = loadImage("cupcake06.jpg");
  cupcake07 = loadImage("cupcake07.jpg");
  cupcake08 = loadImage("cupcake08.jpg");
  cupcake09 = loadImage("cupcake09.jpg");
  cupcake10 = loadImage("cupcake10.jpg");
  cupcake11 = loadImage("cupcake11.jpg");
  cupcake12 = loadImage("cupcake12.jpg");
  cupcake13 = loadImage("cupcake13.jpg");
  cupcake14 = loadImage("cupcake14.jpg");
  cupcake15 = loadImage("cupcake15.jpg");
  cupcake16 = loadImage("cupcake16.jpg");
  cupcake17 = loadImage("cupcake17.jpg");
  cupcake18 = loadImage("cupcake18.jpg");
  cupcake19 = loadImage("cupcake19.jpg");
  cupcake20 = loadImage("cupcake20.jpg");
  cupcake21 = loadImage("cupcake21.jpg");
  cupcake22 = loadImage("cupcake22.jpg");
  cupcake23 = loadImage("cupcake23.jpg");
  cupcake24 = loadImage("cupcake24.jpg");
  cupcake25 = loadImage("cupcake25.jpg");
  cupcake26 = loadImage("cupcake26.jpg");
  cupcake27 = loadImage("cupcake27.jpg");
  cupcake28 = loadImage("cupcake28.jpg");
  cupcake29 = loadImage("cupcake29.jpg");
  cupcake30 = loadImage("cupcake30.jpg");
}
 
void draw()
{

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
  r50 = int(random(0,8));
  r51 = int(random(0,6));
  r52 = int(random(0,8));
  r53 = int(random(0,6));
  r54 = int(random(0,8));
  r55 = int(random(0,6));
  r56 = int(random(0,8));
  r57 = int(random(0,6));
  r58 = int(random(0,8));
  r59 = int(random(0,6));
  
  if(keyPressed == false){
  image(cupcake01, 80*r1,80*r2,100,100);
  image(cupcake02, 80*r3,80*r4,100,100);
  image(cupcake03, 80*r5,80*r6,100,100);
  image(cupcake04, 80*r7,80*r8,100,100);
  image(cupcake05, 80*r9,80*r10,100,100);
  image(cupcake06, 80*r11,80*r12,100,100);
  image(cupcake07, 80*r13,80*r14,100,100);
  image(cupcake08, 80*r15,80*r16,100,100);
  image(cupcake09, 80*r17,80*r18,100,100);
  image(cupcake10, 80*r19,80*r20,100,100);
  image(cupcake11, 80*r20,80*r21,100,100);
  image(cupcake12, 80*r22,80*r23,100,100);
  image(cupcake13, 80*r24,80*r25);
  image(cupcake14, 80*r26,80*r27);
  image(cupcake15, 80*r28,80*r29);
  image(cupcake16, 80*r30,80*r31);
  image(cupcake17, 80*r32,80*r33);
  image(cupcake18, 80*r34,80*r35);
  image(cupcake19, 80*r36,80*r37);
  image(cupcake20, 80*r38,80*r39);
  image(cupcake21, 80*r40,80*r41);
  image(cupcake22, 80*r42,80*r43);
  image(cupcake23, 80*r44,80*r45);
  image(cupcake24, 80*r46,80*r47);
  image(cupcake25, 80*r48,80*r49);
  image(cupcake26, 80*r50,80*r51);
  image(cupcake27, 80*r52,80*r53);
  image(cupcake28, 80*r54,80*r55);
  image(cupcake29, 80*r56,80*r57);
  image(cupcake30, 80*r58,80*r59);
  }
  
  if(info == 1 || key == 'i')
  {
    fill(0);
    rect(width/2,height/2,80,80);
    fill(255);
  }
  noLoop();
}
 
void keyPressed()
{
  if (key == 's')
  {
    pushMatrix();
    scale(0.5);
    translate(200,60);
    image(cupcake01, 40*r1*2,40*r2*2);
    image(cupcake02, 40*r3*2,40*r4*2);
    image(cupcake03, 40*r5*2,40*r6*2);
    image(cupcake04, 40*r7*2,40*r8*2);
    image(cupcake05, 40*r9*2,40*r10*2);
    image(cupcake06, 40*r11*2,40*r12*2);
    image(cupcake07, 40*r13*2,40*r14*2);
    image(cupcake08, 40*r15*2,40*r16*2);
    image(cupcake09, 40*r17*2,40*r18*2);
    image(cupcake10, 40*r19*2,40*r20*2);
    image(cupcake11, 40*r20*2,40*r21*2);
    image(cupcake12, 40*r22*2,40*r23*2);
    image(cupcake13, 40*r24*2,40*r25*2);
    image(cupcake14, 40*r26*2,40*r27*2);
    image(cupcake15, 40*r28*2,40*r29*2);
    image(cupcake16, 40*r30*2,40*r31*2);
    image(cupcake17, 40*r32*2,40*r33*2);
    image(cupcake18, 40*r34*2,40*r35*2);
    image(cupcake19, 40*r36*2,40*r37*2);
    image(cupcake20, 40*r38*2,40*r39*2);
    image(cupcake21, 40*r40*2,40*r41*2);
    image(cupcake22, 40*r42*2,40*r43*2);
    image(cupcake23, 40*r44*2,40*r45*2);
    image(cupcake24, 40*r46*2,40*r47*2);
    image(cupcake25, 40*r48*2,40*r49*2);
    image(cupcake26, 40*r50*2,40*r51*2);
    image(cupcake27, 40*r52*2,40*r53*2);
    image(cupcake28, 40*r54*2,40*r55*2);
    image(cupcake29, 40*r56*2,40*r57*2);
    image(cupcake30, 40*r58*2,40*r59*2);
    popMatrix();
  }
  else if (key == 'x') {
    pushMatrix();
    scale(0.3);
    translate(650,350);
    image(cupcake01, 80*r1,80*r2);
    image(cupcake02, 80*r3,80*r4);
    image(cupcake03, 80*r5,80*r6);
    image(cupcake04, 80*r7,80*r8);
    image(cupcake05, 80*r9,80*r10);
    image(cupcake06, 80*r11,80*r12);
    image(cupcake07, 80*r13,80*r14);
    image(cupcake08, 80*r15,80*r16);
    image(cupcake09, 80*r17,80*r18);
    image(cupcake10, 80*r19,80*r20);
    image(cupcake11, 80*r20,80*r21);
    image(cupcake12, 80*r22,80*r23);
    image(cupcake13, 80*r24,80*r25);
    image(cupcake14, 80*r26,80*r27);
    image(cupcake15, 80*r28,80*r29);
    image(cupcake16, 80*r30,80*r31);
    image(cupcake17, 80*r32,80*r33);
    image(cupcake18, 80*r34,80*r35);
    image(cupcake19, 80*r36,80*r37);
    image(cupcake20, 80*r38,80*r39);
    image(cupcake21, 80*r40,80*r41);
    image(cupcake22, 80*r42,80*r43);
    image(cupcake23, 80*r44,80*r45);
    image(cupcake24, 80*r46,80*r47);
    image(cupcake25, 80*r48,80*r49);
    image(cupcake26, 80*r50,80*r51);
    image(cupcake27, 80*r52,80*r53);
    image(cupcake28, 80*r54,80*r55);
    image(cupcake29, 80*r56,80*r57);
    image(cupcake30, 80*r58,80*r59);
    popMatrix();
  }
  else{
     
  fill(0);
  rect(0,0,640,480);
  fill(255);
  }
}
 
  void mousePressed()
  {
    redraw();
  }


