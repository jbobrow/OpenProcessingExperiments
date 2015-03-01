
float r = 0, diam;
 
void setup() 
{
  size(500, 500);
  background(240);
  frameRate(300);
  noStroke();
}
 
 
void draw() 
{
  translate(width/2, height/2);
  rotate(r);
  r += .22;
  diam = random(1, 5); 
  
  fill(random(255), random(255), random(255));
  ellipse( 0+r, 0+r, 0+diam, 0+diam); 
  
 
  
}


 
