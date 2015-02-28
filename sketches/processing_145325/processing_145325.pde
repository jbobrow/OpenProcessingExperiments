
float index= 0.0;



void setup()
{
 colorMode(HSB,360, 100, 100);
size(500,500);
background(120, 5,100);

}

void draw()
{
  
  //background(120, 5,100);
  
  colorMode(HSB,360, 100, 100);
  
  translate(width/2, height/2);
  
 
  float m = map(mouseX, 0, 500, 90,160);
  
  stroke(m, 50, 50, 20);
  noFill();
  ellipse(0, 0, sin(index)*400, cos(index)*400);
  
  stroke(120, 50, 50, 20);
  noFill();
  ellipse(0, 0, cos(index)*200, sin(index)*200);
  index += 0.003;
  
 
   

}


