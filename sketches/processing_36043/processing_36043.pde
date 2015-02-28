
float diameter = 10;
float space = 10;

void setup(){
  
  size(700,400);
  smooth();
  noStroke();
  cursor(CROSS);
  
}

void draw(){
  
  translate(space/2,space/2);
  background(0);
  
  for (float x = 0; x < 80; x = x+1)
  {
    for(float y = 0; y < 60; y = y+1)
   {
    fill(dist(x*space, y*space, mouseX, mouseY));
    ellipse(x*space,y*space,diameter,diameter);
   }
 }
 
 //filter(BLUR);
 
}

