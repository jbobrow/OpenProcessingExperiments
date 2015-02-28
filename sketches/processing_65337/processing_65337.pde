
int ball_x=25;

void setup(){
size(600,100);

}

void draw(){
  bgcol();
  ellp(20);

  
  move_ball();

}

void move_ball() {
   ball_x=ball_x +1;
}

void bgcol(){
  
 background (255,255,255);
}
void ellp( int ballsize){
  ellipse(ball_x,10,ballsize,ballsize);
  
 
  ellipse(ball_x,50,ballsize,ballsize);
  
}

