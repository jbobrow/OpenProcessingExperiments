
int screen_size = 400;
int paddle_height = screen_size/10;
int paddle_width = 10;
int paddle_y = (screen_size-paddle_width)/2;
int num_balls = 1;

Ball [] balls;
Ball ballA;
Ball ballB;

PFont font;

int bounce = 0;

boolean game_over= false;

void setup(){
  size(screen_size,screen_size);
  background(0);
  balls = new Ball[num_balls];
  for(int i = 0;i<num_balls;i++){
    balls[i] = new Ball(random(paddle_width,screen_size-paddle_width),random(paddle_width,screen_size-paddle_width),random(-2,2),random(-2,2));
    balls[i].setcolor(int(random(255)),int(random(255)),int(random(255)));  
  }
  font = loadFont("Aharoni-Bold-48.vlw");
  textFont(font,20);
  
  //ballA = new Ball(random(0,screen_size),random(0,screen_size),random(-2,2),random(-2,2));
  //ballB = new Ball(random(0,screen_size),random(0,screen_size),random(-2,2),random(-2,2));
  //ballB.setcolor(255,0,0);
}

void draw(){
  
  background(0);
  if(!game_over){
    draw_paddles();
    for(int i = 0;i<num_balls;i++){
    balls[i].draw_ball();  
    }
    
    
    //ballA.draw_ball();
    //ballB.draw_ball();
    fill(255,0,255);
    textAlign(CENTER);
    text("Score:" + str(bounce),screen_size/2, screen_size/2);
    
    
    
  }
  else{
    fill(0,0,255);
    textAlign(CENTER,CENTER);
    text("Game Over!", 5*screen_size/12, screen_size/3, 70, 70);
    fill(255,0,255);
    text("Final Score:" + str(bounce), 5*screen_size/12, 2*screen_size/3, 70, 70);
    draw_paddles();
  }
  
}

void draw_paddles(){
  fill(64,255,8);
  rect(0, mouseY,paddle_width,paddle_height);
  rect(screen_size - paddle_width, mouseY,paddle_width,paddle_height);
}

class Ball{
  float x;
  float y;
  int ball_size =10;
  float vx;
  float vy;
  char[] colors = {0,255,0};
  
  Ball(float ballx, float bally, float ballvx, float ballvy){
    x = ballx;
    y = bally;
    vx = ballvx;
    vy = ballvy;
  }
  
  void draw_ball(){
    fill(colors[0],colors[1],colors[2]);
    ellipse(x,y,ball_size,ball_size);
  //Now check and see if the ball should bounce off of anything.
  if((y<0) || (y>screen_size)){
    vy = -vy;
    //bounce++;
  }
  else if((x >= (screen_size - paddle_width)) && (y>mouseY&&y<(mouseY+paddle_height))){
    vx = -vx;
    bounce++;
  }
  else if((x<= (paddle_width)) && (y>mouseY&&y<(mouseY+paddle_height))){
    vx = -vx;
    bounce++;
  }
  else if(!(y>mouseY&&y<(mouseY+paddle_height))&&((x<= (paddle_width)) ||(x >= (screen_size - paddle_width)))) {
    game_over = true;
  }  
  y = y + vy;
  x = x + vx;
  }
   void setcolor(int a, int b, int c){
     
       colors[0] = char(a);
       colors[1] = char(b);
       colors[2] = char(c); 
   } 
  
}
