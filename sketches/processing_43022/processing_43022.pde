
float x1 = 0;
float y1 = 0;
float x1Speed = 4.5;//zheli yong shuzhi kongzhi xiaoqiu xingjin de jiaodu 
float y1Speed = 2.8;//x bu deng yu y de shihou xiaoqiu jiu buhui yanzhe duijiao xian xingjin
float r1 = 22;

float x2 = 0;
float y2 = 0;
float x2Speed = 6;//zheli yong shuzhi kongzhi xiaoqiu xingjin de jiaodu 
float y2Speed = 1.5;//x bu deng yu y de shihou xiaoqiu jiu buhui yanzhe duijiao xian xingjin
float r2 = 44;

float x3 = 60;
float y3 = 40;
float x3Speed = 8;
float y3Speed = 5;
float r3 = 10;

float x4 = 90;
float y4 = 90;
float x4Speed = 1.8;
float y4Speed = 3.6;
float r4 = 20;

float x5 = 90;
float y5 = 90;
float x5Speed = 2.5; 
float y5Speed = 5.5;
float r5 = 35;

float r;
float g;
float b;
float a;


void setup(){
  size(400,400);
}

void draw(){
  background(200);
  smooth();
  frameRate(30);
  x1 = x1 + x1Speed;
  y1 = y1 + y1Speed;
  
   x2 = x2 + x2Speed;
  y2 = y2 + y2Speed;
  
  x3 = x3+x3Speed;
  y3 = y3 + y3Speed;
  
  x4 = x4 + x4Speed;
  y4 = y4 + y4Speed;
  
  x5 = x5 + x5Speed;
  y5 = y5 + y5Speed;
  
  
  if((x1 > width-11)||(x1 < 0)){
    x1Speed = x1Speed * -1;
    r1= 64;
  }
    if((x2 > width-22)||(x2 < 0)){
    x2Speed = x2Speed * -1;
    r2= 80;
  }
  
  if((x3 > width-5)||(x3 < 0)){
    x3Speed =x3Speed * -1;
    r3 = 20;
    
  }
  
  if((x4 > width-10)||(x4 < 0)){
    x4Speed =x4Speed * -1;
    r4 = 25;
    
  }
  
  
  if((x5 > width-17.5)||(x5 < 0)){
    x5Speed =x5Speed * -1;
    r5 = 55;
    
  }
  
  if((y1 > height -11)||(y1 < 0)){
    y1Speed = y1Speed * -1;
    r1 = 64;
  }
  
    if((y2 > height -22)||(y2 < 0)){
    y2Speed = y2Speed * -1;
    r2 = 80;
  }
  
    if((y3 > height -5)||(y3 < 0)){
    y3Speed = y3Speed * -1;
    r3 = 20;
  }
  
     if((y4 > height -10)||(y3 < 0)){
    y4Speed = y4Speed * -1;
    r4 = 25;
  }
  
  if((y5 > height -17.5)||(y5 < 0)){
    y5Speed = y5Speed * -1;
    r5 = 55;
  }
  
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  a = random(0,255);
  
  stroke(255);
  fill(#FF1F1F,60);//liang ge yuan de suijiyanse yiyang 
  ellipse(x1,y1,r1,r1);
  fill(#5AABFF,40);
  ellipse(x2,y2,r2,r2);
  fill(#52FFBE,50);
  ellipse(x3,y3,r3,r3);
  fill(#E7FF52,50);

  ellipse(x4,y4,r4,r4);
   fill(#FF7D12,50);
  
  ellipse(x5,y5,r5,r5);
 
  line(x1,y1,x2,y2);//xian lai lianjie liangge xiaoqiu yuandian
  line(x1,y1,x3,y3);
  line(x2,y2,x3,y3);
  line(x2,y2,x4,y4);
  line(x4,y4,x1,y1);
  line(x4,y4,x3,y3);
  line(x5,y5,x4,y4);
  line(x5,y5,x3,y3);
  line(x5,y5,x2,y2);
  line(x5,y5,x1,y1);
  
  r1 = r1 -2 ;
  r1 = constrain(r1,22, 64);
  
  r2 = r2 -2 ;
  r2 = constrain(r2,44, 80);
  
    r3 = r3 -2 ;
  r3 = constrain(r3,10, 20);
  
   r4 = r4 -2 ;
  r4 = constrain(r4,20, 25);
  
   r5 = r5 -2 ;
  r5 = constrain(r5,35, 55);
  
}


