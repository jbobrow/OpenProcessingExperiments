
int x = 0;
int ball_x = 0;
int ball_speed = 5;
int paddle1Y =300;
int paddle2Y = 300;
int background_x = 0;
int background_y = 0;
int i = 0;
void setup() {
  size(1200, 1200);
}
void draw() {
  background(2, 206, 51);
  for (int background_y=0; background_y<height; background_y+=10) {
    for (int background_x=0; background_x<width; background_x+=10) {
      rect(background_x, background_y, 10, 10);
    }
  }
  int i = 0;
  while(i<10){
    ellipse(mouseX,mouseY,i*10,i*<WBR>20);
    i++;
  }
  stroke(0);
  fill(255);
  rect(250, paddle1Y, 20, 100);
  rect(900, paddle2Y, 20, 100);
  if (keyPressed&&key=='w') {
    paddle1Y=paddle1Y-15;
  } else if (keyPressed&&key=='s') {
    paddle1Y=paddle1Y + 15;
  }
  if (keyPressed&&key=='o') {
    paddle2Y=paddle2Y-15;
  } else if (keyPressed&&key=='l') {
    paddle2Y=paddle2Y+15;
  }
  ellipse(x, 100, 32, 32);
  x = x+ball_speed;
  if (((x>890) && ((paddle2Y+100>=100 && 100>=paddle2Y)))|| (x<270)&& ((paddle1Y+100>=100 && 100>=paddle1Y))) {
    ball_speed = ball_speed *-1;
  }
}
