
float angle = 1.0;
float speed = 0.5;
float radius = 15;
float timer = 1;
float x = 0;
float s = 0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
 
  x = x + 0.10;
  s = s + 0.1;
  if (s > 1.5)
  {
    s = 0;
  }
  
  pushMatrix();
  translate(100, 100);
     
  
  
  fill(255, 255, 0);
  rotate(x);
  rect(width/2, height/2, 50, 50);

  popMatrix();
  fill(255, 255, 0);
  translate(100, 100);
  rotate(x);
  
   ellipse(width/2, height/2, 50, 50);
   
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255, 0 ,0);
  angle += speed;
  float sinval = sin(angle);
  float yoffset = sinval * radius;
  
  pushMatrix();
  fill(20, 94, 99);
  
  scale(s);   
  rect(50 , 50 + yoffset, 100, 100); 
  popMatrix();
}
  


