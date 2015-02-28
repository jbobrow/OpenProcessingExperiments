
void setup ()
{
  size (500,500);
  background (0);
}


void draw ()
{   
  background (0);
  // Kreis
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 300, 300);
  //Kreis END
  
  //Mauskreise
  fill(200);
  noStroke();
  
  float maus1 = map(mouseX, 0, width,30,75);
  ellipse(250,0+maus1,50,50); // oben mitte
  ellipse(250,500-maus1,50,50); // unten mitte
  ellipse(0+maus1,250,50,50); // mitte links
  ellipse(500-maus1,250,50,50); // mitte rechts
  
  float maus2 = map(mouseX, 0, width,30,127);
  ellipse(0+maus2,0+maus2,50,50); //oben links
  ellipse(500-maus2,0+maus2,50,50); // oben rechts
  ellipse(0+maus2,500-maus2,50,50); // unten links
  ellipse(500-maus2,500-maus2,50,50); // unten rechts
  
  float maus3 = map(mouseX, 0, width,30,87);
  ellipse(0+maus3,100+maus3,50,50); // links oben mitte
  ellipse(0+maus3,400-maus3,50,50); // links unten mitte
  ellipse(500-maus3,100+maus3,50,50); // rechts oben mitte
  ellipse(500-maus3,400-maus3,50,50); // rechts unten mitte
  ellipse(100+maus3,0+maus3,50,50); // oben mitte links
  ellipse(400-maus3,0+maus3,50,50); // oben mitte rechts
  ellipse(100+maus3,500-maus3,50,50); // unten mitte links
  ellipse(400-maus3,500-maus3,50,50); // unten mitte rechts
 
  //Mauskreise END
}
