
float r;

//angle and angular velocity, acceleration
float theta;
float theta_vel;
float theta_acc;

void setup(){
  size (600,600);
  
  r=height * 0.45;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.0001;
}

void draw(){
  
  background (0,0,0);
  
  translate(width/2, height/2);
  
  float x = r* cos(theta);
   float y = r* sin(theta);
   
   rectMode(CENTER);
   noStroke();
   fill(random(255),random(255),random(255),random(100));
   rect(x,y,random(100),random(100));
   
   theta_vel += theta_acc;
   theta += theta_vel;
   

}
   
   
   
   
  


