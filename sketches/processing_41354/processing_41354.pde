
int ball_x = 30;
int ball_y = 275;
int speed_x = 0;
int speed_y = 0;
int ballcolor = 255;
int putter_x = -100;
int putterspeed = 2;

void setup(){
  size(500,350);

}

void draw(){
  background(25,100,50);
  noStroke();

// draw hole  
  fill(0);
  ellipse(460,75,20,20);

// draw flag  
  stroke(255);
  strokeWeight(1);
  line(460,75,460,25);
  
  noStroke();
  fill(255,0,0);
  triangle(460,35,460,25,470,30);
  
// draw green circle
  fill(45,120,70);
  ellipse(30,275,30,30);
 
// draw moving ball 
  fill(ballcolor);
  ellipse(ball_x,ball_y,15,15);
  ball_x = ball_x + speed_x;
  ball_y = ball_y + speed_y;

//draw putter
  fill(170);
  rect(putter_x,260,10,30);
  putter_x = putter_x+putterspeed;
  
  if(putter_x>=20){
    putterspeed = -1;
    speed_x = 3;
  }
  
//draw bumpers
  stroke(137,104,40);
  strokeWeight(7);
  line(280,265,250,295);
  line(230,85,260,55);
 
  
// if ball hits bumper, turn
  if(ball_x >= 250 && ball_y >= 275){
    speed_x = 0;
    speed_y = -3;
  }
    if(ball_x <= 300 && ball_y <= 75){
    speed_x = 3;
    speed_y = 0;
  } 
    
// if ball reaches in hole, stop and turn black and redraw flag
  if(ball_x >= 460){
    ball_x = 460;
    ballcolor = 0;

  stroke(255);
  strokeWeight(1);
  line(460,75,460,25);
  
  noStroke();
  fill(255,0,0);
  triangle(460,35,460,25,470,30);
  }
}  


 
                
