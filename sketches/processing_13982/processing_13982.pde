
//PROJECT III: COLLAGE
//Author: Stephen Ou


PImage lennon_warhol,george_warhol,ringo_warhol,paul_warhol;
PImage Che_purp,Che_red;
PImage lennon_ry,paul_yb,ringo_yb,george_bp;
PImage mau_warhol_b, mau_warhol_p, mau_warhol_r;
PImage monroe_pink_warhol,monroe_warhol_pp, nixon, queen, uncle_sam, jim_mor, jim_mor2, liberty;

int r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24;
int r25,r26,r27,r28,r29,r30,r31,r32,r33,r34,r35,r36,r37,r38,r39,r40,r41,r42,r43;
int info;

PFont hel;




void setup()
{
  hel = loadFont("Helvetica-11.vlw");
  textAlign(CENTER);
  size(640,480);
  background(0);
  lennon_warhol = loadImage("lennon_warhol.jpg");
  george_warhol = loadImage("george_warhol.jpg");
  ringo_warhol = loadImage("ringo_warhol.jpg");
  paul_warhol = loadImage("paul_warhol.jpg");
  Che_purp = loadImage("Che_purp.jpg");
  Che_red = loadImage("Che_red.jpg");
  lennon_ry = loadImage("lennon_ry.jpg");
  paul_yb = loadImage("paul_yb.jpg");
  ringo_yb = loadImage("ringo_yb.jpg");
  george_bp = loadImage("george_bp.jpg");
  jim_mor = loadImage("jim_mor.jpg");
  jim_mor2 = loadImage("jim_mor2.jpg");
  liberty = loadImage("liberty.jpg");
  mau_warhol_b = loadImage("mau_warhol_b.jpg");
  mau_warhol_p = loadImage("mau_warhol_p.jpg");
  mau_warhol_r = loadImage("mau_warhol_r.jpg");
  monroe_pink_warhol = loadImage("monroe_pink_warhol.jpg");
  monroe_warhol_pp = loadImage("monroe_warhol_pp.jpg");
  nixon = loadImage("nixon.jpg");
  queen = loadImage("queen.jpg");
  uncle_sam = loadImage("uncle_sam.jpg");
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
  if(keyPressed == false){
  image(lennon_warhol, 80*r1,80*r2);
  image(george_warhol, 80*r3,80*r4);
  image(ringo_warhol, 80*r5,80*r6);
  image(paul_warhol, 80*r7,80*r8);
  image(Che_purp, 80*r9,80*r10);
  image(Che_red, 80*r11,80*r12);
  image(lennon_ry, 80*r13,80*r14);
  image(paul_yb, 80*r15,80*r16);
  image(ringo_yb, 80*r17,80*r18);
  image(george_bp, 80*r19,80*r20);
  image(jim_mor, 80*r20,80*r21);
  image(jim_mor2, 80*r22,80*r23);
  image(liberty, 80*r24,80*r25);
  image(mau_warhol_b, 80*r26,80*r27);
  image(mau_warhol_p, 80*r28,80*r29);
  image(mau_warhol_r, 80*r30,80*r31);
  image(monroe_pink_warhol, 80*r32,80*r33);
  image(monroe_warhol_pp, 80*r34,80*r35);
  image(nixon, 80*r36,80*r37);
  image(queen, 80*r38,80*r39);
  image(uncle_sam, 80*r40,80*r41);
  }
  if(info == 1 || key == 'i')
  {
    fill(0);
    rect(width/2,height/2,80,80);
    fill(255);
    textFont(hel);
    text("ANYKEY +     MOUSE =      INFO", width/2+10,height/2+10,80,80);
  }
  noLoop();
}

void keyPressed()
{
  if (key == 'r')
  {
    pushMatrix();
    scale(0.5);
    translate(320,160);
    image(lennon_warhol, 40*r1*2,40*r2*2);
    image(george_warhol, 40*r3*2,40*r4*2);
    image(ringo_warhol, 40*r5*2,40*r6*2);
    image(paul_warhol, 40*r7*2,40*r8*2);
    image(Che_purp, 40*r9*2,40*r10*2);
    image(Che_red, 40*r11*2,40*r12*2);
    image(lennon_ry, 40*r13*2,40*r14*2);
    image(paul_yb, 40*r15*2,40*r16*2);
    image(ringo_yb, 40*r17*2,40*r18*2);
    image(george_bp, 40*r19*2,40*r20*2);
    image(jim_mor, 40*r20*2,40*r21*2);
    image(jim_mor2, 40*r22*2,40*r23*2);
    image(liberty, 40*r24*2,40*r25*2);
    image(mau_warhol_b, 40*r26*2,40*r27*2);
    image(mau_warhol_p, 40*r28*2,40*r29*2);
    image(mau_warhol_r, 40*r30*2,40*r31*2);
    image(monroe_pink_warhol, 40*r32*2,40*r33*2);
    image(monroe_warhol_pp, 40*r34*2,40*r35*2);
    image(nixon, 40*r36*2,40*r37*2);
    image(queen, 40*r38*2,40*r39*2);
    image(uncle_sam, 40*r40*2,40*r41*2);
    popMatrix();
  }
  else if (key == ' ') {
    pushMatrix();
    scale(2);
    image(lennon_warhol, 80*r1,80*r2);
    image(george_warhol, 80*r3,80*r4);
    image(ringo_warhol, 80*r5,80*r6);
    image(paul_warhol, 80*r7,80*r8);
    image(Che_purp, 80*r9,80*r10);
    image(Che_red, 80*r11,80*r12);
    image(lennon_ry, 80*r13,80*r14);
    image(paul_yb, 80*r15,80*r16);
    image(ringo_yb, 80*r17,80*r18);
    image(george_bp, 80*r19,80*r20);
    image(jim_mor, 80*r20,80*r21);
    image(jim_mor2, 80*r22,80*r23);
    image(liberty, 80*r24,80*r25);
    image(mau_warhol_b, 80*r26,80*r27);
    image(mau_warhol_p, 80*r28,80*r29);
    image(mau_warhol_r, 80*r30,80*r31);
    image(monroe_pink_warhol, 80*r32,80*r33);
    image(monroe_warhol_pp, 80*r34,80*r35);
    image(nixon, 80*r36,80*r37);
    image(queen, 80*r38,80*r39);
    image(uncle_sam, 80*r40,80*r41);
    popMatrix();
  }
  else{
    
  fill(0);
  rect(0,0,640,480);
  fill(255);
  text("R+click = HALF | SPACEBAR+click = DOUBLE | ANYKEY+click = CLEAR", width/2,height/2);
  }
}

  void mousePressed()
  {
    redraw();
  }


