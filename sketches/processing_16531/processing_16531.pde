

int card=0;
PImage img1, img2, img3, img4, img5, img6, imgm1, imgm2, imgm3, imgm4 ;

void setup() {
  size(600,400);
  smooth();

  img1=loadImage("1.jpg");
  img2=loadImage("2.jpg");
  img3=loadImage("3.jpg");
  img4=loadImage("4.jpg");
  img5=loadImage("5.jpg");
  img6=loadImage("6.jpg");
  imgm1=loadImage("m1.png"); 
  imgm2=loadImage("m2.png");
  imgm3=loadImage("m3.png");
  imgm4=loadImage("m4.png");
}


void draw() {
  background(255);
  noStroke();

  if(card==0) {
    bear1(0,30,0.7);
  }
  if(card==1) {
    bear2(0,30,0.7);
  }
  if(card==2) {
    image(imgm1,0,0);
    bear1(0,30,0.7);
  }
  if(card==3) {
    pushMatrix();
    scale(0.7);
    image(img1,35,50);
    popMatrix();
    image(imgm2,0,0);
  }
  if (card==4) {
    pushMatrix();
    scale(0.7);
    image(img2,35,50);
    popMatrix();
  }
  if(card==5) {
    pushMatrix();
    scale(0.7);
    image(img3,35,50);
    popMatrix();
    image(imgm2,0,0);
  }
  if(card==6) {
    pushMatrix();
    scale(0.7);
    image(img4,35,50);
    popMatrix();
    image(imgm3,0,0);
  }
  if(card==7) {
    pushMatrix();
    scale(0.7);
    image(img5,35,50);
    popMatrix();
  }
  if(card==8) {
    pushMatrix();
    scale(0.7);
    image(img6,60,70);
    popMatrix();
    image(imgm4,0,0);
  }
}


void bear1(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //face
  noStroke();
  fill(201,98,2);
  ellipse(300,300,300,300);
  //ear
  ellipse(170,180,120,120);
  ellipse(430,180,120,120);
  fill(242,173,108);
  ellipse(170,188,80,80);
  ellipse(430,188,80,80);
  //nose
  fill(255);
  ellipse(300,350,180,180);
  fill(0);
  ellipse(300,300,50,50);
  //eye
  ellipse(200,280,50,50);
  ellipse(400,280,50,50);
  //mouse
  ellipse(300,380,100,50);
  popMatrix();
}

void bear2(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //face
  noStroke();
  fill(201,98,2);
  ellipse(300,300,300,300);
  //ear
  ellipse(170,180,120,120);
  ellipse(430,180,120,120);
  fill(242,173,108);
  ellipse(170,188,80,80);
  ellipse(430,188,80,80);
  //nose
  fill(255);
  ellipse(300,350,180,180);
  fill(0);
  ellipse(300,300,50,50);
  //eye
  ellipse(200,280,50,50);
  ellipse(400,280,50,50);
  //mouse
  ellipse(300,380,50,100);
  popMatrix();
}


void mousePressed() {
  if (card==0) {
    card =1;
  }
  else if (card ==1) {
    card =2;
  }
  else if (card ==2) {
    card =3;
  }
  else if (card ==3) {
    card =4;
  }
  else if (card ==4) {
    card =5;
  }
  else if (card ==5) {
    card =6;
  }
  else if (card ==6) {
    card =7;
  }
  else if (card ==7) {
    card =8;
  }
}


