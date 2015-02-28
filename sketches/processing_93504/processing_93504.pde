
// spacebar = pause
//1,2,3,4,5 = shape individual pause
// mouse = stroke,fill toggle
//x,c,v = reset/add background/mask
//s = save image
//r = randomise colors
//t = reset colors to same value
//a = automate key response:s,r,mouse
//q = automate key response:r,c,mouse
//p = reset location
PShape ma1;
PShape ma2;
PShape ma3;
PShape ma4;
PShape ma5;
int rand1;
int rand2;
int rand3;
int rand4;
int rand5;
int filenum = 1;
float[] i={0,0,0,0,0,0};
float[] j={0,0,0,0,0,0};
float[] x={1,1,1,1,1,1};
int xa=round(random(230));
int H[] = {xa,xa+5,xa+10,xa+15,xa+20,xa+25};
int S[] = {round (random(255)),round (random(255)),round (random(255)),round (random(255)),round (random(255)),round (random(255))};
int B[] = {round (random(255)),round (random(255)),round (random(255)),round (random(255)),round (random(255)),round (random(255))};
int A[] = {round (random(255)),round (random(255)),round (random(255)),round (random(255)),round (random(255)),round (random(255))};
int xposi[] = {round (random (1000)),round (random (1000)),round (random (1000)),round (random (1000)),round (random (1000)),round (random (1000))};
int yposi[] = {round (random (1001)),round (random (1001)),round (random (1001)),round (random (1001)),round (random (1001)),round (random (1001))};
boolean swit = false;
boolean start[] = {true,true,true,true,true,true};
boolean paused = false;
boolean autom = false;
boolean autom2 = false;

void setup() {
  size (1000, 1001);
  shapeMode(CENTER);
  rectMode(CENTER);
  frameRate(30);
  colorMode(RGB);
  //colorMode(HSB);
  background(200);
  strokeWeight(1);
  rand1 = int(random(2,51));
  rand2 = int(random(2,51));
  rand3 = int(random(2,51));
  rand4 = int(random(2,51));
  rand5 = int(random(2,51));
  ma1 = loadShape("mattelpattern-"+nf(rand1,2)+".svg");
  ma2 = loadShape("mattelpattern-"+nf(rand2,2)+".svg");
  ma3 = loadShape("mattelpattern-"+nf(rand3,2)+".svg");
  ma4 = loadShape("mattelpattern-"+nf(rand4,2)+".svg");
  ma5 = loadShape("mattelpattern-"+nf(rand5,2)+".svg");
}

void draw() {
  if (paused == false) {
  growth1();
  growth2();
  growth3();
  growth4();
  growth5();
  checkout();
  //fill(200,1);
  //rect (1000/2,1001/2,1000,1001);
  automa();
  automa2();
  }
}

void mousePressed() {
   if (swit == false) {
    swit = true;
  }
  else {
    swit = false;
  }
}

void keyPressed () {
 // if (key == 's') {
  //  if (swit == false) {
 //   swit = true;
 // }
//  else {
 //   swit = false;
 // }
 // }
 if (key == ' ') {
   if (paused == true) {
     paused = false;
   }
   else {
     paused = true;
   }
 }
 
 if (key == 'x') {
   background(230);
 }
 
  if (key == 'p') {
    i[1]=0;
    j[1]=0;
    i[2]=0;
    j[2]=0;
    i[3]=0;
    j[3]=0;
    i[4]=0;
    j[4]=0;
    i[5]=0;
    j[5]=0;
 }
 
  if (key == 'c') {
   fill(random(255),random(255),random(255),random(100));
   rect(1000/2,1001/2,1000,1001);
 }
 
  if (key == 'v') {
   fill(random(255),random(200));
   rect(1000/2,1001/2,1000,1001);
 }
 
  if (key == 'a'){
     if(autom == true) {
      autom = false;
    }
    else {
      autom = true;
    }
   }
   
    if (key == 'q'){
     if(autom2 == true) {
      autom2 = false;
    }
    else {
      autom2 = true;
    }
   }
 
   if (key == '1'){
     if(start[1] == true) {
      start[1] = false;
    }
    else {
      start[1] = true;
    }
   }
   if (key == '2'){
     if(start[2] == true) {
      start[2] = false;
    }
    else {
      start[2] = true;
    }
   }
   if (key == '3'){
     if(start[3] == true) {
      start[3] = false;
    }
    else {
      start[3] = true;
    }
   }
   if (key == '4'){
     if(start[4] == true) {
      start[4] = false;
    }
    else {
      start[4] = true;
    }
   }
   if (key == '5'){
     if(start[5] == true) {
      start[5] = false;
    }
    else {
      start[5] = true;
    }
   }
   
   if (key == 's') {
     saveFrame ("mattel"+nf(filenum,3)+".png");
     filenum=filenum+1;
   }
   
   if (key == 'r') {
     H[1] = round(random(255));
     S[1] = round(random(255));
     B[1] = round(random(255));
     A[1] = round(random(255));
     H[2] = round(random(255));
     S[2] = round(random(255));
     B[2] = round(random(255));
     A[2] = round(random(255));
     H[3] = round(random(255));
     S[3] = round(random(255));
     B[3] = round(random(255));
     A[3] = round(random(255));
     H[4] = round(random(255));
     S[4] = round(random(255));
     B[4] = round(random(255));
     A[4] = round(random(255));
     H[5] = round(random(255));
     S[5] = round(random(255));
     B[5] = round(random(255));
     A[5] = round(random(255)); 
   }
   
   if (key == 't') {
     int xb = round(random(255));
     H[1] = xb;
     S[1] = xb;
     B[1] = xb;
     A[1] = xb;
     H[2] = (-xb+255);
     S[2] = (-xb+255);
     B[2] = (-xb+255);
     A[2] = (-xb+255);
     H[3] = xb;
     S[3] = xb;
     B[3] = xb;
     A[3] = xb;
     H[4] = (-xb+255);
     S[4] = (-xb+255);
     B[4] = (-xb+255);
     A[4] = (-xb+255);
     H[5] = xb;
     S[5] = xb;
     B[5] = xb;
     A[5] = xb; 
   }
}

void growth1() {
  if (start[1] == true) {
    ma1.disableStyle();
    if (swit == true) {
      noFill();
      stroke (255-H[1], 255-S[1], 255-B[1], 255-A[1]);
    }
    else {
      noStroke();
      fill (H[1], S[1], B[1], A[1]);
    }
    shape (ma1,xposi[1]+i[1],yposi[1]+j[1],ma1.width*x[1],ma1.height*x[1]);
    H[1] = H[1] + round(random (-12,+12));
    S[1] = S[1] + round(random (-12,+12));
    B[1] = B[1] + round(random (-12,+12));
    A[1] = A[1] + round(random (-12,+12));
    //println (H + ","+ S+ ","+ B + ","+ A);
    if (x[1]>5) {
      x[1] = x[1] + random(-0.5,0);
    }
    else if (x[1] <= 0) {
      x[1] = x[1] + random (0,0.5);
    }
    else {
      x[1] = x[1] + random (-0.2,0.2);
    }
    i[1] = i[1] + random(-10,10);
    j[1] = j[1] + random(-10,10);
    ma1.rotate(random(-0.1,0.1));
  }
}

void growth2() {
  if (start[2] == true) {
    ma2.disableStyle();
    if (swit == true) {
      noStroke();
      fill (H[2], S[2], B[2], A[2]);
    }
    else {
      noFill();
      stroke (255-H[2], 255-S[2], 255-B[2], 255-A[2]);
    }
    shape (ma2,xposi[2]+i[2],yposi[2]+j[2],ma2.width*x[2],ma2.height*x[2]);
    H[2] = H[2] + round(random (-12,+12));
    S[2] = S[2] + round(random (-12,+12));
    B[2] = B[2] + round(random (-12,+12));
    A[2] = A[2] + round(random (-12,+12));
    //println (H + ","+ S+ ","+ B + ","+ A);
    if (x[2]>5) {
      x[2] = x[2] + random(-0.5,0);
    }
    else if (x[2] <= 0) {
      x[2] = x[2] + random (0,0.5);
    }
    else {
      x[2] = x[2] + random (-0.2,0.2);
    }
    i[2] = i[2] + random(-10,10);
    j[2] = j[2] + random(-10,10);
    ma2.rotate(random(-0.1,0.1));
  }
}

void growth3() {
  if (start[3] == true) {
    ma3.disableStyle();
    if (swit == true) {
      noFill();
      stroke (355-H[3], 355-S[3], 355-B[3], 355-A[3]);
    }
    else {
      noStroke();
      fill (H[3], S[3], B[3], A[3]);
    }
    shape (ma3,xposi[3]+i[3],yposi[3]+j[3],ma3.width*x[3],ma3.height*x[3]);
    H[3] = H[3] + round(random (-12,+12));
    S[3] = S[3] + round(random (-12,+12));
    B[3] = B[3] + round(random (-12,+12));
    A[3] = A[3] + round(random (-12,+12));
    //println (H + ","+ S+ ","+ B + ","+ A);
    if (x[3]>5) {
      x[3] = x[3] + random(-0.5,0);
    }
    else if (x[3] <= 0) {
      x[3] = x[3] + random (0,0.5);
    }
    else {
      x[3] = x[3] + random (-0.2,0.2);
    }
    i[3] = i[3] + random(-10,10);
    j[3] = j[3] + random(-10,10);
    ma3.rotate(random(-0.1,0.1));
  }
}

void growth4() {
  if (start[4] == true) {
    ma4.disableStyle();
    if (swit == true) {
      noStroke();
      fill (H[4], S[4], B[4], A[4]);
    }
    else {
      noFill();
      stroke (455-H[4], 455-S[4], 455-B[4], 455-A[4]);
    }
    shape (ma4,xposi[4]+i[4],yposi[4]+j[4],ma4.width*x[4],ma4.height*x[4]);
    H[4] = H[4] + round(random (-12,+12));
    S[4] = S[4] + round(random (-12,+12));
    B[4] = B[4] + round(random (-12,+12));
    A[4] = A[4] + round(random (-12,+12));
    //println (H + ","+ S+ ","+ B + ","+ A);
    if (x[4]>5) {
      x[4] = x[4] + random(-0.5,0);
    }
    else if (x[4] <= 0) {
      x[4] = x[4] + random (0,0.5);
    }
    else {
      x[4] = x[4] + random (-0.2,0.2);
    }
    i[4] = i[4] + random(-10,10);
    j[4] = j[4] + random(-10,10);
    ma4.rotate(random(-0.1,0.1));
  }
}

void growth5() {
  if (start[5] == true) {
    ma5.disableStyle();
    if (swit == true) {
      noFill();
      stroke (555-H[5], 555-S[5], 555-B[5], 555-A[5]);
    }
    else {
      noStroke();
      fill (H[5], S[5], B[5], A[5]);
    }
    shape (ma5,xposi[5]+i[5],yposi[5]+j[5],ma5.width*x[5],ma5.height*x[5]);
    H[5] = H[5] + round(random (-12,+12));
    S[5] = S[5] + round(random (-12,+12));
    B[5] = B[5] + round(random (-12,+12));
    A[5] = A[5] + round(random (-12,+12));
    //println (H + ","+ S+ ","+ B + ","+ A);
    if (x[5]>5) {
      x[5] = x[5] + random(-0.5,0);
    }
    else if (x[5] <= 0) {
      x[5] = x[5] + random (0,0.5);
    }
    else {
      x[5] = x[5] + random (-0.2,0.2);
    }
    i[5] = i[5] + random(-10,10);
    j[5] = j[5] + random(-10,10);
    ma5.rotate(random(-0.1,0.1));
  }
}
  
void checkout() {
   if (xposi[1]+i[1] < 0) {
    i[1]=0;
  }
  else if (xposi[1]+i[1] > 1000) {
    i[1]=0;
  }
  if (yposi[1]+j[1] < 0) {
    j[1]=0;
  }
  else if (yposi[1]+j[1] > 1001) {
    j[1]=0;
  }
  if (xposi[2]+i[2] < 0) {
    i[2]=0;
  }
  else if (xposi[2]+i[2] > 1000) {
    i[2]=0;
  }
  if (yposi[2]+j[2] < 0) {
    j[2]=0;
  }
  else if (yposi[2]+j[2] > 1001) {
    j[2]=0;
  }
  if (xposi[3]+i[3] < 0) {
    i[3]=0;
  }
  else if (xposi[3]+i[3] > 1000) {
    i[3]=0;
  }
  if (yposi[3]+j[3] < 0) {
    j[3]=0;
  }
  else if (yposi[3]+j[3] > 1001) {
    j[3]=0;
  }
    if (xposi[4]+i[4] < 0) {
    i[4]=0;
  }
  else if (xposi[4]+i[4] > 1000) {
    i[4]=0;
  }
  if (yposi[4]+j[4] < 0) {
    j[4]=0;
  }
  else if (yposi[4]+j[4] > 1001) {
    j[4]=0;
  }
  if (xposi[5]+i[5] < 0) {
    i[5]=0;
  }
  else if (xposi[5]+i[5] > 1000) {
    i[5]=0;
  }
  if (yposi[5]+j[5] < 0) {
    j[5]=0;
  }
  else if (yposi[5]+j[5] > 1001) {
    j[5]=0;
  }
}
  
  void automa() {
    if (autom == true) {
    if (frameCount % 150 == 0) {
     H[1] = round(random(255));
     S[1] = round(random(255));
     B[1] = round(random(255));
     A[1] = round(random(255));
     H[2] = round(random(255));
     S[2] = round(random(255));
     B[2] = round(random(255));
     A[2] = round(random(255));
     H[3] = round(random(255));
     S[3] = round(random(255));
     B[3] = round(random(255));
     A[3] = round(random(255));
     H[4] = round(random(255));
     S[4] = round(random(255));
     B[4] = round(random(255));
     A[4] = round(random(255));
     H[5] = round(random(255));
     S[5] = round(random(255));
     B[5] = round(random(255));
     A[5] = round(random(255)); 
    }
    if (frameCount % 100 == 0) {
      if (swit == false) {
    swit = true;
  }
  else {
    swit = false;
  }
    }
    if (frameCount % 500 == 0) {
     saveFrame ("mattel"+nf(filenum,3)+".png");
     filenum=filenum+1;
    }
    }
}

void automa2() {
    if (autom2 == true) {
    if (frameCount % 150 == 0) {
     H[1] = round(random(255));
     S[1] = round(random(255));
     B[1] = round(random(255));
     A[1] = round(random(255));
     H[2] = round(random(255));
     S[2] = round(random(255));
     B[2] = round(random(255));
     A[2] = round(random(255));
     H[3] = round(random(255));
     S[3] = round(random(255));
     B[3] = round(random(255));
     A[3] = round(random(255));
     H[4] = round(random(255));
     S[4] = round(random(255));
     B[4] = round(random(255));
     A[4] = round(random(255));
     H[5] = round(random(255));
     S[5] = round(random(255));
     B[5] = round(random(255));
     A[5] = round(random(255)); 
    }
    if (frameCount % 100 == 0) {
      if (swit == false) {
    swit = true;
  }
  else {
    swit = false;
  }
    }
    if (frameCount % 500 == 0) {
    fill(random(255),random(255),random(255),random(100));
   rect(1000/2,1001/2,1000,1001);
    }
    }
}


