
void setup ()
{ size (800,800);
}

float licznik = 0;

void nowaFunkcja (float r)
{
 rectMode (CENTER);
  drawShape (200, 200, 100, 5); 
    rotate (PI/r);
}

void draw ()

{
  background (0);
  translate (400,400);
  licznik+=0.01;
  rotate(licznik);
  
  for (int i=0; i<10; i++)
  nowaFunkcja (5);
  
}

void drawShape(float x, float y, float r, int numberOfVertices)
{
  pushMatrix();                  //zapamietaj obecne polozenie ukladu wspolrzednych
  translate(x,y);
  float angle = 2*PI/numberOfVertices;
  beginShape();                  //rozpocznij tworzenie ksztaltu
  for(int i = 0; i <= numberOfVertices; i++)
  {
    float vx = r * cos(angle * i);
    float vy = r * sin(angle * i);
    vertex(vx ,vy);              //dodaj wierzcholek do ksztaltu o wspolrzednej (x,y)
  }
  endShape();                    //zakończ tworzenie kształtu
   
  popMatrix();                   //przywroc zapamietane polozenie ukladu wspolrzednych
}
