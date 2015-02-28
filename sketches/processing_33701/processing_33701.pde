
float ball_x = 100;
float ball_y = 100;
float xspeed = random (10);
float yspeed = random (10);
int ball_w = 60;

void setup(){
background(0);
size(350,350);
}

void moveBall(){
 ball_x = ball_x + xspeed;
 ball_y = ball_y + yspeed;
}  

void draw() {
  println(xspeed+ " "+yspeed);
moveBall();
checkEdgeOfScreen();
background(0);
ellipse(ball_x, ball_y, ball_w, ball_w);
}

void checkEdgeOfScreen(){  
  if (ball_x > width - ball_w/2) {
    //println("11");
    xspeed = xspeed * -1;
  
  }
  else if (ball_x < ball_w/2) {
    //println("22");
    xspeed = xspeed * -1;
    
  }
 if (ball_y > height- ball_w/2) {
   // println("33");
    yspeed= yspeed *-1;
 
  }
  else if (ball_y < ball_w/2) {
    //println("44");
    yspeed=yspeed * -1;
   
  }
   
}

