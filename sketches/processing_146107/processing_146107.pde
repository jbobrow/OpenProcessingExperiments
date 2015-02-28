
void setup()
{
  size (600, 600, OPENGL);
  smooth ();
  frameRate (10);
}

void draw()
{
  translate (width/2, height/2);
rotate ( 2*PI / width * mouseX); // (0 = 0°)
           // (PI = 180°)
           // bespw. (PI / 4 = 45°)
           // (2*PI = 360°)
           // wenn Maus auf x-Achse bewegt wird >> dann Streifen rotiert und breiter/schmaler
           
  int resolution = mouseY / 10; 
  // sagt an, wie viele Streifen auf meine Rechteckfläche verteilt werden
  // wenn Maus nach unten gezogen wird (y-Achse), Streifen durch 10 geteilt

  float widthRect = width * 2/4; //Rechteckbreite
  float heightRect = widthRect; //Rechteckhöhe

  float span = widthRect / resolution; //Gesamtgröße des Rechtecks geteilt durch 16 (da 16 Streifen)

println (width / 11);
println (width / 11.0);

  float x = 0 - widthRect/2;
  float y = span * floor (random (0, resolution)) - heightRect / 2; // y generiert sich durch Zufall 
  // span = Streifenhöhe/-breite
  // "round" steht für das Auf- o Abrunden auf ganze Zahlen
  // oder statt "round" "floot" - dann IMMER abrunden



//color fuellfarbe = color (23, 107, 131);
//color linienfarbe = color (0, 255, 255);

  //  fill (fuellfarbe); // 1.wert = Graukanal | 2.Wert = Transparenzkanal
  // stroke (linienfarbe);
  // strokeWeight (span / 6);



  rect (x, y, widthRect, span);

  x = span * floor (random (0, resolution)) - widthRect/2;
  y = 0 - heightRect / 2;

  rect (x, y, span, heightRect);
}

