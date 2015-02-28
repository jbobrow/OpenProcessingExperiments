

float radius = 4; 
float angle = 5; 
float speed = 5; 

void setup(){ 
  size(600,600);
  background(255); 
  smooth(); 
  noStroke(); 
 
} 

void draw() {
  println(mouseX + " : " + mouseY);
  fill(random(0,255), random(0,255), random(0,255));
  float deltaAngle = speed/radius;
  angle = angle + deltaAngle;
  radius += 15/TWO_PI*deltaAngle;
  rect(width/2+radius*cos(angle),height/2+radius*sin(angle),10,10);
 
  angle = angle + deltaAngle;
  radius += 15/TWO_PI*deltaAngle;
  rect(width/4+radius*cos(angle),height/4+radius*sin(angle),10,10);
   
  noFill();
  ellipse(100, 100, minute()*5, minute()*5); 
  ellipse(100, 100, hour()*5, hour()*5); 
  ellipse(100, 100, second()*5, second()*5); 
  time(width/2, 30); 

 
 } 


void time(float a, float b)
{
  fill(random(0,255), random(0,255), random(0,255));
  rectMode(CENTER);
  rect(a, b, 160, 130);
  fill(0);
  text(second(), a+60, b+10);
  text(minute(), a-10, b+10);
  text(hour(), a-80, b+10);
  
}


