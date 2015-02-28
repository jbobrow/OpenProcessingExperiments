

float counter=0; 
void setup()
{
size(500,500);
background(0);
}
void draw()
{


  
  pushMatrix();
  translate(width/4,height/4);
  translate(cos(counter)*second(),sin(counter)*second()); 
 
  fill(255,0,0);
  ellipse(0,0,40,40);
  popMatrix();
  counter +=0.01;


 pushMatrix();
 translate(width/4*3,height/4*3);
  translate(cos(counter)*hour(),sin(counter)*hour()); 
  
  fill(255);
  ellipse(0,0,40,40);
  popMatrix();
  counter +=0.01; 

 pushMatrix();
 translate(width/2,height/2);
  translate(cos(counter)*minute(),sin(counter)*minute()); 
  ellipse(0,0,40,40);
  popMatrix();
  counter +=0.01; 
}
