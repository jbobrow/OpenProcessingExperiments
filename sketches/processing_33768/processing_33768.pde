
int ball_h=40;
int ball_w=40;
float ball_x=0;
float ball_y=0;
float ball_speedx=3;
float ball_speedy=10;
void setup(){
  size(500,500);
} 

void draw(){
  background(255,40,230);
  ellipse(ball_x,ball_y,ball_w,ball_h);
  ball_y=ball_y+ball_speedy;
  if((ball_y+ball_h>500)||(ball_y<0)){
      ball_speedy=ball_speedy*-1;
  }
  ball_x=ball_x+ball_speedx;
  if((ball_x+ball_w>500)||(ball_x<0)){
      ball_speedx=ball_speedx*-1;
  }
  
}



