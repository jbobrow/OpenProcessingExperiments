
PVector [] p1 = new PVector [300]; // staitsches Array mit genau 1000 Flocken
PVector [] p2 = new PVector [300]; // staitsches Array mit genau 1000 Flocken
PVector [] p3 = new PVector [300]; // staitsches Array mit genau 1000 Flocken

float speed = 2;

void setup ()
{
  size (600, 200);
  smooth();

  initArray();
}

void draw ()
{
  background (#57385c);
  
  // berge ----------------------------------------------

  int x = 0;
  float y = 0;
  fill (lerpColor (#57385c, #FEBE7E, 0.33));
  noiseSeed (0);
  
  beginShape();

  vertex (-10, height+10);
  while (x < width)
  {
    y = height-170 + noise (-frameCount / 300.0 + x / 75.0)*80;

    if (x == 0) vertex (x-10, y);
    vertex (x, y);
    x+=
      3;
  }
  vertex (x + 10, y);
  vertex (width+10, height+10);
  endShape();

  // kleine flocken ----------------------------------------------
  
  int i = 0;

  noStroke();
  while (i < p1.length)
  {
    dispayFlocke (p1[i]);
    moveFlocke (p1[i]);
    checkEdges (p1, i, 1);

    i++;
  }

  // berge ----------------------------------------------

   x = 0;
   y = 0;
  fill (lerpColor (#57385c, #FEBE7E, 0.66));
  noiseSeed (1);
  beginShape();

  vertex (-10, height+10);
  while (x < width)
  {
    y = height-130 + noise (-frameCount / 200.0 + x / 100.0)*100;

    if (x == 0) vertex (x-10, y);
    vertex (x, y);
    x+=
      3;
  }
  vertex (x + 10, y);
  vertex (width+10, height+10);
  endShape();

  // mittlere flocken ----------------------------------------------

  i = 0;

  while (i < p2.length)
  {
    dispayFlocke (p2[i]);
    moveFlocke (p2[i]);
    checkEdges (p2, i, 2);

    i++;
  }

  // berge ----------------------------------------------

  x = 0;
  y = 0;
  noiseSeed (2);
  fill (#FEBE7E);
  beginShape();

  vertex (-10, height+10);
  while (x < width)
  {
    y = height-120 + noise (-frameCount / 150.0 + x / 120.0)*120;

    if (x == 0) vertex (x-10, y);
    vertex (x, y);
    x+=
      3;
  }
  vertex (x + 10, y);
  vertex (width+10, height+10);
  endShape();

  // große flocken ----------------------------------------------

  i = 0;

  while (i < p3.length)
  {
    dispayFlocke (p3[i]);
    moveFlocke (p3[i]);
    checkEdges (p3, i, 3);

    i++;
  }
}

void checkEdges (PVector [] p, int index, int id)
{
  PVector flocke = p [index];

  if ( flocke.y > height+flocke.z/2 || flocke.x > width+flocke.z/2)
  {
    float d = 0;

    if (id == 1) d = random (1, 4);
    else if (id == 2) d = random (4, 7);
    else d = random (7, 10);

    p [index] = new PVector (random (-width, width), random (-height, -10), d);
  }
}

void moveFlocke (PVector p)
{
  PVector flocke = p;
  float movement = map (flocke.z, 1, 10, 0.1, 1);

  flocke.y = flocke.y + map (flocke.z, 1, 10, 0.1, 1); // Fallen der Schneeflocke. Kleine Schneeflocken fallen langsamer als große
  flocke.x = flocke.x + speed * movement;
}

void dispayFlocke (PVector p)
{
  PVector flocke = p;

  fill (lerpColor (#ffedbc, #a75265, map (flocke.z, 1, 10, 1, 0)));
  ellipse (flocke.x, flocke.y, flocke.z, flocke.z); // verschiebung basierend auf der größe der Schneeflocke > große werden mehr verschoben als kleine
}

void initArray ()
{
  int i = 0;

  while (i < p1.length) 
  {
    p1 [i] = new PVector (random (-width, width), random (-2*height, height), random (1, 4)); // eine neue schneeflocke wird dem array hinzugefügt. Der z-Wert wird für die größe des Schneeflocker verwendet. der y-wert liegt außerhalb des sichtbaren Fensters, damit nicht alle schneeflocken auf einmal im Bild erscheinen
    p2 [i] = new PVector (random (-width, width), random (-2*height, height), random (4, 7)); 
    p3 [i] = new PVector (random (-width, width), random (-2*height, height), random (7, 10)); 
    i++;
  }
}

