
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
  
  translate(mouseX, mouseY);
  colorMode(HSB, 360, 100, 100); //Viertens
  float amplitude = map(sin(counter), 1, -1, 0, 255); //Drittens
  
  fill(amplitude, 100, 100); //Viertens
  rect(0, 0, 500, 500);          //Drittens
 
  println(sin(counter));
  counter += 0.02;
}
