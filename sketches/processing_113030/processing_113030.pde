
float timer = 0.0;
float angle = 1.0;
float scaleSize = 1; 
float scaleSpeed = 1.0; 
boolean numCircles = true; 
float x = 100; 
float y = 100; 
float w = 50; 
float z = 50; 


void setup()
{

  size (500, 500); 

}



void draw()
{
  background(0); 
  angle += 0.1; 
  timer += 0.0167;
  scaleSize += scaleSpeed;
  
  if(scaleSize > 7 || scaleSize < 3)
  {
    scaleSpeed = -scaleSpeed; 
    
  }
  
  
  
  //the square
  if (timer >3 )
  {
  pushMatrix(); 
  translate(width/2, height/2);
  rotate(angle); 
  scale(0.5);
  rect(0, 0, 100, 100);
  popMatrix(); 
  }
  

  
  
  
  pushMatrix(); 
  //the circle
  if (timer > 5)
  {
  translate(width/2, height/2); 
  rotate(angle);
  scale(scaleSize);
  ellipse(x, y, w, z);
  }
  
  popMatrix();
  
  


}


