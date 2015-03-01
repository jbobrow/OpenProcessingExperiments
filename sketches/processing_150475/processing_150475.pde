
PVector [] p = new PVector [1000]; // staitsches Array mit genau 1000 Flocken

void setup ()
{
  size (600, 200);
  smooth();
  
  initArray();
}

void draw ()
{
  background (#57385c);
  fill (255);
  int i = 0;
  float translation = map (abs (mouseX-width/2), 0, width/2, 0, 60); // verschiebung basierend auf der x-position der maus

  noStroke();
  while (i < p.length)
  {
    PVector flocke = p [i];

    fill (lerpColor (#ffedbc, #a75265, map (flocke.z, 1, 10, 1, 0)));
    ellipse (flocke.x+translation*sin (map (flocke.z, 1, 10, 0, PI/2)), flocke.y, flocke.z, flocke.z); // verschiebung basierend auf der grÃ¶Ã�e der Schneeflocke > groÃ�e werden mehr verschoben als kleine

    flocke.y = flocke.y + map (flocke.z, 1, 10, 0.1, 1); // Fallen der Schneeflocke. Kleine Schneeflocken fallen langsamer als groÃ�e
    if ( flocke.y > height+flocke.z/2)
    {
      p [i] = new PVector (random (width), random (-height, -10), random (1, 10));
    }// wenn die schneeflocke den unteren Rand erreicht hat, wird eine neue erstellt, die wieder oberhalb des fensters startet

      i++;
  }
}

void initArray ()
{
  int i = 0;

  while (i < p.length) 
  {
    p [i] = new PVector (random (width), random (-2*height, -10), random (1, 10)); // eine neue schneeflocke wird dem array hinzugefÃ¼gt. Der z-Wert wird fÃ¼r die grÃ¶Ã�e des Schneeflocker verwendet. der y-wert liegt auÃ�erhalb des sichtbaren Fensters, damit nicht alle schneeflocken auf einmal im Bild erscheinen
    i++;
  }
}

