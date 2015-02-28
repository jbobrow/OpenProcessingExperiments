
PImage ed01;
PImage ed02;
PImage st01;
PImage st02;
PImage pl;
PImage st;
PImage main;
PImage hand;
//mouse oversize slide
boolean shrooms;
float aSize;
boolean bover = false; //is mouse over size slider
boolean locked = false;
float bSlider = 0;
float bx = 270.0; //slider x
float bdifx = 0.0;
//mouse oversize slide

//face
PImage body;
//image load

//eye
int offset  = 10;
int timeOpen = 1000; //time to open eyes 
int timeClosed = 250; //time to cloase eyes 
int last = 0;
boolean closed = false;
//eye

//basic

int card = 0; 
PFont f; 
int x = 550;
int y = 250;
int w = 100;
int h = 50;
int kk ;
int ll ;
int mm ;

//basic

//add
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
//add

void setup() { 
  frameRate(30);
  size(720, 480);
  noStroke(); 
  smooth();
  ed01 = loadImage ("2.png");
  ed02 = loadImage ("1.png");
  st01 = loadImage ("3.png");   
  st02 = loadImage ("open1.PNG");
  main = loadImage ("main.PNG"); 
  body = loadImage ("phone.png");
  st = loadImage ("stop.png");
  pl = loadImage ("play.png");
  bg1 = loadImage ("aa1.png");
  bg2 = loadImage ("aa2.png");
  bg3 = loadImage ("aa3.png");
  bg4 = loadImage ("aa4.png");
  hand = loadImage("hand.png");

  //basic
  f = loadFont("GillSans-UltraBoldCondensed-32.vlw");
  textFont(f);
  smooth();
  //basic

  //mouse oversize drag
  shrooms = false;
  bx = 270;

  bdifx = 0.0;
  bover = false;
  locked = false;
  //mouse oversize drag

  kk = 100;
  ll = 0;
  mm = -100;
} 
//class ip
void ip (int ipX,int ipY, float s1,float s2,float r,int c,PImage face, int fr)
{
  pushMatrix();
  translate(ipX,ipY);
  scale(s1,s2);
  rotate(radians(r));
  fill(c,50,0);
  smooth();
  beginShape();
  noStroke();
  fill(0);
  arc(30,30,40,40,0,7);
  arc(70,30,40,40,0,7);
  arc(30,140,40,40,0,7);
  arc(70,140,40,40,0,7);
  rect(30,10,40,150);
  rect(10,30,80,110);
  fill(100);
  arc(51,145,10,10,0,7);
  //eye
  eye (-95,-130); 
  //eye
  endShape();
  image(face,15,25,70,100);

  /*  image(body,0,0,100,150);
   fill(face);
   rect(15,25,70,100);
   endShape();
   if(face==1)
   {
   image(ed01,15,25,70,100);
   }
   else if(face==2) 
   {
   image(ed02,15,25,70,100);
   }
   else if(face==3)
   {
   image(st01,15,25,70,100);
   }
   else if(face==4)
   {
   image(st02,15,25,70,100);
   }
   else if(face==5)
   {
   image(pl,15,25,70,100);
   }
   else if(face==6)
   {
   image(st,15,25,70,100);
   }
   */
  popMatrix();
}


void draw() 
{

  noStroke();

  if (card == 0) {
    page1();
  }  
  else if (card == 1) {  
    page2();
  } 
  else if (card  == 2) {  
    page3();
  }
  else if (card  == 3) { 
    page4();
  }
  else if (card  == 4) {  
    page5();
  }
  else if (card  == 5) {  
    page6();
  }
  else if (card  == 6) {  
    page7();
  }
}

//page
void page1() {
  background(255);
  //motion  
  pushMatrix();
  translate(-map(mouseX/9,0,width/5,0,width),-map(mouseY/9,0,height/5,0,height));
  scale(1.5);
  image(bg2,-50,-10);
  popMatrix();
  //button size
  text("Click the box to start",width/2, height/2);
  fill(255,0,0);
  rect (x,y,w,h);
  //button size
  pushMatrix();
  translate(map(mouseX/11,0,width/5,0,width),map(mouseY/11,0,height/5,0,height));
  scale(.5);
  image (hand,-650,-560);
  popMatrix();
  translate(map(mouseX/9,0,width/5,0,width),map(mouseY/9,0,height/5,0,height));
  ip(200,40,2,2,int(random(45,46)),1,st,0);

  text("But I'm happy Because of YOU",0,100);
  //motion
}
void page2() {
  background(0);
  pushMatrix();
  translate(-map(mouseX/20,0,width/5,0,width),-map(mouseY/20,0,height/5,0,height));
  scale(1.2);
  image(bg1,0,0);
  popMatrix();
  //button size
  text("Next Page->",width/2, height/2+20);
  fill(0, 255, 0);
  ellipse(x, y, 40, 40);
  //button size
  pushMatrix();
  translate(map(mouseX/30,0,width/5,0,width),map(mouseY/30,0,height/5,0,height));
  //move

  if (kk < 200) {
    ++kk;

    ip(450,kk,1,1,120,1,ed01,0);
    text("please.....", 0,kk-100);
    //move
  }
  else
  {
    ip(450,200,1,1,120,1,ed01,0);
        text("please.....", 0,100);
  }    
  popMatrix();
}
void page3() {
  background(0);

  image(bg1,0,0);
  filter(BLUR, 6);

  //button size
  text("Next Page->",width/2, height/2+20);
  fill(0, 0, 255);
  ellipse(x, y, 40, 40);
  //button size
  text("don't leave me alone!",int(random(20,23)), int(random(50,80)));
  translate(map(mouseX/9,0,width/5,0,width),map(mouseY/9,0,height/5,0,height));
  ip(0,int(random(-10,60)),2,2,0,1,st,0);
  filter(INVERT);
}
void page4() {
  background(0);
  pushMatrix();
  translate(map(mouseX/30,0,width/2,0,width),map(mouseY/30,0,height/2,0,height));
  scale(1.2);
  image(bg3,-100,-100);
  popMatrix();

  //button size
  text("Next Page->",width/2, height/2+20);
  fill(0, 255, 255);
  ellipse(x, y, 40, 40);
  //button size

  pushMatrix();

  translate(map(mouseX/20,0,width/3,0,width),map(mouseY/20,0,height/3,0,height));

  //move
  if (ll < 80) {
    ++ll;

    ip(60,ll,1.4,1.4,30,1,st,0);

    text("Do not get wet to me", 0,ll+20);
    //move
  }
  else
  {
    ip(60,80,1.4,1.4,30,1,st,0);
    text("Do not get wet", 0,100);
  }    

  popMatrix();
}
void page5() {
  background(0);

  image(bg3,0,0);
  filter(BLUR, 6);
  text("i am delicate machine!!",int(random(100,110)),int(random(100,120)));
  //button size
  text("Next Page->",width/2, height/2+20);
  fill(0, 0, 155);
  ellipse(x, y, 40, 40);
  //button size
  translate(map(mouseX/9,0,width/5,0,width),map(mouseY/9,0,height/5,0,height));
  ip(int(random(400,450)),int(random(100,130)),3,1.5,int(random(80,110)),1,st01,0);
  filter(GRAY);
}
void page6() {
  background(0);
  pushMatrix();
  translate(map(mouseX/30,0,width/2,0,width),map(mouseY/30,0,height/2,0,height));
  image(bg4,-50,-50);
  popMatrix();
  //button size
  text("Next Page->",width/2, height/2+20);
  fill(0, 0, 255);
  ellipse(x, y, 40, 40);
  //button size
  pushMatrix();
  translate(map(mouseX/9,0,width/5,0,width),map(mouseY/9,0,height/5,0,height));
  if(mm<0)
  {  
    ++mm;
    ip(100,mm,1,1,10,1,st02,0);
    text("don't drop me",-200,mm+200);
  }
  else
  {
    star(100,-50,1,40,230);
    ip(100,0,1,1,10,1,st02,0);
    text("don't drop me",-200,200);
    beginShape();
  }
  popMatrix();
}
void page7() {

  background(0);

  image(bg4,0,0);
  filter(BLUR, 6);

  //button size
  text("Next Page->",width/2, height/2+20);
  fill(0, 0, 155);
  ellipse(x, y, 40, 40);
  //button size
  translate(map(mouseX/9,0,width/5,0,width),map(mouseY/9,0,height/5,0,height));
  ip(int(random(100,110)),int(random(0,20)),int(random(1,1.5)),int(random(1,4)),int(random(-30,30)),1,st01,0);
  filter(POSTERIZE, 4);
  fill(0,0,0);
  text(" i am easy to brake",0,-50);
}

//putton
void mousePressed() {  

  if (card == 0) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 4;
    }
    else card = 3;
  }  
  else if (card == 4) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 5;
    }
    else card = 4;
  }  
  else if (card == 5) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 6;
    }
    else card = 5;
  } 
  else if (card == 6) {

    card = 0;
  }
}

//mouse drag
void mouseDragged() {
  if((locked) && (bx >= 270) && (bx <= 370)) {
    bx = mouseX - bdifx;
  }
  if(bx > 370) {
    bx = 370;
  }
  if(bx < 270) {
    bx = 270;
  }
}
//mouse drag

//eye
void eye(int ipX,int ipY) {
  pushMatrix();
  stroke(255);
  translate(ipX,ipY);
  fill(255);
  strokeWeight(2);
  int now = millis();
  int time;

  if (closed) {
    time = timeClosed;
  }  
  else {
    time = timeOpen;
  }

  if (now - last > time) {
    if (closed) {
      closed = false;
    } 
    else {
      float a = random(0,1);
      if (a > 0.3)
      {
        closed = true;
      }
    }
    last = now;
  }

  translate(150,150);
  if (closed)
  {
    fill(255);
    line (0, 0, 0 + offset*1.5, 0);
    line (0 - offset*3, 0, 0 - offset*1.5, 0);
  }
  else {
    fill(255);
    ellipse( 0 + offset, 0, offset/3,6);
    ellipse( 0 - offset*2, 0, offset/3,6);
  }
  popMatrix();
}
//eye;
void star(int x, int y,float s,float r,int c) { 
  pushMatrix(); 
  translate(x,y); 
  scale(s); 
  rotate(radians(r)); 
  fill(c,50,0); 
  smooth(); 
  strokeWeight(2);
  fill(255,245,59);
  beginShape();
  vertex(64,32);
  vertex(80,66);
  vertex(117,71);
  vertex(90,97);
  vertex(97,134);
  vertex(63,117);
  vertex(30,134);
  vertex(37,97);
  vertex(10,71);
  vertex(47,66);
  vertex(64,32);
  endShape();
  popMatrix();
}


