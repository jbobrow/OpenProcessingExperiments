
/**
 * Verschwindende Formen
 *
 * Dies soll anhand eines coolen Beispiels zeigen, was
 * man mit Arrays alles anstellen kann.
 *
 */

void setup()
{
  //Das Übliche, schwarzer Hintergrund, Größe und smooth
  size(300, 300);
  background(255);
  smooth();
}

//Variablen für temporäre (!) Koordinaten und Größe der Formen
int tpx[] = new int[1];
int tpy[] = new int[1];
float ts[] = new float[1];
//Count wird in void draw() kontinuierlich inkrementiert
int count = 0;
//Eine Variable um die Ansicht zwischen Ellipse und Rechteck zu wechseln
int form = 1;

void draw()
{
  //Hintergrund neu zeichnen und aussehen der Objekte angeben
  background(255);
  noStroke();
  fill(0, 127);
  //Die Koordinaten des aktuellen (neuesten) Objekts
  //werden festgelegt
  tpx[count] = mouseX;
  tpy[count] = mouseY;
  //Ausgangsgröße der Form (Ellipse, etc..)
  ts[count] = 50;

  //In der Schleife werden nun alle Objekte bis zum aktuellen
  //Höchstwert durchlaufen (count wird je um 1 erhöht, siehe
  //letzte Zeile in void draw()
  for (int i = 0; i < count; i++)
  {
    noStroke();
    //Je nachdem welchen Wert "form" hat zeichnen wir ...
    switch(form)
    {
    case 1:
      //..eine Ellipse oder..
      ellipse(tpx[i], tpy[i], ts[i], ts[i]);
      break;
    case 2:
      //..ein Rechteck oder..
      rectMode(CENTER);
      rect(tpx[i], tpy[i], ts[i], ts[i]);
      break;
    case 3:
      //..eine Linie. Und eine Linie nur, wenn Variable "ts" mit diesem
      //Index noch größer ist als Null. Ansonsten würde die Linie nicht
      //verschwinden
      if (i > 1 && ts[i] > 0)
      {
        stroke(0);
        line(tpx[i], tpy[i], tpx[i-1], tpy[i-1]);
      }
      break;
    }
    //Solange die Größe des Objekts größer als Null
    //ist, kann das Objekt verkleinert werden, sobald es
    //kleiner ist als Null, passiert einfach nichts mehr
    if (ts[i] > 0)
    {
      //Faktor, um den das Objekt kleiner wird - bestimmt
      //auch Geschwindigkeit. Hier wird immer um 1 verkleinert
      ts[i] -= 0.75;
    }
    else
    {
      float tmp = 0 - ts[i];
      ts[i] += tmp;
    }
  }

  //Hier werden die Arrays erweitert, und zwar immer um 
  //jeweils 2 mehr als count
  tpx = expand(tpx, count+2);
  tpy = expand(tpy, count+2);
  ts = expand(ts, count+2);

  //Zum Schluss wird diese Variable noch um +1 inkrementiert
  count++;
}

void keyPressed()
{
  //Wir verändern die Variable "form", um zwischen Ellipse, Rechteck
  //und Linie zu wechseln. In void draw() wird abgefragt dass wenn
  //form == 1 eine Ellipse, wenn form == 2 ein Rechteck und wenn 
  //form == 3 eine Linie gezeichnet wird.
  switch(key)
  {
  case '1':
    form = 1;
    break;
  case '2':
    form = 2;
    break;
  case '3':
    form = 3;
    break;
  }
  //Arrayindex wird zurückgesetzt
  count = 0;
}

