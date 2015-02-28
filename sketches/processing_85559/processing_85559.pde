
void setup()
{
  size(500, 500); 
  background(255); 
  smooth();
}

void draw() 
{
// Création d'un rectangle et remplissage (transparence) 
  fill(#1F5FCB,15);
  rect(200, 200, 100, 100);
  
// Création d'un rectangle et remplissage (transparence) + Rotation du rectangle 

  rotate(PI/4); 
  fill(#1F5FCB,15);
  rect(200, 200, 100, 100);
  noStroke();
  }


