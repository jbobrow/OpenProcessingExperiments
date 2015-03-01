
float r = 200;
float curDeg = 0;
  
void setup()
{
  size(450,450);
  frameRate(30);
}
  
void draw()
{
  background(0,255,255);
  translate(width/2, height/2);
    
   triangle(0,0,15,300,-15,300);
  curDeg = curDeg +1;
  float rad = radians(curDeg);
  float x = r * cos(rad);
  float y = r * sin(rad);
  float z = r*  cos(rad+ PI/3);
  float w = r* sin(rad+ PI/3);
  float a = r* cos(rad+ 2*PI/3);
  float b = r* sin(rad+2*PI/3);
  line(0,0,x,y);
  line(0,0,-x,-y);
  line(0,0,z,w);
  line(0,0,-z,-w);
  line(0,0,a,b);
  line(0,0,-a,-b);
  stroke(255,255,0);
  strokeWeight(10);
    
  fill(255,0,0);
  ellipse(x,y,20,20);
  ellipse(z,w,20,20);
  ellipse(a,b,20,20);
    ellipse(-x,-y,20,20);
  ellipse(-z,-w,20,20);
  ellipse(-a,-b,20,20);
  

   
}

