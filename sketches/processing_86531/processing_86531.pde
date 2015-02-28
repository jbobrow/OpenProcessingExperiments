


  
  
  void setup ()

{
size(250,250);
background (250);
smooth ();
}
void draw ()
{

for (int i = 0; i < width ; i = i + 30){
  
noStroke (); 
fill (mouseX,mouseY);
ellipse  (i, 1,mouseX , mouseY);
}
}


