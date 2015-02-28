


void setup ()

{
  size (500, 500);
  background (0);
  smooth ();
  stroke(100);
  
  fill(225, 80, 90); 

  
}
  
  

void draw ()

{
  
  if (keyPressed) {
    if (key == ' ')
    {
      saveFrame ("line-####.jpg");
      background (0);
    }
  
  }  
  float r = map (mouseY, 100, height, 300, 100);
  stroke (r, 600, 100);
  
  fill (700, 130, 180);
  line (pmouseX, pmouseY, mouseX, mouseY);
 
}


