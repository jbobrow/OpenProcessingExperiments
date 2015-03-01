
float ball_x = 200;
float ball_y = 200;
float pos_neg_x = 1;
float pos_neg_y = 1;
float ball_size = 10;
float bat_width = 10;
float bat_height = 50;
float bat_x = 570;
float bat_y = 250;
float bat2_x = 30;
float bat2_y = 250;
float ballspeed = 2;
int score_left = 0;
int score_right = 0;
PFont f;

void setup()
{
  size(600,400);
  smooth();
  f = loadFont("AGaramondPro-Regular-48.vlw");
}

void draw()
{
 background(255);
  textFont(f,16);
  fill(0);
  //line(300,20,300,380);
  text(""+score_left,285,50);
  text(""+score_right,310,50);
 
 noFill();   
 ellipseMode(CENTER);
 ellipse(ball_x,ball_y,ball_size,ball_size);

  if(ball_x>width-ball_size/2)
 {
   pos_neg_x = -1;
 }
 
 if(ball_x<0+ball_size/2)
 {
   pos_neg_x = 1;
 }
 
  ball_x=ball_x + pos_neg_x*ballspeed;
  
  if(ball_y>height-ball_size/2)
 {
   pos_neg_y = -1;
 }
 
 if(ball_y<0+ball_size/2)
 {
   pos_neg_y = 1;
 }
 
  ball_y=ball_y + pos_neg_y*ballspeed;
   
   rectMode(CENTER);
   rect(bat_x,bat_y,bat_width,bat_height);
   rect(bat2_x,bat2_y,bat_width,bat_height);
   if(keyPressed == true && key == 'w')
   {
     bat_y = constrain(bat_y - 4,25,375);
   }
   if(keyPressed == true && key == 's')
   {
     bat_y = constrain(bat_y + 4,25,375);
   }
   
   if(keyPressed == true && keyCode == UP)
   {
     bat2_y = constrain(bat2_y - 4,25,375);
   }
   if(keyPressed == true && keyCode == DOWN)
   {
     bat2_y = constrain(bat2_y + 4,25,375);
   }
   
   if(ball_x + ball_size/2==bat_x - bat_width/2
      && ball_y + ball_size/2<=bat_y + bat_height/2
      && ball_y - ball_size/2>=bat_y - bat_height/2)
      {
        pos_neg_x = -1;
      }
     
     if(ball_x - ball_size/2==bat2_x + bat_width/2
      && ball_y + ball_size/2<=bat2_y + bat_height/2
      && ball_y - ball_size/2>=bat2_y - bat_height/2)
      {
        pos_neg_x = 1;
      }
      
      if(ball_x<ball_size/2)
      {
        ball_x=200;
        score_right++;
      }
      
      if(ball_x>590+ball_size/2)
      {
        ball_x=200;
        score_left++;
      }
}










