
void setup() 
{
  size(900, 600,P3D);
  noStroke();
  background(0);
  ellipseMode (CENTER);//Ellipse über Mitte setzen
  frameRate(25);
}

void draw() 
{                    
  //roter Spot für Kugel:
  spotLight(255, 102, 126, 380, 200, 140, -1, 0, 0, PI/2, 2);
  //die Werte im einzelnen:
  //(R-,G-,B-Werte der Lichtquelle,
  //X-,Y-,Z-Koordinate der Lichtquelle, 
  //Richtung entlang X-, Y-, Z-Achse, 
  //Winkel und 
  //Fokus (größer = schwächer) der Lichtquelle
  float tt = 126;//126
  fill(255,102, 126,40);//Kugel und Licht haben dieselbe Farbe
  translate(150,150,0);
  sphere(150);
  //blauer Spot für Ellipsen:
  //smooth();
  spotLight(200, 200, 255, 380, 200, 140, -1, 0, 0, PI/2, 2);
  translate(-150,-150,0);
  fill(255, 255, 255);
  ellipse(random(200,400), random(0,310), 10, 10);
}


