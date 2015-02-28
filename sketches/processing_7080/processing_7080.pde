
class kreis
{
  float xpos, ypos;
  String suchstring;
  float ergebnisanzahl;
  int nummer;
  
  float durchmesser, sollradius;
  float radius = 1;
  float nachgeben = 0.08;
  
  String bezeichnung;

  kreis(float _xpos, float _ypos, String _suchstring, float _ergebnisanzahl, int _nummer)
  {
    xpos = _xpos;
    ypos = _ypos;
    suchstring = _suchstring;
    ergebnisanzahl = _ergebnisanzahl;
    nummer = _nummer;
    durchmesser = sqrt(ergebnisanzahl * 4 / PI) / 100;
  }

  void zeichnen()
  {
    sollradius = durchmesser / 2;
    if(sollradius - radius > 0.001)
    {
      radius += radius * ((sollradius - radius) / radius) * nachgeben;
    }
    fill(xpos, 100, 100, 70);
    ellipse(xpos, ypos, radius * 2, radius * 2);
    bezeichnung = "suchstring: " + suchstring + "\nergebnisanzahl: " + ergebnisanzahl;
    fill(0, 0, 70);
    text(bezeichnung, xpos - textWidth(bezeichnung) / 2, ypos + radius + 20);
  }
  
  void ausrichten()
  {
    for(int lauf = 0; lauf < 2; lauf++)
    {
    if((xpos - radius) < 0)
    {
      xpos += xpos * ((radius - xpos) / xpos) * nachgeben;
    }
    if((xpos + radius) > width)
    {
      xpos -= (radius + xpos) / radius * nachgeben;
    }

    if((ypos - radius) < 0)
    {
      ypos += ypos * ((radius - ypos) / ypos) * nachgeben;
    }
    if((ypos + radius) > height - 30)
    {
      ypos -= (radius + ypos) / radius * nachgeben;
    }
    }
  }
}


