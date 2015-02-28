
            
                void setup()
{
  size (1020,600);
  background (200);
  smooth ();
   
}
 
void draw ()
{
   
    if (keyPressed) {
    if (key == ' ')
  {
    saveFrame ("line-####.jpg");
}
  }
   
fill (250,520,25);
stroke (random (255),random (40,80),50, random (20,200));
strokeWeight (random (20,90));
  line (pmouseX, pmouseY, mouseX, mouseY);
   
  float tamanho = random (2,20);
  noStroke();
  noFill();
  fill (random (100,178), random (80,50));
  stroke (random (255,90));
  ellipse (pmouseX, pmouseY, tamanho, tamanho);
  
}

