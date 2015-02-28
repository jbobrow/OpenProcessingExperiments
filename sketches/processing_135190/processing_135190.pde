

float period = 3; 
float amplitude = 60; 
void setup() 
{ 
size(300,400); 
} 
void draw() 
{ 
 background(456,0,781); 
 translate(width/2,40); 
 float angle = motion(); 
 rotate(angle); 
 pendulum(); 
} 
void pendulum() 
{ 
  stroke(255,222,88); 
  strokeWeight(10); 
  line(0,0,0,125); 
  stroke(25,22,88); 
  strokeWeight(8); 
  point(0,0); 
  ellipseMode(CENTER); 
  fill(590); 
  stroke(25,22,88); 
  ellipse(0,150,40,40); 
  ellipseMode(CENTER); 
  fill(590);
  stroke(255,222,88); 
  ellipse(0,230,40,40);
  stroke(255,222,88); 
  strokeWeight(5); 
  line(0,172,0,212);
} 
float motion() 
{ 
  float time = norm(millis(),0,1500); 
  float fraction = norm(time,0,period); 
  float shm = sin(fraction*TWO_PI); 
  float angle = amplitude*shm; 
  return radians(angle); 
} 



