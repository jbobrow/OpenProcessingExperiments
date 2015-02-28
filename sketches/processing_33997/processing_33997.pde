
int ball_number=50;
float[]ball_x=new float [ball_number];
float[]ball_y=new float[ball_number];
float[]ball_speedx=new float[ball_number];
float[]ball_speedy=new float[ball_number];

void setup(){
  size(500,500);
  for (int i=0;i<ball_number;i=i+1){
    ball_x[i]=random(15,485);
    ball_y[i]=random(15,485);
    ball_speedx[i]=random(10);
    ball_speedy[i]=random(10);
  }
}

void draw(){
  background(255);
  for (int i=0; i<ball_number;i=i+1){
ball_x[i]=ball_speedx[i]+ball_x[i];
ball_y[i]=ball_speedy[i]+ball_y[i];
fill(255,128,128);
noStroke();
ellipse(ball_x[i],ball_y[i],30,30);

if(ball_x[i]>=485){
ball_speedx[i]=ball_speedx[i]*-1;
}
if(ball_x[i]<=15){
  ball_speedx[i]=ball_speedx[i]*-1;
  
}

if(ball_y[i]>=485){
ball_speedy[i]=ball_speedy[i]*-1;
}
if(ball_y[i]<=15){
  ball_speedy[i]=ball_speedy[i]*-1;
  
}
  }
}

