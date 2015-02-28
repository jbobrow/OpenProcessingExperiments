
/*
Author: Anita Chen
Purpose:a window with seaweed photosynthesis.
Concept:1.use loop to create Wave and seaweed.
        2.use (times)second to control the bubble(x,y)coordinate and size.
Reference:[1]Reas, C., & Fry, B. (2007). Processing: a programming handbook for visual designers and artists: The MIT Press.(pp119-120.)
          [2]http://www.openprocessing.org/visuals/?visualID=8011
*/
float offset = 100.0;
float angleInc = PI/40.0;
float angle=0.0;
float m =millis();
float s=second();
float s2=second();
float s3=second();
float diam=1.0;
int speed;
color c1=color(27, 58, 79, 180);//blue
color c2=color(88, 155, 205, 100);//light blue
color c3=color(140, 196, 6);//light green
color c4=color(23, 80, 19);//green
color c5=color(200, 50);//bubbleColors//light gray
color c6=color(180, 250, 251, 50);//bubbleColors//very light blue
color c7=color(167, 109, 163, 80);//bubbleColors//purple

void setup() {
  size(300, 500);
  frameRate(3);
}
void Wave1() {//海浪Reference:[1]
  noStroke();
  for (int x=0;x<width;x+=2) {
    float y=20+(sin(angle)*15.0);
    rect(x, y, 2, height);
    angle +=PI/94.0;//波高頻率
  }
}

void Wave2() {//海浪Reference:[1]
  noStroke();
  for (int x=0;x<width;x+=2) {
    float y=30+(sin(angle)*30.0);
    rect(x, y, 2, height);
    angle +=PI/125.0;//波高頻率
  }
}
void seaweed() {//海草Reference:[1]
  noStroke();
  int a=height;
  for (int y2 = a; y2>=(a/5)*3; y2-=3) {
    float x2 =offset+ 50 + (sin(angle) * 20);
    fill(c3, random(50, 200));
    rect(x2, y2, 10, 2);
    x2 = offset + (cos(angle) * 40);
    fill(c4, random(80, 180));
    rect(x2, y2 +20, random(10, 25), 2);
    angle += angleInc;
  }
}
void Bubble1() {//Reference:[2]
  noStroke();
  s = s+9;
  float b=height-s;
  fill(c7);
  ellipse(cos(s)*10+200, b, diam, diam);
  ellipse(cos(s)*5+100, (b/5)*4, diam, diam);
  fill(c5);
  ellipse(sin(s)*20+250, (b/7)*6, diam, diam);
  ellipse(cos(s)*2+50, b, diam, diam);
  diam +=1;
  if (b<60) {
    s=0;
    diam=1;
  }
}  
void Bubble2() {//Reference:[2]
  noStroke();
  s2 = s2+0.64;
  float u=height*1.1-s;
  ellipse(sin(s2)*2+180, u, diam/2, diam/2);
  ellipse(sin(s2)*5+150, (u/5)*4, diam/2, diam/2);
  ellipse(cos(s2)*20+220, (u/7)*6, diam/2, diam/2);
  ellipse(sin(s2)*2+80, u, diam/2, diam/2);
}  
void Bubble3() {//Reference:[2]
  s3 = s3+0.34;
  float w=height*1.5-s;
  ellipse(sin(s3)*2+180, w-s3, 8, 8);
  ellipse(cos(s3)*5+150, w-s3, 4, 4);
  ellipse(cos(s3)*20+220, (w/5)*4, 6, 6);
  ellipse(sin(s3)*2+80, w, 10, 10);
  ellipse(sin(s3)*3+250, w-s3, 4, 4);
  ellipse(sin(s3)*15+20, (w/5)*4, 6, 6);
}  

void draw() {
  /*
  speed=8;//間隔一段時間更新背景//波紋出現但變成畫面閃爍
   if (frameCount%speed==2) {
   //background(255);
   }*/
  smooth();
  background(180, 250, 251);
  fill(c2);
  Wave2();
  fill(c1);
  Wave1();
  Bubble1();
  Bubble1();
  fill(c6);
  Bubble2();
  fill(c5);
  Bubble3();
  seaweed();
  scale(0.4, 1.1);
  seaweed();
}
void keyPressed() {
  saveFrame("photosynthesis.jpg");
}


