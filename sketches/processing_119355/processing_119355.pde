
float angle = 0;
float angleV1 = -2;
float x = 300;
float y=20;
float speed1 = .5;
float speed = 1;
float speedy = 1;
boolean turn=false;
boolean yturn=false;
float startX1=390;
float startY1=30;
float pletter=170;
float pletter2=360;
float sletterx=300;
float timer;
int sc=1;
float sss=1;
float scaler=0.1;
float mLetter=400;
void setup()
{
  size(600,600);
}

void draw()
{
  background(255);
  fill(0);
  angle += 0.1;
  angleV1 += 0.1;
  sss+=.1;
   
  
  pushMatrix();
  translate(startX1,startY1);
 // rotate(angle);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(startX1+70,startY1);
 rotate(.3);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(startX1+140,startY1+20);
  rotate(.9);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(startX1+70,startY1);
 rotate(.3);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
  // sidways right circle start
   pushMatrix();
  translate(startX1+180,startY1+80);
  rotate(1.5);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(startX1+180,startY1+80+70);
  rotate(1.5);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
  /*
  pushMatrix();
  translate(startX1+180,startY1+80+140);
  rotate(1.5);
   
  textSize(20);
  text("gaming", 0, 0);
   
  popMatrix();
  */
 /* 
   pushMatrix();
  translate(startX1+180,startY1+80+210);
  rotate(1.6);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  */
  pushMatrix();
  translate(startX1+180,startY1+80+210);
  rotate(angle);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1+180,startY1+80+280);
  rotate(1.6);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1+180,startY1+80+350);
  rotate(1.6);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1+180,startY1+80+420);
  rotate(2);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1+140,startY1+80+480);
  rotate(3.3);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1+70,startY1+80+470);
  rotate(3.15);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  /*
  pushMatrix();
  translate(startX1+0,startY1+80+470);
  rotate(3.15);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  */
  pushMatrix();
  translate(startX1-70,startY1+80+470);
  rotate(angle);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-140,startY1+80+470);
  rotate(3.15);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-210,startY1+80+470);
  rotate(3.15);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-280,startY1+80+470);
  rotate(4);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-330,startY1+80+420);
  rotate(4.4);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-350,startY1+80+350);
  rotate(4.4);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-370,startY1+80+280);
  rotate(4.7);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  /*
  pushMatrix();
  translate(startX1-370,startY1+80+210);
  rotate(4.7);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  */
  pushMatrix();
  translate(startX1-370,startY1+80+140);
  rotate(angle);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-370,startY1+80+70);
  rotate(4.7);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-370,startY1+80+0);
  rotate(5.1);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-350,startY1+80-70);
  rotate(6.2);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-280,startY1+80-80);
  rotate(0);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  pushMatrix();
  translate(startX1-210,startY1+80-80);
  rotate(0.0);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  /*
  pushMatrix();
  translate(startX1-140,startY1+80-80);
  rotate(0.0);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  */
  pushMatrix();
  translate(startX1-70,startY1+80-80);
  rotate(angle);
   
  textSize(20);
  text("gaming", 0, 0);
  popMatrix();
  // letters start
 // pletter=170
  pushMatrix();
  translate(pletter,100);
 // rotate(angle);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(pletter+30,100);
 // rotate(angle);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(pletter+60,100);
  rotate(1.6);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(pletter+60,130);
  rotate(3.1);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(pletter+20,130);
  rotate(1.6);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  // second letter
  // sletterx=300
  
  pushMatrix();
  translate(sletterx,100);
  rotate(0);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx-30,100);
  rotate(0);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx-30,100);
  rotate(1.6);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx-30,140);
  rotate(0);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx,140);
  rotate(0);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx+30,140);
  rotate(1.6);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx,180);
  rotate(0);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(sletterx-30,180);
  rotate(0);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  // pletter 2 
  //pletter2= 
  pushMatrix();
  translate(pletter2,100);
 // rotate(angle);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(pletter2+30,100);
 // rotate(angle);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(pletter2+60,100);
  rotate(1.6);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(pletter2+60,130);
  rotate(3.1);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
  pushMatrix();
  translate(pletter2+20,130);
  rotate(1.6);
   
  textSize(10);
  text("gaming", 0, 0);
   
  popMatrix();
   pushMatrix();
  translate(300,400);
  rotate(angleV1);
   
  textSize(sss);
  text("MY WORLD", 0, 0);
   
  popMatrix();
  
  timer+=.02;
  println(timer);
  if(timer>10)
  {
    sc+=1;
    scaler+=.01;
    pushMatrix();
    fill(255,0,0);
    rectMode(CENTER);
    noStroke();
    rect(300,300,sc,sc);
    if(timer>25)
    {fill(0);
    int a=(int)random(20,350);
    int b=(int)random(100,500);
    translate(a,b);
  rotate(0);
 //  scale(scaler);
  textSize(50);
  text("responsibility", 0, 0);
  int c=(int)random(20,350);
    int d=(int)random(100,500);
    translate(c,d);
  rotate(0);
 //  scale(scaler);
  textSize(50);
  text("responsibility", 0, 0);
    }
    popMatrix();
  }
}




