
//float campx = 300;
//float campy = 400;
//float campz = 400;
//float   mDifX = 0;
//float   mDifY = 0;
//boolean mLocked = false;
//boolean kLocked = false;

int stroker = int(random(255));
int strokeg = int(random(255));
int strokeb = int(random(255));

void setup() {
  size(500,500,P3D);
  loop();
  //stroke(255);
  lights();
  background(0);
  float noisex = random(-10,10);
  float noisey = random(-10,10);
  translate(500,500,0);
  for(int x = -width+200; x<width-200; x+=10){
    noisex = random(-10,10);
    noisey = random(-10,10);
    noisey = noisey + random(-0.02, 0.02);
    stroker = int(random(255));
    strokeg = int(random(255));
    strokeb = int(random(255));
    //stroke(random(255),random(255),random(255));
    for(int y = -height+200; y<height-200; y+=10){
      noisex = random(-10,10);
    noisey = random(-10,10);
     noisex = noisex + random(-0.02, 0.02);
      drawish(x,y,noisex,noisey);//noise(noisex, noisey));
      //println(noisex);
      //println(noisey);
    }
  }
}

void drawish(int x, int y, float noisex, float noisey){
  //camera(campx, campy, campz, width/2, height/2, 0, 0, 0, -1);
  pushMatrix();
  stroke(stroker,strokeg,strokeb);
  translate(x+noisex,y+noisey,0);
  noSmooth();
  sphere(5);
  popMatrix();
}
//float x1 = 0;
//float y1 = 0;
//float x2 = 500;
//float y2 = 0;
//boolean direction = true;
//float a = 0;
//float b = 0;
//float c = 0;
//float d = 0;
//float e = 0;
//float f = 0;
//int depth = 0;
//float rot = 0;
//float x = 0;
//float x1 = .2;
//float x2 = .4;
//float x3 = .6;
//float x4 = .8;
//float posx = 500;
//float posy = 500;

void draw() {
  
//  background(0);
//  //translate(posx, posy, 0); 
//  rotateY(rot);
//  noFill();
//  posx = 200;
//  posy = 200;
//  for (int k = 0; k<2; k++){ 
//    translate(posx,0,0);
//    translate(0,-2*posy,0);
//  for (int j = 0; j <2; j++){
//    translate(0,posy,0);
//    //translate(-2*posx,0,0);
//  for(int i = 0; i<5; i++){
//    //translate(posx, posy, 0); 
//    if (i%4==0){
//      stroke(250*cos(x),250*sin(x),250*atan(x));
//    }
//    if (i%4==1){
//      stroke(250*sin(x1),250*sin(x1),250*atan(x1));
//    }
//    if (i%4==2){
//      stroke(250*sin(x2),250*cos(x2),250*atan(x2));
//    }
//    if (i%4==3){
//      stroke(250*atan(x3),250*sin(x3),250*cos(x3));
//    }
//    if (i%4==4){
//      stroke(250*cos(x4),250*atan(x4),250*sin(x4));
//    }
//    rot = rot+.00005;
//    rotateY(rot);
//    rotateX(rot);
//    box(80*i);
//    x=x+0.001;
//    x1=x1-0.001;
//    x2=x2+0.002;
//    x3=x3-0.002;
//    x4=x4+0.0005;
//  }
// // posy = posy+200;
//  }
//  //posx = posx+200;
//  }
//  a=a+1;
//  b=b+1;
//  c=c+1;
//  d=d+1;
//  e=e+.01;
//  f=f+.02;
//  arc(a,b,c,d,e,f);
//  drawArc(a,b,c,d,e,f,depth);
//  line (x1, y1, x2, y2);
//  if (y1>500){
//    direction = false;
//  }
//  if (y1<0){
//    direction = true;
//  }
//  if (direction==true){
//    y1=y1+1.0;
//    y2=y2+1.0;
//  }
//  if (direction==false){
//    y1=y1-1.0;
//    y2=y2-1.0;
//  }
}


//void drawArc(float a1,float b1,float c1, float d1,float e1,float f1, int depth){
//  background(0);
// // stroke(255);
//  a1=a1+1;
//  b1=b1+1;
//  c1=c1+1;
//  d1=d1+1;
//  e1=e1+.01;
//  f1=f1+.02;
//  depth++;
//  arc(a1,b1,c1,d1,e1,f1);
//  if (depth<20){
//    drawArc(a1,b1,c1,d1,e1,f1,depth);
//  }
//}
//  
//void mousePressed() {
//  if (!mLocked) mLocked = true;
//  mDifX = mouseX - campx;
//  mDifY = mouseY - campy;
//}
//
//void mouseDragged() {
//  if (mLocked) {
//    campx = mouseX - mDifX;
//    campy = mouseY - mDifY;
//  }
//}
//
//void mouseReleased() {
//  mLocked = false;
//}

