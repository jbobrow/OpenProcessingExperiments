
float m = 50;      //三角形重心至頂點距離
float wm ;         //水平中心
float hm ;         //垂直中心

ob [] o = new ob[5];

void setup() {
  size(600, 600, P3D);
  smooth();
  wm = m*cos(PI/6);
  hm = 2.5*m;
  noStroke();

  for (int i = 0; i<o.length; i++) {
    o[i] = new ob();
  }
}

void draw() {
  first();
  firstcoby();
  arr();
  all();
}

void triang() {    //最小單位三角形
  fill(0);
  triangle(0, -m, m*cos(PI/6), m*sin(PI/6), -m*cos(PI/6), m*sin(PI/6));

  for (int i = 0; i<o.length; i++) {
    o[i].looking();
  }
}


void first() {    //原始六角形
  pushMatrix();            //0
  translate(wm, hm);
  triang();  
  popMatrix(); 

  pushMatrix();                //2
  translate(wm - m*cos(PI/6), hm - m*cos(PI/3));
  rotateY(PI);
  rotate(-PI/3);
  triang(); 
  popMatrix();

  pushMatrix();                //3
  translate(wm + m*cos(PI/6), hm - m*cos(PI/3));
  rotateY(PI);
  rotate(PI/3);
  triang(); 
  popMatrix();
}

void firstcoby() {
  pushMatrix();            //A
  rotateX(PI);
  translate(0, -2*hm + 2*m);
  first();  
  popMatrix();
}


void arr() {             //垂直排列
  for (int i = 1; i<=4; i++) {
    pushMatrix();
    translate(0, i*3*m);
    first();
    firstcoby();
    popMatrix();
  }
}


void all() {        //橫向排列
  for (int i = 1; i<=5; i++) {
    if (i%2 != 0) {
      pushMatrix();
      translate(i*3*m*cos(PI/6), -3*m/2);
      first();
      firstcoby();
      arr();  
      popMatrix();
    }
    else {
      pushMatrix();
      translate(i*3*m*cos(PI/6), 0);
      first();
      firstcoby();
      arr();  
      popMatrix();
    }
  }
}



class ob {  //圓圈

  float r; 

  float x1;
  float y1;
  float s1;
  float s2;
  float mx;
  float my;
  color c;

  ob() {
    r = random(5, 30);
    x1 = 0;
    y1 = 0;
    s1 = random(-1, 1);
    s2 = random(-1, 1);
    mx = mouseX;
    my = mouseY;
    c = color(random(50, 255), random(50, 255), random(50, 255), 200);
  }

  void looking() {

    fill(c);

    if (mouseX != mx || mouseY != my) {
      x1 += s1;
      y1 += s2;
    }
    mx = mouseX;
    my = mouseY;

    if (sqrt(12*(sq((3*x1+sqrt(3)*y1+sqrt(3)*m)/-12))) <= r/2) {
      s1 = random(1);
      s2 = random(1);
      c = color(random(50, 255), random(50, 255), random(50, 255), 200);
    }    
    else if (sqrt(12*(sq((-3*x1+sqrt(3)*y1+sqrt(3)*m)/12))) <= r/2) {
      s1 = -random(1);
      s2 = random(1);
      c = color(random(50, 255), random(50, 255), random(50, 255), 200);
    }
    else if (((m/2)-y1) <= r/2 ) {
      s1 = random(1);
      s2 = -random(1);
      c = color(random(50, 255), random(50, 255), random(50, 255), 200);
    }

    ellipse(x1, y1, r, r);
  }
}


