
ArrayList <PVector> p = new ArrayList(); // dynamisches Array

void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);
  fill (255);
  int i = 0;
  float translation = map (mouseX, 0, width, 0,60); // verschiebung basierend auf der x-position der maus
  
  noStroke();
  while (i < p.size())
  {
    fill (lerpColor (#ffedbc, #a75265,  map (p.get(i).z, 1, 10, 1, 0)));
    ellipse (p.get(i).x+translation*sin (map (p.get(i).z, 1, 10, 0, PI/2)), p.get(i).y, p.get(i).z, p.get(i).z); // verschiebung basierend auf der größe der Schneeflocke > große werden mehr verschoben als kleine
    
    p.get(i).y = p.get(i).y + map (p.get(i).z, 1, 10, 0.1, 1); // Fallen der Schneeflocke. Kleine Schneeflocken fallen langsamer als große
    if ( p.get(i).y > height+p.get(i).z/2) p.remove (i); // wenn die schneeflocke des unteren Rand erreicht hat, wird sie aus der ArrayList gelöscht
    else i++;
  }
  
  if (p.size () < 1000) // wenn die größe des Arrays kleiner als 1000 ist, kann eine Schneeflocke hinzugefügt werden
  {
    float dice = random (100); // würfelentscheidung. mit einer Wahrscheinlichkeit von 50:50 wird eine neue schneeflocke erstellt
    
    if (dice < 50)
    {
      p.add (new PVector (random (width),-10, random (1,10))); // eine neue schneeflocke wird der arraylist hinzugefügt. Der z-Wert wird für die größe des Schneeflocker verwendet
    }
  }
}
