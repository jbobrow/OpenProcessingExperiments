
void setup()
{
  size(500, 500); 
  background(255); 
  smooth();
}

void draw() 
{
// Création d'un rectangle 
noStroke();
fill(#1F5FCB,90);
ellipse(50, 50, 50, 50);

// Création d'un deuxième rectangle, deux fois plus gros que le premier
noStroke();
fill(#2C5393,30);
scale(2.0); 
ellipse(40, 40, 50, 50);

// Création d'un troisième rectangle, 0,5 fois plus gros que le deuxième
noStroke();
fill(#11284D,40);
scale(0.5); 
ellipse(70, 70, 50, 50);

  noLoop();
}


