
Circular circularInstance; // Variable vom Datentyp Circular anlegen mit dem Namen "circularInstance"
                             // = Instanz / Objekt der Klasse Circular

void setup ()
{
  size (600, 200);
  smooth();

  circularInstance = new Circular (); // aufrufen des Konstruktors
}

void draw ()
{
  background (#57385c);
  circularInstance.update (); // aufrufen einer Methode von der Klasse Circular
}


void mousePressed ()
{
  circularInstance = new Circular ();
}

class Circular
{
  float radius;
  int num;

  PVector location;
  Circular () // konstruktor, mind. 1 // setup der Klasse Circular
  {
    radius = random (10, 100);
    num = round (random (3, 30));
    location = new PVector (random (width), random (height));
  }

  void update ()
  {
    fill (#ffedbc);
    noStroke();

    for (int i = 0; i < num; i = i + 1 )
    {
      float angle =  map (i, 0, num, 0, TWO_PI);

      float x = location.x + cos (angle) * radius;
      float y = location.y + sin (angle) * radius;

      ellipse (x, y, 10, 10);
    }
  }
}

