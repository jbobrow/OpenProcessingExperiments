
//float bb=0.0;

//background color
int a=0 ;
int b=0;
int c=0;

//robort color
int d=0;
int e=0;
int f=0;



void setup() {
  size(600, 600, P3D);

  // noFill();
}

void draw() {
  background(0);
  noStroke();
  // background(a, b, c);
  lights();
 directionalLight(102, 102, 102, 0, 0, -1);



  translate(width/2, height/2, 0);


  //  bb=bb+0.01;
  //  float c=noise(bb)*width;
  //  stroke(random(100,130),random(130,180),random(200,255),100);
  //  line(0,c,width,c);
  //  stroke(255);
  //  strokeWeight(5);
  //  line(0,0,c,height);




  rotateX(radians(((mouseX/(float)width)*180)-90));
   rotateY(radians(((mouseY/(float)height)*180)-90));
  // rotateY(radians(frameCount));


  //head
  translate(0, -100, 0);
  pushMatrix();
  scale(3, 2, 1);
  // fill(255);
  fill(a, b, c, 100);
  box(50);
  //above head
  translate(-10, -30, 1);
  scale(.1, .7, 1);
  fill(250, 250, 100);
  box(20);
  //above head 2
  translate(200, 0, 1);
  scale(.3, .3, 1);
  fill(250, 250, 100);
  box(50);

  //walking on
  translate(-100, 550, 3);
  scale(80, .5, 1);
  fill(230, 230, 200, 250);
  // fill(150, 150, 150);
  box(50);

  //support 2
  translate(15, 580, 10);
  scale(.1, 120, 1);
  box(10);

  //support 1
  translate(-300, 0.5, 1);
  scale(1, 1.1, 1);
  // fill(150, 150, 150);
  box(10);


  popMatrix();




  //body

  pushMatrix();
  translate(0, 100, 0);
  scale(1, 2, .5);
  fill(a, b, c, 100);
  box(50); 
  popMatrix();


  fill(255);

  // eye
  pushMatrix();
  translate(-30, 0, 40);
  scale(2, 2, 1);
  fill(255);
  if (frameCount% 100 <20)
  { 
    fill(255, 140, 130);
  } 
  box(10);
  popMatrix();

  // eye
  pushMatrix();
  translate(30, 0, 40);
  scale(2, 2, 1);
  fill(255); 
  if (frameCount % 100 < 20)
  { 
    fill(100, 130, 255);
  } 
  box(10);
  popMatrix();

  fill(255);


  //middle body
  translate(0, 100, 0);
  pushMatrix();
  scale(.3, 2, .9);
  rotate(HALF_PI);
  //fill(255);
  box(50);
  popMatrix();



  //hand
  translate(-40, 0, 0);
  pushMatrix();
  translate(50, -30, 0);
  rotateX(radians(sin(frameCount/11)*40));
  translate(-50, 30, 0);
  scale(.3, 1.3, .5);
  fill(a, b, c, 100);
  //fill(255);
  box(50);
  rotateX(radians(sin(frameCount/8)*8));
  translate(-10, 30, 0);
  scale(.5, .5, .5);
  box(50);
  popMatrix();

  //hand
  translate(80, 0, 0);
  pushMatrix();
  translate(80, -60, 0);
  rotateX(radians(sin(frameCount/15)*30));
  translate(-80, 60, 0);
  //rotate(-HALF_PI/2);
  scale(.3, 1.3, .5);
  fill(a, b, c, 100);
  //fill(255);
  box(50);
  //rotate(radians(((mouseY/(float)height)*180)-95));
  rotateX(radians(sin(frameCount/8)*8));
  translate(10, 30, 0);
  scale(.5, .5, .5);
  box(50);
  popMatrix();



  //leg
  translate(-10, 60, 0);
  pushMatrix();
  translate(80, -60, 0);
  rotateX(radians(sin(frameCount/7)*20));
  translate(-80, 60, 0);
  //  rotate(-HALF_PI);
  scale(.3, .2, 1);
  // fill(255);
  box(50);
  popMatrix();

  //leg
  translate(-60, 0, 0);
  pushMatrix();
  translate(80, -60, 0);
  rotateX(radians(sin(frameCount/5)*20));
  translate(-80, 60, 0);
  // rotate(-HALF_PI);
  scale(.3, .2, 1);
  //if (a = true) {
  //a = true;
  box(50);
  popMatrix();
}



void mouseMoved() {
  a=a+5;
  if (a>200) {
    a=60;
  }

  b=b+5;
  if (b>180) {
    b=100;
  }

  c=c+5;
  if (c>200) {
    c=150;
  }
}

//void mouseClicked() {
//  d=d+5;
//  if (d>200) {
//    d=60;
//  }
//
//  e=e+5;
//  if (e>200) {
//    e=60;
//  }
//
//  f=f+5;
//  if (f>200) {
//    f=60;
//  }
//}
//  
//  void mouseReleased() {
//  if (a == 0) {
//    a = 255;
//  } else {
//    a =100;
//  }
//  
//  if (b == 0) {
//    b = 255;
//  } else {
//    b =100;
//  }
//  
//  if (c == 0) {
//   c = 255;
//  } else {
//   c = 200;
//  }
//}



//void mousePressed(){
//  a = true;
//  
//}
//
//void mouseReleased(){
//  
//  a = true;
//  //fill(100,100,230,100);



