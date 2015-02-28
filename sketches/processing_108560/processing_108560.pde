
float x, y, s, q, w;
float vx, vy;
float o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, o19, o20, o21, o22, o23, o24, o25, o26, o27, o28, o29, o30, o31, o32, o33, o34, o35, o36, o37, o38, o39, o40, o41, o42, o43, o44, o45, o46, o47, o48, o49, o50, o51, o52, o53, o54, o55, o56, o57, o58, o59, p, p2, p3, p4, p5, p6;
float vo1, vo2, vo3, vo4, vo5, vo6, vo7, vo8, vo9, vo10, vo11, vo12, vo13, vo14, vo15, vo16, vo17, vo18, vo19, vo20, vo21, vo22, vo23, vo24, vo25, vo26, vo27, vo28, vo29, vo30, vo31, vo32, vo33, vo34, vo35, vo36, vo37, vo38, vo39, vo40, vo41, vo42, vo43, vo44, vo45, vo46, vo47, vo48, vo49, vo50, vo51, vo52, vo53, vo54, vo55, vo56, vo57, vo58, vo59, vp, vp2, vp3, vp4, vp5, vp6;

void setup() {
  size(450, 600);
  x = width/2-50 ;
  y = 100 ;
  s = 370 ;
  o1 = width/2 ;
  o2 = width/2 ;
  o3 = width/2 ;
  o4 = width/2 ;
  o5 = width/2 ;
  o6 = width/2 ;
  o7 = width/2 ;
  o8 = width/2 ;
  o9 = width/2 ;
  o10 = width/2 ;
  o11 = width/2 ;
  o12 = width/2 ;
  o13 = width/2 ;
  o14 = width/2 ;
  o15 = width/2 ;
  o16 = width/2 ;
  o17 = width/2 ;
  o18 = width/2 ;
  o19 = width/2 ;
  o20 = width/2 ;
  o21 = width/2 ;
  o22 = width/2 ;
  o23 = width/2 ;
  o24 = width/2 ;
  o25 = width/2 ;
  o26 = width/2 ;
  o27 = width/2 ;
  o28 = width/2 ;
  o29 = width/2 ;
  o30 = width/2;
  o31 = width/2 ;
  o32 = width/2 ;
  o33 = width/2 ;
  o34 = width/2 ;
  o35 = width/2 ;
  o36 = width/2 ;
  o37 = width/2 ;
  o38 = width/2 ;
  o39 = width/2 ;
  o40 = width/2;
  o41 = width/2 ;
  o42 = width/2 ;
  o43 = width/2 ;
  o44 = width/2 ;
  o45 = width/2 ;
  o46 = width/2 ;
  o47 = width/2 ;
  o48 = width/2 ;
  o49 = width/2 ;
  o50 = width/2;
  o51 = width/2 ;
  o52 = width/2 ;
  o53 = width/2 ;
  o54 = width/2 ;
  o55 = width/2 ;
  o56 = width/2 ;
  o57 = width/2 ;
  o58 = width/2 ;
  o59 = width/2 ;
  p = y ;
  vy = 0.7 ;
  vo1 = 0 ;
  vo2 = 0.5 ;
  vo3 = 1 ;
  vo4 = 1.5 ;
  vo5 = 2 ;
  vo6 = -0.5 ;
  vo7 = -1 ;
  vo8 = -1.5 ;
  vo9 = -2 ;
  vo10 = -1.3 ;
  vo11=0.2;
  vo12=0.7; 
  vo13=1.3; 
  vo14=1.7; 
  vo15=2.2 ;
  vo16=-0.2 ;
  vo17=-0.7 ;
  vo18=-1.3 ;
  vo19=-1.7;
  vo20 = 0.1; 
  vo21 = -0.2 ;
  vo22 = 0.3 ;
  vo23 = 0.8 ;
  vo24 = 1.1 ;
  vo25 = 1.9 ;
  vo26 = -0.8 ;
  vo27 = -1.2 ;
  vo28 = -1.6 ;
  vo29 = -2.1 ;
  vo30 = 0.4;
  vo31 = -0.4 ;
  vo32 = 0.9 ;
  vo33 = 1.4 ;
  vo34 = 1.9 ;
  vo35 = 2.5 ;
  vo36 = -0.9 ;
  vo37 = -1.4 ;
  vo38 = -1.9 ;
  vo39 = -2.3 ;
  vo40 = 0.6;
  vo41 = 1.3 ;
  vo42 = 1.8 ;
  vo43 = 2.4 ;
  vo44 = 2.8 ;
  vo45 = 3.2 ;
  vo46 = -0.1 ;
  vo47 = -0.8 ;
  vo48 = -1.7 ;
  vo49 = -2.2 ;
  vo50 = 0.1;
  vo51 = 0.5 ;
  vo52 = 0.9 ;
  vo53 = 1.3 ;
  vo54 = 1.6 ;
  vo55 = 2 ;
  vo56 = -0.7 ;
  vo57 = -1.2 ;
  vo58 = -1.4 ;
  vo59 = -2.1 ;
  vp = 2.5 ;
  vp2 = 2.3 ;
  vp3 = 2.1 ;
  vp4 = 1.9;
  vp5 = 1.7;
  vp6 = 1.5;
  p2 = y;
  p3 = y;
  p4 = y;
  p5 = y;
  p6 = y;
  q = 255;
  w = 255;
}

void draw() {
  noCursor();
  background(0);
  
  stroke(#ffffff);
  noFill();
  enemyBullet(int(o1), int(p));
  enemyBullet(int(o2), int(p));
  enemyBullet(int(o3), int(p));
  enemyBullet(int(o4), int(p));
  enemyBullet(int(o5), int(p));
  enemyBullet(int(o6), int(p));
  enemyBullet(int(o7), int(p));
  enemyBullet(int(o8), int(p));
  enemyBullet(int(o9), int(p));
  enemyBullet(int(o10), int(p2));
  enemyBullet(int(o11), int(p2));
  enemyBullet(int(o12), int(p2));
  enemyBullet(int(o13), int(p2));
  enemyBullet(int(o14), int(p2));
  enemyBullet(int(o15), int(p2));
  enemyBullet(int(o16), int(p2));
  enemyBullet(int(o17), int(p2));
  enemyBullet(int(o18), int(p2));
  enemyBullet(int(o19), int(p2));
  enemyBullet(int(o20), int(p3));
  enemyBullet(int(o21), int(p3));
  enemyBullet(int(o22), int(p3));
  enemyBullet(int(o23), int(p3));
  enemyBullet(int(o24), int(p3));
  enemyBullet(int(o25), int(p3));
  enemyBullet(int(o26), int(p3));
  enemyBullet(int(o27), int(p3));
  enemyBullet(int(o28), int(p3));
  enemyBullet(int(o29), int(p3));
  enemyBullet(int(o30), int(p4));
  enemyBullet(int(o31), int(p4));
  enemyBullet(int(o32), int(p4));
  enemyBullet(int(o33), int(p4));
  enemyBullet(int(o34), int(p4));
  enemyBullet(int(o35), int(p4));
  enemyBullet(int(o36), int(p4));
  enemyBullet(int(o37), int(p4));
  enemyBullet(int(o38), int(p4));
  enemyBullet(int(o39), int(p4));
  enemyBullet(int(o40), int(p5));
  enemyBullet(int(o41), int(p5));
  enemyBullet(int(o42), int(p5));
  enemyBullet(int(o43), int(p5));
  enemyBullet(int(o44), int(p5));
  enemyBullet(int(o45), int(p5));
  enemyBullet(int(o46), int(p5));
  enemyBullet(int(o47), int(p5));
  enemyBullet(int(o48), int(p5));
  enemyBullet(int(o49), int(p5));
  enemyBullet(int(o50), int(p6));
  enemyBullet(int(o51), int(p6));
  enemyBullet(int(o52), int(p6));
  enemyBullet(int(o53), int(p6));
  enemyBullet(int(o54), int(p6));
  enemyBullet(int(o55), int(p6));
  enemyBullet(int(o56), int(p6));
  enemyBullet(int(o57), int(p6));
  enemyBullet(int(o58), int(p6));
  enemyBullet(int(o59), int(p6));
  o1 = o1 + vo1;
  o2 = o2 + vo2;
  o3 = o3 + vo3;
  o4 = o4 + vo4;
  o5 = o5 + vo5;
  o6 = o6 + vo6;
  o7 = o7 + vo7;
  o8 = o8 + vo8;
  o9 = o9 + vo9;
  
  o10 = o10 + vo10;
  o11 = o11 + vo11;
  o12 = o12 + vo12;
  o13 = o13 + vo13;
  o14 = o14 + vo14;
  o15 = o15 + vo15;
  o16 = o16 + vo16;
  o17 = o17 + vo17;
  o18 = o18 + vo18;
  o19 = o19 + vo19;
  o20 = o20 + vo20;
  
  o21 = o21 + vo21;
  o22 = o22 + vo22;
  o23 = o23 + vo23;
  o24 = o24 + vo24;
  o25 = o25 + vo25;
  o26 = o26 + vo26;
  o27 = o27 + vo27;
  o28 = o28 + vo28;
  o29 = o29 + vo29;
  
  o30 = o30 + vo30;
  o31 = o31 + vo31;
  o32 = o32 + vo32;
  o33 = o33 + vo33;
  o34 = o34 + vo34;
  o35 = o35 + vo35;
  o36 = o36 + vo36;
  o37 = o37 + vo37;
  o38 = o38 + vo38;
  o39 = o39 + vo39;
  
  o40 = o40 + vo40;
  o41 = o41 + vo41;
  o42 = o42 + vo42;
  o43 = o43 + vo43;
  o44 = o44 + vo44;
  o45 = o45 + vo45;
  o46 = o46 + vo46;
  o47 = o47 + vo47;
  o48 = o48 + vo48;
  o49 = o49 + vo49;
  
  o50 = o50 + vo50;
  o51 = o51 + vo51;
  o52 = o52 + vo52;
  o53 = o53 + vo53;
  o54 = o54 + vo54;
  o55 = o55 + vo55;
  o56 = o56 + vo56;
  o57 = o57 + vo57;
  o58 = o58 + vo58;
  o59 = o59 + vo59;
  
  
  
  p = p + vp;
  p2 = p2 + vp2;
  p3 = p3 + vp3;
  p4 = p4 + vp4;
  p5 = p5 + vp5;
  p6 = p6 + vp6;
  
  if (p>660) {
    p = 150;
    o1 = width/2 ;
    o2 = width/2 ;
    o3 = width/2 ;
    o4 = width/2 ;
    o5 = width/2 ;
    o6 = width/2 ;
    o7 = width/2 ;
    o8 = width/2 ;
    o9 = width/2 ;
  }
  if (p2>650) {
    p2 = 150;
    o10 = width/2 ;
    o11 = width/2 ;
    o12 = width/2 ;
    o13 = width/2 ;
    o14 = width/2 ;
    o15 = width/2 ;
    o16 = width/2 ;
    o17 = width/2 ;
    o18 = width/2 ;
    o19 = width/2 ;
  }
  if (p3>640) {
    p3 = 150;
    o20 = width/2 ; 
    o21 = width/2 ;
    o22 = width/2 ;
    o23 = width/2 ;
    o24 = width/2 ;
    o25 = width/2 ;
    o26 = width/2 ;
    o27 = width/2 ;
    o28 = width/2 ;
    o29 = width/2 ;
  }
  if (p4>630) {
    p4 = 150;
    o30 = width/2 ;
    o31 = width/2 ;
    o32 = width/2 ;
    o33 = width/2 ;
    o34 = width/2 ;
    o35 = width/2 ;
    o36 = width/2 ;
    o37 = width/2 ;
    o38 = width/2 ;
    o39 = width/2 ;
  }
  if (p5>620) {
    p5 = 150;
    o40 = width/2;
    o41 = width/2 ;
    o42 = width/2 ;
    o43 = width/2 ;
    o44 = width/2 ;
    o45 = width/2 ;
    o46 = width/2 ;
    o47 = width/2 ;
    o48 = width/2 ;
    o49 = width/2 ;
  }
   if (p6>610) {
    p6 = 150;
    o50 = width/2 ;
    o51 = width/2 ;
    o52 = width/2 ;
    o53 = width/2 ;
    o54 = width/2 ;
    o55 = width/2 ;
    o56 = width/2 ;
    o57 = width/2 ;
    o58 = width/2 ;
    o59 = width/2 ;
  }  
    
  chara(int(x), int(y));
  x = x ;
  y = y + vy ;
  if (y<90) vy = -vy;
  if (y>110) vy = -vy;
  
  stroke(255,255,255, w);
  noFill();
  triangle(mouseX, mouseY -7, mouseX -10, mouseY +7, mouseX +10, mouseY +7);
  if (mousePressed) { 
    line(mouseX, mouseY - 7, mouseX, 0); // draw beam
  }
  
  noStroke();
  fill(255, 0, 0);
  rect(60, 10, s, 15);
  
  stroke(#ffffff);
  fill(#ffffff);
  textSize(20);
  text("BOSS", 5, 23);
  
  if((mouseX>170)&&(mouseX<270)&&(mousePressed)){
    s = s -2;
  }
  
  if(s<0){
    s = 0;}
  
  if(s<60){
    q = q -2 ;
  }
  
  if(q<0){
    q = 0;}
    
  /*if((enemyBullet>mouseX+10)&&(enemyBullet<mouseX-10)){
    w = w -1;
  }  
  
  if(w<0){
    w=0;
  }*/
}
void chara(int a,int b){

  pushMatrix();
  
  translate(a, b);

  //out line
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(247, 247, 247, q);
  ellipse(50, 40, 80, 80);
  //under teeth
  stroke(0, 0, 0);
  rect(22, b-15 , 5, 27);
  rect(72, b-15 , 5, 27);
  rect(25, b , 50, 15);
  line(32, b , 32, b+8 );
  line(40, b , 40, b+8 );
  line(50, b , 50, b+8 );
  line(60, b , 60, b+8 );
  line(68, b , 68, b+8 );
  //under teeth eraser
  stroke(#ffffff, q);
  fill(#ffffff, q);
  rect(23, b , 3, 11);
  rect(73, b , 3, 11);
  //cheek
  stroke(0, 0, 0);
  ellipse(20, 70, 23, 23);
  ellipse(80, 70, 23, 23);
  //cheek eraser
  stroke(#ffffff, q);
  fill(#ffffff, q);
  ellipse(26, 64, 23, 23);
  stroke(#ffffff, q);
  fill(#ffffff, q);
  ellipse(74, 64, 23, 23);
  //eyes
  stroke(0, 0, 0, q);
  fill(80, 80, 80, q);
  ellipse(32, 60, 23, 23);
  ellipse(69, 60, 23, 23);
  //nose
  fill(80, 80, 80, q);
  triangle(53, 64, 53, 74, 58, 74);
  triangle(47, 64, 47, 74, 42, 74);
  //teeth
  fill(#ffffff, q);
  rect(30, 76, 39, 15);
  line(40, 82, 40, 91);
  line(50, 82, 50, 91);
  line(60, 82, 60, 91);
  //teeth eraser
  stroke(#ffffff, q);
  fill(#ffffff, q);
  rect(31, 75, 37, 2);
  
  
  popMatrix();

}

void enemyBullet(int c, int d){

  pushMatrix();

    ellipse(c, d, 10, 10);
  
  popMatrix();
  
  }


