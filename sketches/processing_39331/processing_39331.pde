
int ball_x;
int ball_y;
int ball_dirx;
int ball_diry;
int ball_size;
int paddle_x;
int paddle_y;
int paddle_size;
int cR;
int cG;
int cB;

void setup(){
  size(600,300);
  smooth();
  ellipseMode(RADIUS);
  ball_x=0;
  ball_y=0;
  ball_dirx=1;
  ball_diry=2;
  ball_size=10;
  paddle_x=mouseX;
  paddle_y=mouseY;
  paddle_size=30;
  cR=0;
  cG=255;
  cB=0;
}

void draw(){
  fill(cR, cG, cB);
  background(255);
  rect(mouseX,mouseY, paddle_size,paddle_size);
  ellipse(ball_x,ball_y,10,10);
  ball_x += ball_dirx;
  ball_y += ball_diry;
  if(ball_x == paddle_x){
    ball_dirx = -1;
  }
  if(ball_x < mouseX+20 && ball_y > mouseY-20 && ball_y < mouseY+20){
    ball_dirx=1;
  }
  if(ball_y > mouseY-20 && ball_x > mouseX-20 && ball_x < mouseX+20){
    ball_dirx=1;
  }
  if(ball_y < mouseY+20 && ball_x > mouseX-20 && ball_x < mouseX+20){
    ball_dirx=1;
  }
  //if(ball_y > mouseY-20 || ball_y < mouseY+20){
    //ball_dirx=-2;
  if(ball_x > width-10){
    ball_dirx = -1;
    cR=255;
    cG=0;
    cB=0;
  }
  if(ball_y > height-10){
    ball_diry = -2; 
    cR=255;
    cG=255;
    cB=0;
  }
  if(ball_x < 0){
    ball_dirx = 1;
    cR=0;
    cG=255;
    cB=0;
  }
  
  if(ball_y <0){
    ball_diry = 2;
    cR=0;
    cG=255;
    cB=255;
  }
}

