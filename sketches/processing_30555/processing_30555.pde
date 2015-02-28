

                
         void setup()
{
  size (800,600);
  background (256);
  smooth ();
}
void draw ()
{
   
    if (keyPressed) {
    if (key == ' ')
  {
    saveFrame ("line-####.jpg");
    background (212);
     
  }
  }
  float tamanho = random (200,200);
  noStroke();
  noFill();
  stroke (205);
  strokeWeight (random (1,1));
  ellipse (pmouseX, pmouseY, tamanho, tamanho);
  
}       
