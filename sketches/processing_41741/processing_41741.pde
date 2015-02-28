
float x = 0;
float y = 200;
float theta = 0.0;

float x2 = 0;
float y2 = 200;
float feta = 0.0;

void setup() 
{
  
  size(700,400);
  background(255);
  smooth();
  noFill();
  
}


void draw()
{
  
  stroke(0,130);
  strokeWeight(3);
  background(255);
//  pushMatrix();
//  translate(x,y);
//  rotate(theta);
//  rect(-40,-40,80,80);

//  popMatrix();
  
  translate(x,y);
  rotate(theta);
  line(-26, -26, 26, 26);

   theta = theta + dist(mouseX,mouseY,x,y)/10.0;  
    x = x + 1;


    
  translate(x2,y2);
  rotate(PI/8);  
  line(-26, -26, 26, 26);
    
    feta = feta + dist(x2,y2,x2-100,y2-100)/10.0;  

  
} 

