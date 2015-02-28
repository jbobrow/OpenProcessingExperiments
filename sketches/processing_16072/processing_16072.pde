
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 50;

void setup() {  
  size(800, 600);
  background(0); 
  smooth(); 
  strokeWeight(20.0);
  stroke(0, 50); 
}

void draw() {
  //fade
  fill(0, 0, 0, 1);
  noStroke();
  rect( 0, 0, width, height);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  fill(random(255),mouseY/2,mouseX/2);
  stroke(random(255),mouseY/2,mouseX/2, 50); 
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength); 
  ellipse(x, y, 10, 10);
  
  if( mousePressed && ( mouseButton == LEFT ) ){
      fill(255);
     ellipse(x, y, 20, 20);
  }
  
   if( mousePressed && ( mouseButton == RIGHT ) ){
    background(0);
  }
}



