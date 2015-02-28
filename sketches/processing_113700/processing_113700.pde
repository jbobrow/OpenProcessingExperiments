
void setup()
{
  size(360, 500);
  frameRate(0.3);
}

void draw()
{
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0, 360, 500);
  Teilung( 0, 0, 360, 500);
}

float Funktion()
{
  int Faktor = int(random(3));
  
  int a = 1;
  int b = 1;
  int Temp = 0;
  int Supe = 0;
  
  for(int x = 0; x < Faktor; x++)
  {
    Temp = b;
    Supe = a + b;
    b = a;
    a = Supe;
  }
  
  float Wert = float(a) / b;
  println(a + "W" + b + "W" + Wert);
  return(Wert);
 
}


void Teilung(int x, int y, int w, int h)
{
  fill(random(255), random(255), random(255));
  int f = int(random(2));
  float Wert = Funktion();
  switch(f)
  {
    case 0:
      rect(x,y,w,h);
      break;
    case 1:
      Teilung(x,y,int(w/Wert), h);
      Teilung(x+int(w/Wert), y, w - int( w / Wert), h);
      break;
  }
}
