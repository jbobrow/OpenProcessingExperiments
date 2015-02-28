
int[] starX = new int[100];
int[] starY = new int[100];
color[] starColor = new color[1000];
PImage moon;
PImage back;
float xpos;
float ypos;
float xvel = 2;
float yvel = 1;
int imwidth;
int imheight;
PFont main;
//add
int ballcount=12;
int Bulletcount = 10;
Ball []myBall;
Bullet[]myBullet;
int score, scoreLevle1, scoreLevle2, scoreLevle3, mode1, mode2, mode3, sightWeight, usedBullet;
color sightColor;
boolean Win, noBullet;
int CurrentFrameCount;



void setup() {
  size(800, 640);
  smooth();
  noCursor();
  frameRate(30);
  for (int i = 0; i < 100; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(0, 120));
  }
  moon= loadImage("moon.png");
  back = loadImage("back.png");
  shapeMode(CENTER);
  imageMode(CENTER);

  xpos=width/2;
  ypos=height/2;
  imwidth=back.width;
  imheight=back.height;
  image(back, xpos, ypos);
  main = loadFont("main.vlw");
  
  //add
   sightColor = #FF0818;
  sightWeight=2;
  myBall = new Ball[ballcount];
  for (int i =0; i < ballcount;i++) {
    myBall[i] = new Ball(random(20, width-20), random(20, height-20), random(1, 3), random(1, 3));
  }
}



void draw() {


  background(13, 30, 53);

  //background

  for (int i = 0; i < 100; i++) {

    //fill(random(100,255));
    if (random(10) < 1) {
      starColor[i] = (int)random(100, 160);
    }
    fill(starColor[i]);
    ellipse(starX[i], starY[i], 3, 3);
  }
  //background --moon
  tint(255, 255, 255, random(210, 255));
  image(moon, width/2+250, height/2-250);

  //vector background

  float x, y;
  //  xpos=mouseX;
  //  ypos=mouseY;
  // 
  //  x=map(xpos,0, width,(width/2)+((imwidth-width)/2),(width/2)-((imwidth-width)/2));
  //  y=map(ypos,0, height,(height/2)+((imheight-height)/2),(height/2)-((imheight-height)/2));

  x=mouseX;
  y=mouseY;
  if (abs(x-xpos)>xvel) {

    if (x>xpos) {
      xpos+=xvel;
    }
    else
    {
      xpos-=xvel;
    }
  }
  if (abs(y-ypos)>yvel) {
    if (y>ypos) {
      ypos+=yvel;
    }
    else
    {
      ypos-=yvel;
    }
  }

  image(back, map(xpos, 0, width, (width/2)+((imwidth-width)/2), (width/2)-((imwidth-width)/2)), map(ypos, 0, height, (height/2)+((imheight-height)/2), (height/2)-((imheight-height)/2)));

  textFont(main, 24); //(name,size)
  fill(255);
  text("FEED ME GLOW CANDY", width/2-120, height/2-160, 300, 600); 


  //mousepressed starts
  if ( mousePressed == true) {
    fill(255);
  }
  else {
    fill(255, random(30));
  }

  // ghost head
  noStroke();
  arc(mouseX, mouseY-25, 50, 50, PIE+0.14, 2*PIE+0.285);

  // ghost body
  beginShape();
  vertex(mouseX-25, mouseY-25);
  bezierVertex(mouseX-25, mouseY-25, mouseX+25, mouseY-25, mouseX+25, mouseY-25);
  bezierVertex(mouseX+25, mouseY, mouseX+25, mouseY+25, pmouseX+25, pmouseY+50);
  vertex(pmouseX+20, pmouseY+45);
  vertex(pmouseX+15, pmouseY+50);
  vertex(pmouseX+10, pmouseY+45);
  vertex(pmouseX+5, pmouseY+50);
  vertex(pmouseX, pmouseY+45);
  vertex(pmouseX-5, pmouseY+50);
  vertex(pmouseX-10, pmouseY+45);
  vertex(pmouseX-15, pmouseY+50);
  vertex(pmouseX-20, pmouseY+45);
  vertex(pmouseX-25, pmouseY+50);
  bezierVertex(pmouseX-25, pmouseY+25, mouseX-25, mouseY, mouseX-25, mouseY-25);
  endShape();

  // ghost face
  fill(3, 23, 43);
  ellipse(mouseX-9, mouseY-25, 10, 12);
  ellipse(mouseX+9, mouseY-25, 10, 12);
  ellipse(mouseX, mouseY-8, 12, 10);
  
  //add
   winScore();
// getridof  sight();
  Win=true;
  myBullet = new Bullet[Bulletcount- usedBullet];
  for (int i =0; i < Bulletcount-usedBullet;i++) {
    myBullet[i] = new Bullet(width-50, i*15+230);
  }
  for (int i =0; i < ballcount;i++) {
    if ( !myBall[i].hit) {
      myBall[i].move();
      myBall[i].display();
      Win= false;
    }
  }
  for (int i =0; i < Bulletcount- usedBullet;i++) {
    myBullet[i].display();
  }
  if (Win) {
    textAlign(CENTER, CENTER);
    fill(0);
    rect(0, 0, width, height);
    fill(#FA7900);
    textSize(32);
    text("YOU WIN !", width/2, height/2-50);
    text("your score is "+score, width/2, height/2);
  }
}
//


void mousePressed() {
  println("Boo!");
   sightColor = #FFD603;
  sightWeight=3;
  for (int i =0; i < ballcount;i++) {
    if (dist(mouseX, mouseY, myBall[i].x, myBall[i].y)<20 && dist(mouseX, mouseY, myBall[i].x, myBall[i].y)>15 &&  mouseButton==LEFT && usedBullet>=0 && usedBullet<10 ) {
      scoreLevle1=6;
      mode1++;
    } else if (dist(mouseX, mouseY, myBall[i].x, myBall[i].y)<=15 && dist(mouseX, mouseY, myBall[i].x, myBall[i].y)>10 && mouseButton==LEFT && usedBullet>=0 && usedBullet<10 ) {
      scoreLevle2=8;
      mode2++;
    } else if (dist(mouseX, mouseY, myBall[i].x, myBall[i].y)<=10 &&  mouseButton==LEFT && usedBullet>=0 && usedBullet<10 ) {
      scoreLevle3=10;
      mode3++;
    }
  }
  if (mouseButton==LEFT && usedBullet>9 ) {
    noBullet=true;
    CurrentFrameCount=frameCount;
  }
  checkHit();
  if (mouseButton == LEFT ) {
    usedBullet++;
    if ( usedBullet>10) {
      Bulletcount=usedBullet;
    }
  }
  if (mouseButton == RIGHT && usedBullet>=10) {
    Bulletcount=10;
    usedBullet=0;
  }
}

void winScore() {
  score= scoreLevle1*mode1+scoreLevle2*mode2+scoreLevle3*mode3;
  textAlign(LEFT, CENTER);
  textSize(22);
  fill(#FA7900);
  text("Your score is : "+score, 15, 15);
  textSize(12);
  fill(255);
  if (frameCount<160) {
    text("Press left mouse button to glow. Press right mouse button to reload.", 15, 40);
  }
  if (usedBullet>9) {
    if (frameCount-CurrentFrameCount<160) {
      text("Press right mouse button to reload.", 15, 40);
    }
  }
}
 
void checkHit() {
  for (int i =0; i < ballcount;i++) {
    if (dist(mouseX, mouseY, myBall[i].x, myBall[i].y)<20 && mouseButton==LEFT && usedBullet>=0 && usedBullet<10 ) {
      myBall[i].hit=true;
    }
  }
}
 

 
void mouseReleased() {
  sightColor = #FF0818;
  sightWeight=2;
}
 
class Ball {
  float x, y;
  float vX, vY;
  color c1, c2, c3;
  boolean hit;
 
  Ball(float temp_x, float temp_y, float temp_vX, float temp_vY) {
    x =temp_x;
    y =temp_y;
    vX=temp_vX;
    vY=temp_vY;
    c3=#064A9B;
    c2=#2886D1;
    c1=#47C0E3;
    noStroke();
  }
 
  void move() {
    x+=vX;
    y+=vY;
    if (x>width-20 ) {
      vX*=-1;
      x=width-20;
    } else if (x<20) {
      vX*=-1;
      x=20;
    }
    if (y>height-20 ) {
      vY*=-1;
      y=height-20;
    } else if (y<20) {
      vY*=-1;
      y=20;
    }
  }
 
  void display() {
      fill(c3, 110,random(255),random(255));
      ellipse(x, y, 40, 40);
      fill(c2, 100,random(255),random(255));
      ellipse(x, y, 24, 24);
      fill(c1, 120,random(255),random(255));
      ellipse(x, y, 8, 8);
  }
}
 
class Bullet {
  int x, y;
 
  Bullet(int posx, int posy) {
    x = posx;
    y = posy;
  }
 
  void checkShooting() {
  }
 
  void display() {
    fill(#D6D6D6);
    rect(x, y, 15, 5);
  }
}


