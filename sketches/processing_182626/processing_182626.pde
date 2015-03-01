
void setup() 
{
  size(500,500);
  background(255);
  smooth();
   String s = "Press G";
   textSize(19); 
   fill (0); 
   text (s,200,200,70,80);  
   println(s);  
} 

void draw()
{   
  if (keyPressed)
  {
    if (key == 'G' || key == 'g')
      {
        background(0, 255, 0);
        textSize(20); 
        String s = "Press Y";
        fill (0); 
        text (s,200,200,100,100);  
        println(s);  
      }
    
    if (key == 'Y' || key == 'y')
        {
          background(255, 251, 0);
          textSize(20); 
          String s = "Press S";
          fill (0); 
          text (s,200,200,100,100);  
          println(s);  
        }
      
    
    if (key == 'S' || key == 's')
      {
        background(255, 0, 0);
        textSize(20); 
        String s = "Press E";
        fill (0); 
        text (s,200,200,100,100);  
        println(s);  
      }
      
      if (key == 'E' || key == 'e')
      {
        background(0);
        textSize(20); 
        String s = "ENOUGH";
        fill (255); 
        text (s,200,200,100,100);  
        println(s);  
      } 
  }
}

