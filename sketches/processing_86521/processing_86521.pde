
float x, y;                                 
float vx, vy;
float l = 5;
  
void setup() {             
  size(500, 500);                           
  smooth();
  x = l;
  y = l;
  vx = 20 / l;
  vy = 20 / l;
}
  
void draw() {                              
  noStroke();
  fill(0, 8);
  rect (0, 0, width, height);
  
  ellipseMode(RADIUS);                     
  fill(255, 0);
  for ( int i = 0; i < 5; i++) {
    int m = int ( random ( 5, 10));
    stroke(25, 800);
    strokeWeight (m /((m-i) *i +1));
    ellipse(width/3, height/3, x - 3*m*i, y - m*i);
    m += 4*m;
  }
  
  if (x > width-10 || x < l) vx *= (-1);    
  if (y > height-5 || y < l) vy *= (-1);
  
  x += 1*vx;
  y -= 1*vy;
    ellipseMode(CENTER);                     
  fill(255, 0);
  for ( int i = 0; i < 5; i++) {
    int m = int ( random ( 5, 10));
    stroke(25, 800);
    strokeWeight (m /((m-i) *i +1));
    ellipse(width/2, height/2, x - 1*m*i, y - m*i);
    m += 4*m;
  }
  
  if (x > width-10 || x < l) vx *= (-1);    
  if (y > height-5 || y < l) vy *= (-1);
  
  x += 1*vx;
  y -= 1*vy;
}



