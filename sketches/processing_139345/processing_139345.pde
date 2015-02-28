
int x = 0;
int x2 = 10;
int ball = 30;
int ball2 = 260;
float ball3 = 120;
int speed = 1;
int speed2 = -2;
float speed3 = 1.5;
int n = 0;

void setup(){
  size(300,250);
}

void draw(){
  background(0);
  
  //holy inefficient code, I know.
  stroke(255,165,0);
  fill(255,165,0);
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  rect(x,0,10,250); 
  x=x+20;
  x=0;
  
  stroke(0);
  fill(0);
  ellipse(ball,125,30,30);
  ball = ball+speed;
  if(ball>width-16 || ball < 16){
    speed = -1*speed;
  }
  stroke(0);
  fill(0);
  ellipse(ball3,200,50,50);
  ball3 = ball3+speed3;
  if(ball3>width-26 || ball3<26){
    speed3 = -1*speed3;
  }
  
  stroke(255,165,0);
  fill(255,165,0);
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  rect(x2,0,10,250);
  x2=x2+20;
  x2=10;
  
  stroke(0);
  fill(0);
  ellipse(ball2,40,40,40);
  ball2 = ball2+speed2;
  if(ball2>width-21 || ball2 <21){
    speed2=speed2*-1;
  }
   if (frameCount/5 == n){ 
  gifExport.setDelay(1);
  gifExport.addFrame();
  n = n+1;
  }
}
