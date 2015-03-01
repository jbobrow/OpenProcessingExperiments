
void setup() {
  size(600, 600);
  background(255);
  frameRate(10);
}


float x1 = 10;
boolean t1 = true;
float x2 = 340;
boolean t2 = true;
float x3 = 155;
boolean t3 = true;

void draw() {
  
  background(255);
  
  //line(width/2, 0, width/2, height);
  fill(x1, x2, x3);
  beginShape();
  vertex(width/2, 0);
  bezierVertex(x1, 10,
               x1, 300,
               x3, 330 );
  bezierVertex(x2, 360,
               x2, 570,
               x3, 600);
  endShape();
  
  if (t1 == true) {
    x1 += 5;
  } else {
    x1 -= 5;
  }
  
  if (t2 == true) {
    x2 -= 5;
  } else {
    x2 += 5;
  }
  
  if (t3 == true) {
    x3 += 5;
  } else {
    x3 -= 5;
  }
  
  if (x1>590 || x1<10) {
   t1 = !t1;
  }
  
  if (x2<260 || x2>340) {
    t2 = !t2;
  }
  
  if (x3>445 || x3<155) {
    t3 = !t3;
  }
  
}

void setup() {
  size(600, 600);
  background(255);
  frameRate(10);
}


float x1 = 10;
boolean t1 = true;
float x2 = 340;
boolean t2 = true;
float x3 = 155;
boolean t3 = true;

void draw() {
  
  background(255);
  
  //line(width/2, 0, width/2, height);
  fill(x1, x2, x3);
  beginShape();
  vertex(width/2, 0);
  bezierVertex(x1, 10,
               x1, 300,
               x3, 330 );
  bezierVertex(x2, 360,
               x2, 570,
               x3, 600);
  endShape();
  
  if (t1 == true) {
    x1 += 7.25;
  } else {
    x1 -= 7.25;
  }
  
  if (t2 == true) {
    x2 -- ;
  } else {
    x2 ++ ;
  }
  
  if (t3 == true) {
    x3 += 1.125;
  } else {
    x3 -= 1.125;
  }
  
  if (x1>590 || x1<10) {
   t1 = !t1;
  }
  
  if (x2<260 || x2>340) {
    t2 = !t2;
  }
  
  if (x3>445 || x3<155) {
    t3 = !t3;
  }
}
