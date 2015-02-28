
//Anne Lagacé
//Boutons et boucles


//////////////////////////////////////////////////////////////////////////////////////////VARIABLES///
float x1;
float y1;
float w1;
float h1;
float state1;
 
float x2;
float y2;
float w2;
float h2;
int state2;
 
final int ON = 1 ;
final int OFF = 0 ;
 
float tranche;
float rads;
float ratio;
float v;
float v2;
float i;
 
int nombreDeRayons = 25;
int longueurDesRayons = 45;
 
//////////////////////////////////////////////////////////////////////////////////////////VOID SETUP///
void setup()
{
  size(400, 400);
 
  // HOLD BUTTON CARRE
  x1 = width/4+150;
  y1 = height/2-25;
  w1 = 50;
  h1 = 50;
  state1 = OFF;
 
  // TOGGLE BUTTON CERCLE
  ellipseMode (CORNER);
  x2 = width/4*2-100;
  y2 = height/2-25;
  w2 = 50;
  h2 = 50;
  state2 = OFF;
 
  smooth();
  noStroke();
}
 
 
 
 
//////////////////////////////////////////////////////////////////////////////////////////VOID DRAW///
void draw()
{
  background ( 100 );
 
  /////////////////////////////////////////////////// // HOLD BUTTON CARRE
  fill(50);
  stroke(0);
  strokeWeight(3);
 
  if ( state1 == ON )
  {
    fill(250, 18, 208);
    if (v < height)
    {
      v+=2;
    }
  }
  else
  {
    fill(10, 250, 8);
    if (v > 0)
    {
      v-=2;
    }
  }
 
  i = 0;                 // incrément (le meme que pour le cercle rads)
  while (i < v)
  {
    line (0, i, width, i);
    i = i+10;
  }
 
  noStroke();
  rect(x1, y1, w1, h1);
 
  //////////////////////////////////////////////  // TOGGLE BUTTON CERCLE
  fill(50);
 
  tranche = TWO_PI / nombreDeRayons;          //tranche est donc l'espace entre chache rayon en radians (incrément)
  rads = 0;                                   //rads c'est où on est rendu dans la progression des radians
  ratio = 0.75;                               //Ratio de la ligne que l'on voit, évidement c'est une fraction
 
  if ( state2 == ON )
  {
    fill(250, 18, 208);
    if (v2 < TWO_PI)
    {
      v2 += 0.08;
    }
  }
  else
  {
    fill(10, 250, 8);
    if ( v2 > 0 )
    {
      v2 -= 0.08 ;
    }
  }
  strokeWeight(5);                                      // largeur de la ligne
  stroke(#FFF700);                                      // couleur de la ligne
  while ( rads < v2 && rads < TWO_PI )
  {  
    // avant que la ligne ait fait le tour du cercle
    float  xa = x2 + 25 + cos(rads) * longueurDesRayons * ratio;     //
    float  ya = y2 + 25 + sin(rads) * longueurDesRayons * ratio;     //
    float  xb = x2 + 25 + cos(rads) * longueurDesRayons;             //
    float  yb = y2 + 25 + sin(rads) * longueurDesRayons;             //
 
    line( xa, ya, xb, yb );                                  //
    rads = rads + tranche;
  }
  noStroke();
  ellipse(x2, y2, w2, h2);
}
 
//////////////////////////////////////////////////////////////////////////////////////////VOID MOUSE PRESSED///
void mousePressed()
{
  // BOUTON CARRE 
  if ( mouseX>x1 && mouseX<x1+w1 && mouseY>y1 && mouseY<y1+h1 )
  {
    state1 = ON;
  }
 
  // BOUTON CERCLE
  float distance = dist ( mouseX, mouseY, x2+w2/2, y2+h2/2 );
  if ( distance < w2/2 )
  {
    if ( state2 == OFF )
    {
      state2 = ON;
    }
    else {
      state2 = OFF;
    }
  }
}
 
//////////////////////////////////////////////////////////////////////////////////////////VOID MOUSE RELEASED///
void mouseReleased()
{
  state1 = OFF;
}
