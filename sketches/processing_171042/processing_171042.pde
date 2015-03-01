
boolean zeichnung_01 = true;
boolean zeichnung_02 = false;
boolean zeichnung_03 = false;


void setup ()
{
  size (600, 200);
  smooth();

  background (#57385c);
}

void draw ()
{
  if (mousePressed == true) // nur wenn die Maus gedrückt wird, soll etwas gezeichnet werden
  {                          // mousePressed = Systemvariable, die den selben Namen wie eine Eventfunktion trägt
    float x = mouseX;
    float y = mouseY;
    float d = random (5, 30);


    if (zeichnung_01 == true)
    {
      stroke (255);
      strokeWeight (d/8);
      fill (#A75265);
      ellipse (x, y, d, d);

      line (x, y, x+d, y-d);
      ellipse (x+d, y-d, d/2, d/2);
      line (x+d, y-d*2, x+d, y-d);

      fill (255);
      noStroke();
      ellipse (x+d, y-d*2, d/3, d/3);
    } else if (zeichnung_02 == true) 
    {
      fill (#ec7263);
      noStroke();
      ellipse (x, y, d/3, d/3);
    } else if (zeichnung_03 == true)
    {
      fill (#ffffff);
      noStroke();
      rect (x, y, d/3, d/3);
    }
    /* else if (zeichnung_04 == true) 
     * es können beliebig viele weitere else if Blöcke angefügt werden
     */
  }
}


void keyPressed ()
{
  if (key == '1')
  {
    if (zeichnung_01 == true)
    {
      zeichnung_01 = false;
    } else
    {
      zeichnung_01 = true;
    }
    
    println ("zeichnung 1 " + zeichnung_01);
  }
  if (key == '2')
  {
    if (zeichnung_02 == true)
    {
      zeichnung_02 = false;
    } else
    {
      zeichnung_02 = true;
    }
    println ("zeichnung 2 " + zeichnung_02);
  }

  if (key == '3')
  {
    if (zeichnung_03 == true)
    {
      zeichnung_03 = false;
    } else
    {
      zeichnung_03 = true;
    }
    println ("zeichnung 3 " + zeichnung_03);
  }
  
   if (key == ' ')
   {
     background (#57385c);
   }
   
   if (key == 's')
   {
     String pfad = "export/"; // Ordner, innerhalb des Processing-Sketch Ordners
     pfad = pfad + year();    // Datumsfunktionen geben Datum / Zeit des Rechners wieder
     pfad = pfad + month();
     pfad = pfad + day() + "_";
     pfad = pfad + hour();
     pfad = pfad + minute();
     pfad = pfad + second();
     pfad = pfad + ".png";    // Dateiendung
     
     saveFrame (pfad);
   }
}

