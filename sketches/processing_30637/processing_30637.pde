
void setup()
{
  size (800,600);
  background (255);
  smooth ();  
}
  
void draw ()
{ 
    if (keyPressed) {
    
  {
    saveFrame ("line-####.jpg");
    background (255);
     
  }
  }
   
fill (399,255,0);
  line (pmouseX, pmouseY, mouseX, mouseY);
   rect(0, 100, 700, 50);
   rect(100, 250, 800, 50);
    rect(0, 400, 700, 50);
    rect(100, 550, 800, 50);
  float tamanho = random (2,30);
 
  fill (random (100,178), random (20,50));
   ellipse (pmouseX, pmouseY, tamanho, tamanho);
  rect(0, 0, 50, 100);

}

                
                
