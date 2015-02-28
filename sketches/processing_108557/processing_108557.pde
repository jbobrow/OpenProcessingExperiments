
float x, y;
float vx, vy;
float o1, o2, o3, o4, o5, o6, o7, o8, o9, p, p2;
float vo1, vo2, vo3, vo4, vo5, vo6, vo7, vo8, vo9, vp, vp2;

void setup() {
  size(450, 600);
  x = width/2-50 ;
  y = 100 ;
  o1 = width/2 ;
  o2 = width/2 ;
  o3 = width/2 ;
  o4 = width/2 ;
  o5 = width/2 ;
  o6 = width/2 ;
  o7 = width/2 ;
  o8 = width/2 ;
  o9 = width/2 ;
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
  vp = 2.5 ;
  vp2 = 2.3 ;
  p2 = y;
}

void draw() {
  noCursor();
  background(0);
  
  enemyBullet(int(o1), int(p));
  enemyBullet(int(o2), int(p));
  enemyBullet(int(o3), int(p));
  enemyBullet(int(o4), int(p));
  enemyBullet(int(o5), int(p));
  enemyBullet(int(o6), int(p));
  enemyBullet(int(o7), int(p));
  enemyBullet(int(o8), int(p));
  enemyBullet(int(o9), int(p));
  enemyBullet(int(o1), int(p2));
  enemyBullet(int(o2), int(p2));
  enemyBullet(int(o3), int(p2));
  enemyBullet(int(o4), int(p2));
  enemyBullet(int(o5), int(p2));
  enemyBullet(int(o6), int(p2));
  enemyBullet(int(o7), int(p2));
  enemyBullet(int(o8), int(p2));
  enemyBullet(int(o9), int(p2));
  o1 = o1 + vo1;
  o2 = o2 + vo2;
  o3 = o3 + vo3;
  o4 = o4 + vo4;
  o5 = o5 + vo5;
  o6 = o6 + vo6;
  o7 = o7 + vo7;
  o8 = o8 + vo8;
  o9 = o9 + vo9;
  p = p + vp;
  p2 = p2 + vp2;

  
  chara(int(x), int(y));
  x = x ;
  y = y + vy ;
  if (y<90) vy = -vy;
  if (y>110) vy = -vy;
  
  
  stroke(255,255,255);
  noFill();
  triangle(mouseX, mouseY -7, mouseX -10, mouseY +7, mouseX +10, mouseY +7);
  if (mousePressed) { 
    line(mouseX, mouseY - 7, mouseX, 0); // draw beam
  }
  
}
void chara(int a,int b){

  pushMatrix();
  
  translate(a, b);

  //out line
  strokeWeight(1);
  stroke(0, 0, 0);
  fill(247, 247, 247);
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
  stroke(#ffffff);
  fill(#ffffff);
  rect(23, b , 3, 11);
  rect(73, b , 3, 11);
  //cheek
  stroke(0, 0, 0);
  ellipse(20, 70, 23, 23);
  ellipse(80, 70, 23, 23);
  //cheek eraser
  stroke(#ffffff);
  fill(#ffffff);
  ellipse(26, 64, 23, 23);
  stroke(#ffffff);
  fill(#ffffff);
  ellipse(74, 64, 23, 23);
  //eyes
  stroke(0, 0, 0);
  fill(80, 80, 80);
  ellipse(32, 60, 23, 23);
  ellipse(69, 60, 23, 23);
  //nose
  fill(80, 80, 80);
  triangle(53, 64, 53, 74, 58, 74);
  triangle(47, 64, 47, 74, 42, 74);
  //teeth
  fill(#ffffff);
  rect(30, 76, 39, 15);
  line(40, 82, 40, 91);
  line(50, 82, 50, 91);
  line(60, 82, 60, 91);
  //teeth eraser
  stroke(#ffffff);
  fill(#ffffff);
  rect(31, 75, 37, 2);
  
  
  popMatrix();

}

void enemyBullet(int c, int d){

  pushMatrix();

    ellipse(c, d, 10, 10);
  
  popMatrix();
  
  }


