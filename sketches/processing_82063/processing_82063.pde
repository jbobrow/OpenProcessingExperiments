
void setup()
{
  size(500,500);
  background(0);  
}


void draw ()
{
  
  //Création d'une trame d'une seule ligne faite de rectangles
  for(int i = 25; i < 500; i = i+50)
  
  //Créations d'une succession de rotation de rectangles et de ronds en dégradé de gris
  {
    ;
    stroke(250, i);
    fill(250, 50);
    rotate(PI/i);
    ellipse(i+200, i, i, i);
    
    fill(i, 50);
    rotate(PI/i);
    rect(i+100, i, i, i);
    
    fill(i, 50);
    rotate(PI/i);
    ellipse(i+50, i, i, i);
    
    fill(i, 50);
    rotate(PI/i);
    rect(i+50, i, i, i);
    
    fill(i, 50);
    rotate(PI/i);
    ellipse(i, i, i, i);
   
  }
  
 noLoop(); 
}


