
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


void draw () {
  int v = int(noise(frameCount * .01)*12);
  float p = noise(frameCount * .01)*200;
  colorMode(HSB, 100, 100, 100, 100);
  fill(v * (p/10), 100, 100, 30);
  noStroke();
    drawShape(0 + int(noise(random(1, 50) * .01)*400) , 0 + int(noise(random(1, 50) * .01)*400), p, v); //wykonaj funkcje
}


 
/*void draw()
{
  for (int i = 10; i <= 10 && i > 0; i--) {
  colorMode(HSB, 100, 100, 100);
  fill(i * 10, 100, 100);
  drawShape(width/2, height/2, 100 + 10*i, i); //wykonaj funkcje
  }
}*/
