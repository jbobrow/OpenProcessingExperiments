
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

  size(500,500);

yCoord = new float [width/space+1];    //drawing lines<-- setup
speed = new float[width/space+1];
for(int i=0;i<yCoord.length;i=i+1) {  
    yCoord[i]=0;  
    speed[i]=random(0.05,1.05);  

}                                    //drawing lines<--setup end

stroke(91,156,236);
ellipse(150,450,200,200);

  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(10, 45), i, balls);
  }
}

void draw() 
{
  background(34,141,168);


  blueCircle();

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

stroke(216,231,230,15);                    
  for(int i=18;i<33;i=i+1) {                  //<-- drawing lines code  1
    line(i*space,100,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i]; }  
                                     
  for(int i=48;i<63;i=i+1) {                   //<-- drawing lines code 2
    line(i*space,160,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }                                        
               
  for(int i=78;i<93;i=i+1) {                  //<-- drawing lines code 3
    line(i*space,250,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i]; } 
     
  for(int i=108;i<123;i=i+1) {                //<-- drawing lines code 4
    line(i*space,290,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }    

  for(int i=138;i<153;i=i+1) {                //<-- drawing lines code 5
    line(i*space,350,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }    

  for(int i=168;i<183;i=i+1) {               //<-- drawing lines code 6
    line(i*space,290,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }    

  for(int i=198;i<213;i=i+1) {                //<-- drawing lines code 7
    line(i*space,250,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }

  for(int i=228;i<243;i=i+1) {                //<-- drawing lines code 8
    line(i*space,290,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=258;i<273;i=i+1) {                //<-- drawing lines code 9
    line(i*space,480,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=288;i<303;i=i+1) {                //<-- drawing lines code 10
    line(i*space,450,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=318;i<333;i=i+1) {                //<-- drawing lines code 11
    line(i*space,350,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=348;i<363;i=i+1) {                //<-- drawing lines code 12
    line(i*space,450,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=378;i<393;i=i+1) {                //<-- drawing lines code 13
    line(i*space,290,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=408;i<423;i=i+1) {                //<-- drawing lines code 14
    line(i*space,350,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=438;i<453;i=i+1) {                //<-- drawing lines code 15
    line(i*space,250,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
  
  for(int i=468;i<483;i=i+1) {                //<-- drawing lines code 16
    line(i*space,290,i*space,yCoord[i]); 
    yCoord[i]= yCoord[i] + speed[i];  }
    
  
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

    fill(value);
    ellipse(x, y, diameter, diameter);
  }
}

void blueCircle()
{
 //--bottom left
  noStroke();
  fill(38,157,187,40);
  ellipse(0,500,350,350);

  fill(43,175,208,50);
  ellipse(0,500,250,250);
  
  fill(61,185,216,80);
  ellipse(0,500,160,160);

  fill(85,193,221,80);
  ellipse(0,500,90,90);

  fill(105,201,224,80);
  ellipse(0,500,60,60);

  fill(133,211,231,80);
  ellipse(0,500,45,45);

  fill(167,223,237,80);
  ellipse(0,500,35,35);
  
  fill(189,232,242,80);
  ellipse(0,500,30,30);   

  //top middle 1/2

  fill(43,175,208,50);
  ellipse(250,50,35,35);

  fill(61,185,216,80);
  ellipse(250,50,26,26);

  fill(85,193,221,80);
  ellipse(250,50,22,22);

  fill(105,201,224,80);
  ellipse(250,50,15,15);

  fill(133,211,231,80);
  ellipse(250,50,10,10);

  fill(167,223,237,80);
  ellipse(250,50,5,5);
  
  // 2/2

   fill(43,175,208,50);
  ellipse(250,50,35,35);

  fill(61,185,216,80);
  ellipse(250,50,26,26);

  fill(85,193,221,80);
  ellipse(250,50,22,22);

  fill(105,201,224,80);
  ellipse(250,50,15,15);

  fill(133,211,231,80);
  ellipse(250,50,10,10);

  fill(167,223,237,80);
  ellipse(250,50,5,5);

  // --
  
  fill(43,175,208,50);
  ellipse(400,400,70,70);

  fill(61,185,216,80);
  ellipse(400,400,50,50);

  fill(85,193,221,80);
  ellipse(400,400,35,35);

  fill(105,201,224,80);
  ellipse(400,400,15,15);

  fill(133,211,231,80);
  ellipse(400,400,10,10);

  fill(167,223,237,80);
  ellipse(400,400,5,5);
  
    fill(133,211,231,80);
  ellipse(400,470,10,10);

  fill(167,223,237,80);
  ellipse(400,450,5,5);
  
  //-- right side
  
  fill(43,175,208,50);
  ellipse(500,200,100,100);

  fill(61,185,216,80);
  ellipse(500,200,60,60);

  fill(85,193,221,80);
  ellipse(500,200,40,40);

  fill(105,201,224,80);
  ellipse(500,200,30,30);

  fill(133,211,231,80);
  ellipse(500,200,25,25);

  fill(167,223,237,80);
  ellipse(500,200,5,5);  
  
    //--top left
    
    fill(43,175,208,50);
  ellipse(50,100,120,120);

  fill(61,185,216,80);
  ellipse(50,100,80,80);

  fill(85,193,221,80);
  ellipse(50,100,50,50);

  fill(105,201,224,80);
  ellipse(50,100,30,30);

  fill(133,211,231,80);
  ellipse(50,100,25,25);

  fill(167,223,237,80);
  ellipse(50,100,5,5); 
  
  //--1 mini
  
   fill(43,175,208,50);
  ellipse(0,350,35,35);

  fill(61,185,216,80);
  ellipse(0,350,26,26);

  fill(85,193,221,80);
  ellipse(0,350,22,22);

  fill(105,201,224,80);
  ellipse(0,350,15,15);

  fill(133,211,231,80);
  ellipse(0,350,10,10);

  fill(167,223,237,80);
  ellipse(0,350,5,5);
  
  //--2 mini
  
   fill(43,175,208,50);
  ellipse(80,350,35,35);

  fill(61,185,216,80);
  ellipse(80,350,26,26);

  fill(85,193,221,80);
  ellipse(80,350,22,22);

  fill(105,201,224,80);
  ellipse(80,370,15,15);

  fill(133,211,231,80);
  ellipse(50,400,10,10);

  fill(167,223,237,80);
  ellipse(50,400,5,5);
  
  //--3 mini
  
   fill(43,175,208,50);
  ellipse(180,430,50,50);

  fill(61,185,216,80);
  ellipse(180,430,40,40);

  fill(85,193,221,80);
  ellipse(130,480,35,35);

  fill(105,201,224,80);
  ellipse(130,480,15,15);

  fill(133,211,231,80);
  ellipse(130,480,10,10);

  fill(167,223,237,80);
  ellipse(130,480,5,5);
  
  //--
  
    fill(43,175,208,50);
  ellipse(180,160,70,70);

  fill(61,185,216,80);
  ellipse(180,160,50,50);

  fill(85,193,221,80);
  ellipse(160,120,35,35);

  fill(105,201,224,80);
  ellipse(120,100,15,15);

  fill(133,211,231,80);
  ellipse(160,120,10,10);

  fill(167,223,237,80);
  ellipse(400,60,5,5);
  
  //--
  
   fill(43,175,208,50);
  ellipse(400,40,120,120);
  
  fill(61,185,216,80);
  ellipse(400,40,90,90);

  fill(85,193,221,80);
  ellipse(400,40,35,35);
  
  fill(133,211,231,80);
  ellipse(400,40,10,10);
  
  fill(167,223,237,80);
  ellipse(400,40,5,5);

  fill(105,201,224,80);
  ellipse(300,90,15,15);

  fill(133,211,231,80);
  ellipse(420,60,10,10);

  fill(167,223,237,80);
  ellipse(480,40,5,5);
}



void rectBars(int xloc, int yloc, int width, int height)
{   
  noStroke();

  fill(216,231,230);
  rect(xloc, yloc, width*w, height*h);
  fill(207,226,224);
  rect(xloc+1.5, yloc+1.5, width*w2, height*h2);
  
  fill(202,223,221);
  rect(xloc+2.5, yloc+2.5, width*w3, height*h3);
  fill(201,222,220);
  rect(xloc+3.5, yloc+3.5, width*w4, height*h4);

  fill(189,216,212);
  rect(xloc+4.5, yloc+4.5, width*w5, height*h5);
  fill(182,211,209);
  rect(xloc+5.5, yloc+5.5, width*w6, height*h6);

  fill(179,208,205);
  rect(xloc+6.5, yloc+6.5, width*w7, height*h7);
  fill(174,206,203);
  rect(xloc+7.5, yloc+7.5, width*w8, height*h8);
}



void mouseMoved()
{
  if ((mouseX>24.5 && mouseX<=26.5) && (mouseY>30 && mouseY<=90)) 
   {song1.play();
    song1.rewind();}                        //<--1
  
  if ((mouseX>54.5 && mouseX<=56.5) && (mouseY>90 && mouseY<=160)) 
   {song2.play();
    song2.rewind();}                        //<--2
  
  if ((mouseX>84.5 && mouseX<=86.5) && (mouseY>180 && mouseY<=250)) 
   {song3.play();
    song3.rewind();}                        //<--3
  
  if ((mouseX>114.5 && mouseX<=116.5) && (mouseY>220 && mouseY<=290)) 
   {song4.play();
    song4.rewind();}                        //<--4
  
  if ((mouseX>144.5 && mouseX<=146.5) && (mouseY>280 && mouseY<=350)) 
   {song5.play();
    song5.rewind();}                        //<--5
  
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
  
  if ((mouseX>294.5 && mouseX<=296.5) && (mouseY>380 && mouseY<=450)) 
   {song10.play();
    song10.rewind();}                        //<--10
  
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
    song15.rewind();}                        //<--15
  
  if ((mouseX>474.5 && mouseX<=476.5) && (mouseY>220 && mouseY<=290)) 
   {song16.play();
    song16.rewind();}                        //<--16
}

