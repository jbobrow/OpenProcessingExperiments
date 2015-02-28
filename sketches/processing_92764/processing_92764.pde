
void setup ()                    //funkcja uruchamiana raz, inicjuje ustawienia do działania sketchu
{
  size(400,400);
}
//***************funkcja rysuj wielokat foremny o srodku w (x,y) promieniu r i zadanej ilosci wierzcholkow
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

void draw()
{
  drawShape(width/2, height/2, 100, 5); //wykonaj funkcje
}
