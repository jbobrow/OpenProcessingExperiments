
int brush = 1;

float r = 0;
float s = 1.0;


// centre of each shape
float posX; 
float posY;
 
float brushHue; 

void setup()
  {
 size(500, 500);
  background(0);
  smooth();
  noFill();
  frameRate(60);

  }
 
 
 
void draw()
  {
    
    if (brush == 1)
    {
      for (int i=1; i < random(7500, 7500); i = i+90000)
      {
      stroke(255, random(255), 0, random(100, 255));
      strokeWeight(random(3));
      bezier(mouseX-random(50), mouseY-random(50), (mouseX-random(200)), (mouseY-random(200)), (mouseX+random(200)), (mouseY-random(100)), (mouseX-random(50)), (mouseY+random(50)));
      filter(BLUR, 0.6);
      }
      
      if (mousePressed == true){
      bezier(mouseX-random(50), mouseY-random(50), (mouseX+random(200)), (mouseY-random(200)), (mouseX-random(200)), (mouseY-random(100)), (mouseX-random(50)), (mouseY+random(100)));  
      }
    }
    if (brush == 2)
    {
       strokeWeight(2);
        if (mousePressed == true)
        {
          if (mouseButton == LEFT){
        
        pushMatrix();
       
      
      translate(mouseX, mouseY);
      
      rotate(r);
      scale(s);
      
      ellipse(0, 0, random(50), random(50));
      
      
      popMatrix();
      
          }
      
      if (mouseButton == RIGHT){
        stroke(0, random(255), 255);
          
          }
          
      }
      
      filter(BLUR);

    }
    if (brush == 3)
    {
      colorMode(HSB, 360, 100, 100, 100);
        filter(BLUR);
        noFill();
       stroke(random(360),100,100);
       strokeWeight(random(0.5));
       
       colorMode(RGB, 255, 255, 255, 255);
    }
  }
  
void keyPressed(){
  if (key == '1')
  {
    brush = 1;
  }
  if (key == '2')
  {
    brush = 2;
  }
  if (key == '3')
  {
    brush = 3;
  }
  if (key == CODED)
 {
   if (keyCode == RIGHT)
   {
     r = r + radians(3);
   }
   
   if (keyCode == LEFT)
   {
     r = r - radians(3);
   }
  if (keyCode == UP)
 {
   s = s + 0.15;
 }
 if (keyCode == DOWN)
 {
   s = s - 0.15;
 }
 }
}


void mouseDragged()
{
  
  if (brush == 3)
  {
    for(float ang=0; ang<HALF_PI; ang+=PI/100) 
    {
      pushMatrix();
       
    
      translate(posX,posY);
       
     
      rotate(ang); 
       
     
     line(pmouseX-posX,pmouseY-posY,mouseX-posX,mouseY-posY); 
      popMatrix();
      
     
    }
  }
}
  
  
   
void mousePressed()
{
 
  posX = mouseX; 
  posY = mouseY;
   

}
  


