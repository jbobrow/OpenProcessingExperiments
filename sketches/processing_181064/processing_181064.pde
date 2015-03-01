
void setup ()
{
  size(1000, 1000) ;
  background (232,0,0, 255) ;
  
  
}
void draw() 
{  
  //code that happens every frame like
 stroke (0 ,
          map(mouseX, 232,0,0, 255),
          map(mouseY, 255,253,3, 255)) ;
strokeWeight (map(pmouseX, 0,400, 0.90,2));
  ellipse (mouseX, mouseY, 100, 100) ;
  line (mouseX, mouseY, 500, 500) ;
  line (mouseX, mouseY, 900, 900) ;
}


