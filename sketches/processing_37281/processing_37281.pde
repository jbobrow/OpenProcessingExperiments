
//Hi there my name is Mark and this is my art design project.


void setup()
{
  background(255);
  size(800,800);
 
}

void draw()
{
  
  smooth();
  if(mousePressed == false)
  {
    cursor(ARROW);
  }
     else{
      cursor(CROSS);
      
    
    strokeWeight(5);
    line(mouseX,mouseY,pmouseX,pmouseY);
    
    ellipse(mouseX,mouseY,40,40);
    
    mouseDragged();
    
    }
      //if(m > 255)
      //{
       // m = 0;
       
      //}
    
    if(mousePressed)
    
    {
      fill(random(255),random(150),random(50));
      
    }
   
   
}

void keyPressed()
{
  if(key == '1')
  {
    background(255);
  }
  if(keyPressed == true)
  {
    background(255);
  }
}





