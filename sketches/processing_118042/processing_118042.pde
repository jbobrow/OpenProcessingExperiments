
float x,y;
float velocity_x, velocity_y;
float acc_x, acc_y;

void setup(){
  size(1200,600);
  noStroke();
  frameRate(60);
  smooth();
  setup_particle(); 
}

void draw(){
  background(255); 
  fill(0);
  ellipse(x,y,10,10);
  
  velocity_x += acc_x;
  velocity_y += acc_y;
  
  x += velocity_x;
  y += velocity_y;
}
 
void setup_particle(){
  x= mouseX;
  y= mouseY;
  
  velocity_x = random(-5,5);     
  velocity_y = random(-5,5);
  
//  velocity_x = 0;     
//  velocity_y = 0;
  
  acc_x = random(-0.3, 0.3);
  acc_y = random(-0.3, 0.3);
}

void mousePressed(){
  setup_particle();
}
