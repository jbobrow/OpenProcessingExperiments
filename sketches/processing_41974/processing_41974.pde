
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;
AudioPlayer song8;
AudioPlayer song9;
AudioPlayer song10;
AudioPlayer song11;
AudioPlayer song12;
AudioPlayer song13;
AudioPlayer song14;
AudioPlayer song15;
AudioPlayer song16;
AudioPlayer song17;

int numBalls = 17;
float spring = 0.0005;
float gravity = 0.001;
float friction = -0.9;
Ball[] balls = new Ball[numBalls];

float[] yCoord;      //<-- drawing lines variables
float[] speed;
int space=1;         //<--end

int n = 170;
int value = 210;

int w = 15; 
int h = 70;  //variables for void rectBars
int w2 = 13; 
int h2 = 68;
int w3 = 11; 
int h3 = 66;
int w4 = 9; 
int h4 = 64;
int w5 = 7; 
int h5 = 62;
int w6 = 5; 
int h6 = 60;
int w7 = 3; 
int h7 = 58;
int w8 = 1; 
int h8 = 56;
int f = 8;


color col;

int y = 166;
void setup() 
{
  minim = new Minim(this);
  song1 = minim.loadFile("1.wav");
  song2 = minim.loadFile("2.wav");
  song3 = minim.loadFile("3.wav");
  song4 = minim.loadFile("4.wav");
  song5 = minim.loadFile("5.wav");
  song6 = minim.loadFile("6.wav");
  song7 = minim.loadFile("7.wav");
  song8 = minim.loadFile("8.wav");
  song9 = minim.loadFile("9.wav");
  song10 = minim.loadFile("10.wav");
  song11 = minim.loadFile("11.wav");
  song12 = minim.loadFile("12.wav");
  song13 = minim.loadFile("13.wav");
  song14 = minim.loadFile("14.wav");
  song15 = minim.loadFile("15.wav");
  song16 = minim.loadFile("16.wav");
 

  size(700,400);


yCoord = new float [width/space+1];    //drawing lines<-- setup
speed = new float[width/space+1];
for(int i=0;i<yCoord.length;i=i+1) {  
    yCoord[i]=0;  
    speed[i]=random(0.05,1.05);  

}                                    //drawing lines<--setup end



  noStroke();
  smooth();
  fill(0);
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(1, 45), i, balls);
  }
}

void draw() 
{
  background(0,40,255);
  fill(255);
rect(505, 180, 15,70);
rect(535, 220, 15,70);
rect(565, 90, 15,70);
rect(595, 280, 15,70);
rect(625, 30, 15,70);
rect(655, 90, 15,70);
  //blueCircle();

  rectBars(10+f,30,1,1);      //1
  rectBars(40+f,90,1,1);      //2
  rectBars(70+f,180,1,1);      //3
  rectBars(100+f,220,1,1);     //4 
  rectBars(130+f,280,1,1);        //5
  rectBars(160+f,220,1,1);        //6
  rectBars(190+f,180,1,1);        //7
  rectBars(220+f,220,1,1);        //8
  rectBars(250+f,410,1,1);        //9
  rectBars(280+f,380,1,1);        //10
  rectBars(310+f,280,1,1);        //11
  rectBars(340+f,380,1,1);        //12
  rectBars(370+f,220,1,1);      //13
  rectBars(400+f,280,1,1);      //14
  rectBars(430+f,180,1,1);      //15
  rectBars(460+f,220,1,1);      //16


  
  for (int i = 0; i < numBalls; i++) {
    balls[i].collide();
    balls[i].move();
    balls[i].display();
  }
}

class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;

  Ball(float xin, float yin, float din, int idin, Ball[] oin) { 
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 

  void collide() {
    for (int i = id + 1; i < numBalls; i++) {
      float dx = mouseX - x;
      float dy = mouseY - y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = x + cos(angle) * minDist;
        float targetY = y + sin(angle) * minDist;
        float ax = (targetX - others[i].x) * spring;
        float ay = (targetY - others[i].y) * spring;
        vx -= ax;
        vy -= ay;
        others[i].vx += ax;
        others[i].vy += ay;
      }
    }
  }

  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }

  void display() { 

    fill(52,184,247);
    ellipse(x, y, diameter, diameter);
  }
}



void rectBars(int xloc, int yloc, int width, int height)
{   
  noStroke();

  fill(255);
  rect(xloc, yloc, width*w, height*h);


}



void mouseMoved()
{
  if ((mouseX>24.5 && mouseX<=26.5) && (mouseY>30 && mouseY<=190)) 
   {song1.play();
    song1.rewind();}                        //<--1
    
     if ((mouseX>624.5 && mouseX<=626.5) && (mouseY>30 && mouseY<=190)) 
   {song1.play();
    song1.rewind();} 
  
  if ((mouseX>54.5 && mouseX<=56.5) && (mouseY>90 && mouseY<=160)) 
   {song2.play();
    song2.rewind();}    //<--2
    
    if ((mouseX>654.5 && mouseX<=656.5) && (mouseY>90 && mouseY<=160)) 
   {song2.play();
    song2.rewind();}  
    
    if ((mouseX>564.5 && mouseX<=566.5) && (mouseY>90 && mouseY<=160)) 
   {song2.play();
    song2.rewind();}  
  
  if ((mouseX>84.5 && mouseX<=86.5) && (mouseY>180 && mouseY<=250)) 
   {song3.play();
    song3.rewind();}                        //<--3
  
  if ((mouseX>114.5 && mouseX<=116.5) && (mouseY>220 && mouseY<=290)) 
   {song4.play();
    song4.rewind();}                        //<--4
  
  if ((mouseX>144.5 && mouseX<=146.5) && (mouseY>280 && mouseY<=350)) 
   {song5.play();
    song5.rewind();}                        //<--5
    
    if ((mouseX>594.5 && mouseX<=596.5) && (mouseY>280 && mouseY<=350)) 
   {song5.play();
    song5.rewind();} 
  
  if ((mouseX>174.5 && mouseX<=176.5) && (mouseY>220 && mouseY<=290)) 
   {song6.play();
    song6.rewind();}                        //<--6
  
  if ((mouseX>204.5 && mouseX<=206.5) && (mouseY>180 && mouseY<=250)) 
   {song7.play();
    song7.rewind();}                        //<--7
  
  if ((mouseX>234.5 && mouseX<=236.5) && (mouseY>220 && mouseY<=290)) 
   {song8.play();
    song8.rewind();}                        //<--8
  
  if ((mouseX>264.5 && mouseX<=266.5) && (mouseY>410 && mouseY<=480)) 
   {song9.play();
    song9.rewind();}                        //<--9
    
     if ((mouseX>654.5 && mouseX<=656.5) && (mouseY>410 && mouseY<=480)) 
   {song9.play();
    song9.rewind();} 
  
  if ((mouseX>294.5 && mouseX<=296.5) && (mouseY>380 && mouseY<=450)) 
   {song10.play();
    song10.rewind();}                        //<--10
    
    if ((mouseX>624.5 && mouseX<=626.5) && (mouseY>380 && mouseY<=450)) 
   {song10.play();
    song10.rewind();} 
  
  if ((mouseX>324.5 && mouseX<=326.5) && (mouseY>280 && mouseY<=350)) 
   {song11.play();
    song11.rewind();}                        //<--11
  
  if ((mouseX>354.5 && mouseX<=356.5) && (mouseY>380 && mouseY<=450)) 
   {song12.play();
    song12.rewind();}                        //<--12
  
  if ((mouseX>384.5 && mouseX<=386.5) && (mouseY>220 && mouseY<=290)) 
   {song13.play();
    song13.rewind();}                        //<--13
  
  if ((mouseX>414.5 && mouseX<=416.5) && (mouseY>280 && mouseY<=350)) 
   {song14.play();
    song14.rewind();}                        //<--14
  
  if ((mouseX>444.5 && mouseX<=446.5) && (mouseY>180 && mouseY<=250)) 
   {song15.play();
    song15.rewind();}      //<--15
    
     if ((mouseX>504.5 && mouseX<=506.5) && (mouseY>180 && mouseY<=250)) 
   {song15.play();
    song15.rewind();}  
  
  if ((mouseX>474.5 && mouseX<=476.5) && (mouseY>220 && mouseY<=290)) 
   {song16.play();
    song16.rewind();}          //<--16
    
    if ((mouseX>534.5 && mouseX<=536.5) && (mouseY>220 && mouseY<=290)) 
   {song16.play();
    song16.rewind();}  
}

