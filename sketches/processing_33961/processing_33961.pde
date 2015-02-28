

int num_ball = 30;
float[] ball_x = new float[num_ball];
float[] ball_y = new float[num_ball];
float[] ball_x_speed = new float[num_ball];
float[] ball_y_speed = new float[num_ball];


void setup(){
  size(300,300);
  for(int i = 0; i< num_ball; i=i+1){
  ball_x[i]= random(10,290);
  ball_y[i] = random(10,290);
  ball_x_speed[i] = random(10);
  ball_y_speed[i] = random(10);
  
  
  }
}


void draw(){

  background(255);
  
  for(int i = 0; i< num_ball; i++){
    ball_x[i] += ball_x_speed[i]; 
    ball_y[i] += ball_y_speed[i];
  
   fill(random(256),random(256),random(256));
   noStroke();
   ellipse(ball_x[i], ball_y[i], 30,30);
    
    
  
   if(ball_x[i]>= 290){
   ball_x_speed[i] = ball_x_speed[i]*-1;
   }
   
   if(ball_x[i]<= 10){
   ball_x_speed[i] = ball_x_speed[i]*-1;
   }
    
   if(ball_y[i]>= 290){
   ball_y_speed[i] = ball_y_speed[i]*-1;
   }
   
   if(ball_y[i]<= 10){
   ball_y_speed[i] = ball_y_speed[i]*-1;
   }
    
  }
}





