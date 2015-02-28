
void setup()
{
  size(500,500);
  background(210);  
}


void draw ()
{
  
  //Création d'une trame faite de ronds
  for(int i = 25; i < 500; i = i+50)
  {
    strokeWeight(5);
    fill(230);
    ellipse(i, 100, 50, 150);
    rect(i, 100, 50, 50);
    fill(150);
    ellipse(i, 100, 50, 50);
    fill(#30FAD3);
    rect(i, 100, 50, 150);
    
  }
  
 noLoop(); 
}


