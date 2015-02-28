
float ball_x;
float ball_y;
float ball_dir = 5;

float ball_size = 25;
float dy = 0;
float dx = 0;
int block_width = 300;
int block_height = 50;
void setup()
{

  size(850, 300);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  ball_y = height/2;
  ball_x = width/2;;

}



void draw() 

{

  background(51);

  

  ball_x += ball_dir * 1.0;

  ball_y += dy;

  if(ball_x > width+ball_size) {

    ball_x = -width/2 - ball_size;

    ball_y = random(0, height);

    dy = 0;

  }

  

  

  if(ball_x < ball_size || ball_x + ball_size > width)
  {

    ball_dir *= -1;

  }

  if(ball_y > height-ball_size)
  {

    dy = dy * -1;

  }

  if(ball_y < ball_size)
  {

    dy = dy * -1;

  }
  

  if(ball_y > 50 - block_height/2 - ball_size && ball_y < 50 + block_height/2 + ball_size 
  && ball_x > block_width - block_height/2 - ball_size && ball_x < block_width + block_height/2 + ball_size)
     {
       ball_dir *= -1;
     } 

  fill(255);

  ellipse(ball_x, ball_y, ball_size, ball_size);
  //rotate(PI/4);
  rect(block_width,block_height,50,50);
  


  

  

}

void mousePressed()
{
  ball_x = mouseX;
  ball_y = mouseY;
  ellipse(mouseX,mouseY,ball_size,ball_size);
  
}



