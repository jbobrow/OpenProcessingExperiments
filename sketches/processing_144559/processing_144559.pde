
// Esercizio 5.2 Vernice Colorata
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1


// Globals
int myColors = 10;         
Colore[] myColorsArray = {};


// Classes
class Colore 
{
  float x, y;
  float radius;
  color fillColor;
  float transparency;
  float xMove, yMove;
 
  Colore() 
  {
    x = mouseX;
    y = mouseY;
    radius = random(50) + 10;
    fillColor = color(random(255), random(255), random(255));
    transparency = random(150);
    xMove = random(10) - 5;
    yMove = random(10) - 5;
  }
 
  void drawMe() 
  {
    noStroke();
    fill(fillColor, transparency);
    ellipse(x, y, random(radius*2), random(radius*2));
  }
   
  void updateMe() 
  {
    x += xMove;
    y += yMove;
    if (x > (width+radius)) { x = 0 - radius; }
    if (x < (0-radius)) { x = width+radius; }
    if (y > (height+radius)) { y = 0 - radius; }
    if (y < (0-radius)) { y = height+radius; }
    drawMe();
  }
}


// ** MAIN ** //


void setup() 
{
  size(900,600);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawColors();
}

void draw() 
{
  for(int i=0; i<myColorsArray.length; i++) 
  {
    Colore thisColor = myColorsArray[i];
    thisColor.updateMe();
  }
}
 
void mouseReleased() 
{
  drawColors();
}
 
void keyReleased()
{
  if (key=='c' || key=='C') 
  {
    background(255);
  }
}
 
void drawColors() 
{
  for (int i=0; i<myColors; i++) 
  {
    Colore thisColor = new Colore();
    thisColor.drawMe();
    myColorsArray = (Colore[])append(myColorsArray, thisColor);
  }
}


