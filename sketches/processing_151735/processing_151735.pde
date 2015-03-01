
void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
  frameRate (1);
}

void draw ()
{
  background (#57385c);
  
  float zufallsFarbe = random (100);
  color ellipseFill_1 = color (#ffedbc);
  color ellipseFill_2 = color (#A75265);

  if (zufallsFarbe< 50)
  {
    ellipseFill_2 = color (#ffedbc);
    ellipseFill_1 = color (#A75265);
  }
  
  int zufallsForm = (int) random (0, 9);
  // dice 0 == kein kreis
  // dice 1 == nur oben
  // dice 2 == nur unten
  // dice 3 == oben und unten
  // dice 4 == nur rechts
  // dice 5 == nur links
  // dice 6 == rechts und links
  // dice 7 == vollkreis
  // dice 8 == kein kreis


  float d = 100;
  noStroke();

  if (zufallsForm == 1)
  {
    fill (ellipseFill_1);
    arc (width/2, height/2, d, d, PI, TWO_PI);
  }
  else if (zufallsForm == 2)
  {
    fill (ellipseFill_1);
    arc (width/2, height/2, d, d, 0, PI);
  }
  else if (zufallsForm == 3)
  {
    fill (ellipseFill_1);
    arc (width/2, height/2, d, d, 0, PI);

    fill (ellipseFill_2);
    arc (width/2, height/2, d, d, PI, TWO_PI);
  }
  else if (zufallsForm == 4)
  {
    fill (ellipseFill_1);
    arc (width/2, height/2, d, d, PI/2, PI + PI/2);
  }
  else if (zufallsForm == 5)
  {
    fill (ellipseFill_1);
    arc (width/2, height/2, d, d, -PI/2, PI/2);
  }
  else if (zufallsForm == 6)
  {
    fill (ellipseFill_1);
    arc (width/2, height/2, d, d, PI/2, PI + PI/2);

    fill (ellipseFill_2);
    arc (width/2, height/2, d, d, -PI/2, PI/2);
  }
  else if (zufallsForm == 7)
  {
    fill (ellipseFill_1);
    ellipse (width/2, height/2, d, d);
  }
}


void mousePressed ()
{
  background (#57385c);
}

