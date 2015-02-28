
//Daniel Gomez
//Assignment 1b


float T = 0.0;
float randomDiameter = 25; //Global variable - Float - 
int growingDiameter = 0; //Global variable - int - Diameter 
int randomRed = 0; //Global variable - Float - Color 
int randomGreen = 0;
int randomBlue = 0;
int randomTransparency = 0;

void setup()
{ 
  size(1200, 600, OPENGL); 
  background(0); 
} 

void draw()
{
  randomRed = int(random(255));
  randomGreen = int(random(255)); 
  randomBlue = int(random(255));
  randomTransparency = int(random(255));
  smooth();
  if(mousePressed == true)
  {
    stroke(255, 50);
    translate(mouseX, mouseY, 0);
    if(keyPressed)
    {
      if(key == 'r')
        fill(255,0,0);
        
      else if(key == 'o')
        fill(255,120,0);
        
      else if(key == 'y')
        fill(255,204,0, randomTransparency);
        
      else if(key == 'g')
        fill(0,255,0, randomTransparency);
        
      else if(key == 'b')
        fill(0,0,255, randomTransparency);
        
      else if(key == 'p')
        fill(255,0,255, randomTransparency);
        
      else if(key == 'w')
        fill(255, 255, 255, randomTransparency);
      
      else
        fill(255);
      
    }
   if(!keyPressed)
   {
     fill(255,255,255, randomTransparency);
     key = 'w';
   }
      
    sphereDetail(mouseX / 4);
    sphere(random(50));
    endShape(); 
  }

}
