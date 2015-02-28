
void setup()
{
  size(900,900);
  background(250);  
}


void draw ()
{
  
  //Création d'une trame d'une seule ligne faite de rectangles
  for(int i = 50; i < 500; i = i+50)
  
  //Créations d'une succession de rotation de rectangles et de ronds en dégradé de gris
  {
    ;
    stroke(250, 10);
    strokeWeight(150);
    fill(0, 60);
    rotate(radians(1));
    rect(250, i, i, i);
    
  }
  
 noLoop(); 
}


