
color hintergrund = color (240);

void setup ()
{
  size (510, 515);
  smooth();
  background (hintergrund);
  frameRate (1);
}
 
void draw ()
{
  background (hintergrund);
  // dice 0 == kein kreis
  // dice 1 == nur oben
  // dice 2 == nur unten
  // dice 3 == oben und unten
  // dice 4 == nur rechts
  // dice 5 == nur links
  // dice 6 == rechts und links
  // dice 7 == vollkreis
  // dice 8 == kein kreis
 
 
 
 
  fill (#2E6D8E);
  noStroke ();
  
  
  rect (50,50,99,99);
  rect (155,50,99,99);
  rect (259,50,99,99);
  rect (363,50,99,99);
  
  rect (50,155,99,99);
  rect (155,155,99,99);
  rect (259,155,99,99);
  rect (363,155,99,99);
  
  rect (50,259,99,99);
  rect (155,259,99,99);
  rect (259,259,99,99);
  rect (363,259,99,99);
  
  rect (50,363,99,99);
  rect (155,363,99,99);
  rect (259,363,99,99);
  rect (363,363,99,99);
 
 
 
 
 
 
  int dice = iRandom (0, 9);
  int colorDice = iRandom (0, 2);
 
  color ellipseFill_1 = color (0);
  color ellipseFill_2 = color (240);
  color ellipseFill_3 = color (#1F4D64);
 
  if (colorDice == 1)
  {
    ellipseFill_2 = color (240);
    ellipseFill_1= color (0);
    ellipseFill_3 = color (#1F4D64);
  }
 
  float d = 70;
  noStroke();
 
 //////////////////1///////////////////////
 
  if (dice == 1)
  {
     fill (ellipseFill_1);
    arc (99.5, 99.5, d, d, PI/2, PI + PI/2);
  }
  else if (dice == 2)
  {
      fill (ellipseFill_1);
    arc (99.5, 99.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 3)
  {
    fill (ellipseFill_1);
    arc (307.5, 203, d, d, 0, PI);
 
    fill (ellipseFill_3);
    arc (99.5, 99.5, d, d, PI, TWO_PI);
  }
  else if (dice == 4)
  {
      fill (ellipseFill_3);
    arc (411.5, 307.5, d, d, PI, TWO_PI);
  }
  else if (dice == 5)
  {
  
    fill (ellipseFill_3);
    arc (99.5, 99.5, d, d, 0, PI);
  }
  else if (dice == 6)
  {
    fill (ellipseFill_1);
    arc (99.5, 99.5, d, d, PI/2, PI + PI/2);
 
    fill (ellipseFill_2);
    arc (99.5, 99.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 7)
  {
    fill (ellipseFill_3);
    ellipse (99.5, 99.5, d, d);
  }
  
  //////////////////2///////////////////////
  
 
  
   if (dice == 1)
  {
    fill (ellipseFill_1);
    arc (307.5,307.5, d, d, PI, TWO_PI);
  }
  
  else if (dice == 3)
  {
    fill (ellipseFill_2);
    arc (307.5,307.5, d, d, 0, PI);
 
    fill (ellipseFill_3);
    arc (203.5, 99.5, d, d, PI, TWO_PI);
  }
   else if (dice == 2)
  {
    fill (ellipseFill_1);
    arc (203.5, 99.5, d, d, 0, PI);
  }
  else if (dice == 4)
  {
    fill (ellipseFill_3);
    arc (203.5, 99.5, d, d, PI/2, PI + PI/2);
  }
  else if (dice == 5)
  {
    fill (ellipseFill_3);
    arc (203.5, 99.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 6)
  {
    fill (ellipseFill_1);
    arc (203.5, 99.5, d, d, PI/2, PI + PI/2);
 
    fill (ellipseFill_2);
    arc (307.5,307.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 7)
  {
    fill (ellipseFill_1);
    ellipse (203.5, 307.5, d, d);
  }
  
   //////////////////3///////////////////////
 
  if (dice == 1)
  {
    fill (ellipseFill_3);
    arc (307.5, 99.5, d, d, PI, TWO_PI);
  }
  else if (dice == 2)
  {
    fill (ellipseFill_1);
    arc (307.5, 99.5, d, d, 0, PI);
  }
  else if (dice == 3)
  {
    fill (ellipseFill_1);
    arc (307.5, 99.5, d, d, 0, PI);
 
    fill (ellipseFill_2);
    arc (411.5,203.5, d, d, PI, TWO_PI);
  }
  else if (dice == 4)
  {
    fill (ellipseFill_2);
    arc (307.5, 99.5, d, d, PI/2, PI + PI/2);
  }
  else if (dice == 5)
  {
    fill (ellipseFill_3);
    ellipse (307.5, 99.5, d, d); 
  }
  else if (dice == 6)
  {
    fill (ellipseFill_1);
    arc (307.5, 99.5, d, d, PI/2, PI + PI/2);
 
    fill (ellipseFill_2);
    arc (307.5, 99.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 7)
  {
  fill (ellipseFill_2);
    arc (307.5, 99.5, d, d, -PI/2, PI/2);
  }
  
  //////////////////4///////////////////////
  
    if (dice == 1)
  {
    fill (ellipseFill_3);
    arc (307.5, 307.5, d, d, PI, TWO_PI);
  }
  else if (dice == 2)
  {
    fill (ellipseFill_2);
    arc (203.5, 307.5, d, d, 0, PI);
  }
  else if (dice == 3)
  {
    fill (ellipseFill_3);
    arc (411.5, 307.5, d, d, 0, PI);
 
    fill (ellipseFill_2);
    arc (411.5, 307.5, d, d, PI, TWO_PI);
  }
  else if (dice == 4)
  {
    fill (ellipseFill_2);
    arc (203.5, 307.5, d, d, PI/2, PI + PI/2);
  }
  else if (dice == 5)
  {
    fill (ellipseFill_3);
    ellipse (411.5, 307.5, d, d); 
  }
  else if (dice == 6)
  {
    fill (ellipseFill_3);
    arc (307.5, 307.5, d, d, PI/2, PI + PI/2);
 
    fill (ellipseFill_1);
    arc (411.5, 307.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 7)
  {
  fill (ellipseFill_2);
    arc (411.5, 307.5, d, d, -PI/2, PI/2);
  }
  
  //////////////////5///////////////////////
  
  
      if (dice == 1)
  {
    fill (ellipseFill_3);
    arc (99.5,203.5, d, d, PI, TWO_PI);
  }
  else if (dice == 2)
  {
    fill (ellipseFill_1);
    arc (99.5,203.5, d, d, 0, PI);
  }
  else if (dice == 3)
  {
    fill (ellipseFill_1);
    arc (99.5,203.5, d, d, 0, PI);
 
    fill (ellipseFill_3);
    arc (203.5,411.5, d, d, PI, TWO_PI);
  }
  else if (dice == 4)
  {
    fill (ellipseFill_2);
    arc (99.5,203.5, d, d, PI/2, PI + PI/2);
  }
  else if (dice == 5)
  {
    fill (ellipseFill_3);
    ellipse (99.5,203.5, d, d); 
  }
  else if (dice == 6)
  {
    fill (ellipseFill_1);
    arc (99.5,203.5, d, d, PI/2, PI + PI/2);
 
    fill (ellipseFill_2);
    arc (99.5,203.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 7)
  {
  fill (ellipseFill_2);
    arc (99.5,203.5, d, d, -PI/2, PI/2);
  }
  
    //////////////////6///////////////////////
  
  
      if (dice == 1)
  {
    fill (ellipseFill_3);
    arc (411.5,411.5, d, d, PI, TWO_PI);
  }
  else if (dice == 2)
  {
    fill (ellipseFill_1);
    arc (411.5,411.5, d, d, 0, PI);
  }
  else if (dice == 3)
  {
    fill (ellipseFill_1);
    arc (411.5,411.5, d, d, 0, PI);
 
    fill (ellipseFill_2);
    arc (411.5,411.5, d, d, PI, TWO_PI);
  }
  else if (dice == 4)
  {
    fill (ellipseFill_2);
    arc (411.5,411.5, d, d, PI/2, PI + PI/2);
  }
  else if (dice == 5)
  {
    fill (ellipseFill_2);
    ellipse (411.5,411.5, d, d); 
  }
  else if (dice == 6)
  {
    fill (ellipseFill_2);
    arc (411.5,411.5, d, d, PI/2, PI + PI/2);
 
    fill (ellipseFill_1);
    arc (411.5,411.5, d, d, -PI/2, PI/2);
  }
  else if (dice == 7)
  {
  fill (ellipseFill_3);
    arc (99.5,411.5, d, d, -PI/2, PI/2);
  }
  
  
  
  
  
  
  
}
 
 
int iRandom (float minVal, float maxVal)
{
  float rVal = random (minVal, maxVal);
  int iVal = int (rVal);
  return iVal;
}
 
void mousePressed ()
{
  background (#2E6D8E);
 
    fill (240);
  noStroke ();
  
  
  rect (50,50,99,99);
  rect (155,50,99,99);
  rect (259,50,99,99);
  rect (363,50,99,99);
  
  rect (50,155,99,99);
  rect (155,155,99,99);
  rect (259,155,99,99);
  rect (363,155,99,99);
  
  rect (50,259,99,99);
  rect (155,259,99,99);
  rect (259,259,99,99);
  rect (363,259,99,99);
  
  rect (50,363,99,99);
  rect (155,363,99,99);
  rect (259,363,99,99);
  rect (363,363,99,99);
  
  fill (0);
  
   
 
  int tri = iRandom (0, 11);
  int colorTri = iRandom (0, 2);
 
  color triFill_1 = color (50);
  color triFill_2 = color (150);
  color triFill_3 = color (#2E6D8E);
 
  if (colorTri == 1)
  {
    triFill_2 = color (50);
    triFill_1= color (150);
    triFill_3 = color (#2E6D8E);
  }

    triangle (50,149,99.5,50,149,149);
    fill (triFill_2);
    triangle (362,462,411.5,362,461,462);
     fill (triFill_3);
    triangle (307.5,254,307.5,154,357,254);

  ////////tri1/////////
  
    if (tri == 2)
  {
    fill (triFill_3);
    triangle (50,149,99.5,50,149,149);
  }
  else if (tri == 1)
  {
    fill (triFill_1);
    triangle (50,149,99.5,50,99.5,149);
  }
  else if (tri == 3)
  {
    fill (triFill_3);
    triangle (50,149,99.5,50,99.5,149);
 
    fill (triFill_2);
    triangle (99.5,149,99.5,50,149,149);
  }
  else if (tri == 5)
  {
    fill (triFill_3);
    triangle (50,149,99.5,50,149,149); 
  }
  
  
  
  ////////tri2/////////
  
    if (tri == 1)
  {
    fill (triFill_2);
    triangle (154,149,203.5,50,253,149);
  }
  else if (tri == 2)
  {
    fill (triFill_1);
    triangle (203.5,149,203.5,50,253,149);
  }
  else if (tri == 3)
  {
    fill (triFill_1);
    triangle (154,358,203.5,258,253,358);
 
    fill (triFill_2);
    triangle (99.5,149,99.5,50,149,149);
  }
  else if (tri == 5)
  {
    fill (triFill_2);
    triangle (154,358,203.5,258,253,358); 
  }
  
  
  ////////tri3/////////
  
    if (tri == 1)
  {
    fill (triFill_3);
    triangle (154,358,203.5,258,254,358);
  }
  else if (tri == 2)
  {
    fill (triFill_1);
    triangle (203.5,358,203.5,258,254,358);
  }
  else if (tri == 3)
  {
    fill (triFill_3);
    triangle (203.5,358,203.5,258,254,358);
 
    fill (triFill_2);
    triangle (154,358,203.5,258,203.5,258);
  }
  else if (tri == 5)
  {
    fill (triFill_2);
    triangle (154,358,203.5,258,254,358); 
  }
    
    ////////tri4/////////
  
    if (tri == 1)
  {
    fill (triFill_2);
    triangle (258,254,307.5,154,357,254);
  }
  else if (tri == 1)
  {
    fill (triFill_3);
    triangle (307.5,254,307.5,154,357,254);
  }
  else if (tri == 3)
  {
    fill (triFill_2);
    triangle (258,254,307.5,154,307.5,254);
 
    fill (triFill_1);
    triangle (307.5,254,307.5,154,357,254);
  }
  else if (tri == 5)
  {
    fill (triFill_2);
    triangle (258,254,307.5,154,307.5,254); 
  }
  
     ////////tri5/////////
  
    if (tri == 1)
  {
    fill (triFill_3);
    triangle (50,462,99.5,362,149,462);
  }
  else if (tri == 2)
  {
    fill (triFill_1);
    triangle (50,462,99.5,362,99.5,462);
  }
  else if (tri == 3)
  {
    fill (triFill_3);
    triangle (50,462,99.5,362,99.5,462);
 
    fill (triFill_2);
    triangle (99.5,462,99.5,362,149,462);
  }
  else if (tri == 5)
  {
    fill (triFill_3);
    triangle (99.5,462,99.5,362,149,462); 
  }
  
  
       ////////tri6/////////
  
    if (tri == 1)
  {
    fill (triFill_2);
    triangle (362,462,411.5,362,461,462);
  }
  else if (tri == 2)
  {
    fill (triFill_3);
    triangle (312.5,358,312.5,258,362,358);
  }
  else if (tri == 3)
  {
    fill (triFill_1);
    triangle (362,149,411.5,50,411.5,149);
 
    fill (triFill_3);
    triangle (411.5,149,411.5,50,461,149);
  }
  else if (tri == 5)
  {
    fill (triFill_1);
    triangle (50,254,99.5,154,99.5,254); 
  }
  
  
  
}



