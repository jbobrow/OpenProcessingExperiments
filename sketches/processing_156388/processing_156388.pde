
/*----------------------------------
       
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
       
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
      
 -----------------------------------*/
 
 ArrayList <Mover> bouncers;


void setup ()
{
  size (600, 400);
  smooth();

  bouncers = new ArrayList ();

  background (#57385c);
  frameRate (30);
}

void draw ()
{

  int i = 0;
  while (i < bouncers.size ())
  {
    Mover m = bouncers.get (i);
    m.update();

    if (m.isDead == true)
    {
      bouncers.remove (i);
    }
    else
    {
      i = i + 1;
    }
  }


  if (mousePressed && mouseButton == LEFT)
  {
    Mover newMover = new Mover (mouseX, mouseY);
    bouncers.add (newMover);
  }
}


 // was sind klassen?

class Mover
{
  PVector location;       // position
  PVector direction;     // bewegungsrichting

  float speed;           // bewegungsgeschwindigkeit

  float diameterLoss;   // prozentualer verlust an durchmesser pro frame
  float diameter;       // aktueller durchmesser
  float DIAMETER;       // durchmesser beim start
  color c1, c2, c;      // startfarbe, zielfarbe, aktuelle farbe

  float noiseScale;    // noise skalierung
  float noiseStrength;  // stÃ¤rke des noise feldes
  float forceStrength;  // stÃ¤rke der verÃ¤nderung durch das noise feld

  boolean doDie = false; // soll Ã¼berprÃ¼ft werden, ob der punkt sich auÃ�erhalb der zeichenflÃ¤che befindet
  boolean isDead = false; // ist der punkt auÃ�erhalb der zeichenflÃ¤che


  Mover (float x, float y) // Konstruktor = setup der Mover Klasse
  {
    doDie = true;
    location = new PVector (x, y);
    diameter = random (10, 20);
    DIAMETER = diameter;
    float angle = random (TWO_PI);
    direction = new PVector (cos (angle), sin (angle));

    speed = diameter /2;
    diameterLoss = random (0.01, 0.1);
    noiseScale = random (10, 300);
    noiseStrength = random (0.5, 5);
    forceStrength = random (0.1, 0.8);
    setRandomColor();
  }

  void setRandomColor ()
  {
    int colorDice = (int) random (4);

    if (colorDice == 0) c1 = #ffedbc;
    else if (colorDice == 1) c1 = #A75265;
    else if (colorDice == 2) c1 = #ec7263;
    else c1 = #febe7e;

    float dice = random (100);

    colorDice = (int) random (4);

    if (colorDice == 0) c2 = #ffedbc;
    else if (colorDice == 1) c2 = #A75265;
    else if (colorDice == 2) c2 = #ec7263;
    else c2 = #febe7e;

    c = c1;
  }

  void update ()
  {
    addNoise (); // richtungsÃ¤nderung des punktes basierend auf einen (zufÃ¤lligen) noise feldes
    move();      // bewegung
    checkEdgesAndDie ();     // kantenÃ¼berÃ¼berprÃ¼fung
    display();        // zeichnen

    diameter *= (1-diameterLoss); // verkleinerung des kreises
    speed = constrain (speed, 0, diameter * 0.4); // einschrÃ¤nkung der bewegungsgeschwindigkeit mit dem ziel, dass keine einzelnen kreise in der Zeichnung erkennbar werden, sondern eine zusammenhÃ¤ngende form entsteht
    c = lerpColor ( c1, c2, map (diameter, 1, DIAMETER, 1, 0)); // aktualisierung der farbe basierend auf dem aktuellen durchmesser
  }


  void addNoise ()
  {
    float noiseValue = noise (location.x /noiseScale, location.y / noiseScale, frameCount / noiseScale);
    noiseValue*= TWO_PI * noiseStrength;

    PVector force = new PVector (cos (noiseValue), sin (noiseValue));
    //Processing 2.0:
    //PVector force = PVector.fromAngle (noiseValue);
    force.mult (forceStrength);
    direction.add (force);
    direction.normalize();
  }

  void move ()
  {
    PVector velocity = direction.get();
    velocity.mult (speed);
    location.add (velocity);
  }

  void checkEdgesAndDie ()
  {
    if (location.x < -diameter/2)
    {
      isDead = true;
    } 
    else if (location.x > width+diameter/2)
    {
      isDead = true;
    }

    if (location.y < -diameter/2)
    {
      isDead = true;
    } 
    else if (location.y > height + diameter/2)
    {
      isDead = true;
    }
    if ( diameter < 1)isDead = true;
  }

  void display ()
  {
    noStroke();
    fill (c);
    ellipse (location.x, location.y, diameter, diameter);
  }
}



 void keyPressed ()
{
  if (key == ' ')
  {
   background (#57385c);
  }
}

