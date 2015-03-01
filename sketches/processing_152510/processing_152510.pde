
float ball_x;
float ball_y;
int radius; 
float current_x; 
float current_y;

void setup(){
  size(800,300);
  current_x = 120;
  current_y = height/2;
  radius = 100;
}
void draw(){
   background(255);
   //radius = height/2;
   float radians = radians(frameCount % 360);
   ball_x = current_x + radius*sin(radians);
   ball_y = current_y - radius*cos(radians);
   //circle
   fill(255);
   stroke(0);
   ellipse(current_x,current_y,radius*2,radius*2);
   
   //line
   stroke(180);
   line(current_x,current_y,ball_x,ball_y);
   //rotating ball
   fill(0);
   ellipse(ball_x,ball_y,10,10);
   //centerPoint
   fill(0);
   ellipse(current_x,current_y,5.0,5.0);
   
   //sin cos
   for(int i = 0 ; i <= 360;i++){
     //sin
     float rad = radians(i);
     stroke(0,0,255);
     point(250+i,height/2-radius*sin(rad));
     //cos
     stroke(255,0,0);
     point(250+i,height/2-radius*cos(rad));   
   }
    //point
    int increaseForSinCosBall = frameCount % 360;
    //point2
    float sinBall_x = 250 + increaseForSinCosBall;
    float sinBall_y = height/2-radius*sin(radians);
    float cosBall_x = 250 + increaseForSinCosBall;
    float cosBall_y = height/2-radius*cos(radians);
    
    noStroke();
    fill(255,0,0);
    ellipse(sinBall_x,sinBall_y,5,5);
    fill(0,0,255);
    ellipse(cosBall_x,cosBall_y,5,5);
    
    fill(0,0,255);
    rect(650,height/2,75,radius*sin(radians));
    fill(255,0,0);
    rect(725,height/2,75,radius*cos(radians));
    
     

}
