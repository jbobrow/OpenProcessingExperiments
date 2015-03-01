
// Drückt mit Farbe und Bewegung ein Gefühl aus.
// Lasst das Gefühl mit der Maus verändern oder umkehren.

float counter = 0;

  void setup()
{
  size(500,500);
  background(0);
}

  void draw()
{
  colorMode(HSB, 360, 100, 100); //Viertens
  float amplitude = map(sin(counter), -1, 1, 0, 60); //Drittens
  translate(mouseX,mouseY);
  fill(amplitude, 100, 100); //Viertens
  ellipse(0, sin(counter)*200, 50, 50);
  println(sin(counter));
  counter += 0.2;
}
