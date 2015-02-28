

int mysize = 100;
float x = 350;
float y = 200;

void setup() 
{
  
  size(700,400);
  background(255);
  smooth();
  
}


void draw()
{
  
  stroke(0,60);
  fill(102,0,mouseY,60);
  ellipse(x,y,mysize,100);
  noStroke();
  fill(0,0,0,30);
  ellipse(mouseX,mouseY,50,50);
  x = x + (mouseX - x)/20.0;
  y = y + (mouseY - y)/20.0;
  
}

  void mousePressed(){
    
}    

  void mouseMoved(){
    
}    

