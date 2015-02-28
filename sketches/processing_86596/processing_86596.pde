
void setup ()
{size(600,800);
  
  background (15);
  smooth();
  
}

void draw ()

{
  
  int MonPetitPanier;
  MonPetitPanier = 100;

  noStroke ();
   fill (mouseX,mouseY,100,200);
  rect (mouseX,mouseY,100,100);
  
 
  fill (mouseX,mouseY,100,200);
  triangle (mouseX,mouseY,100,100,80,90);
  println (mouseX);
  
  stroke (#000505);
  line (mouseX,mouseY,100,60);
  
}


