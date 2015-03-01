
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
 
  
  
  colorMode(HSB, 360, 360, 360);
  float amplitude = map(sin(counter), -1, 1, 30, 60); 
  //translate(width/2,height/2);
  fill(amplitude, 10, 100);

  translate(mouseX, mouseY);
  ellipse(0, sin(counter)*100, 100, 100);        
  
  
  println(sin(counter));
  counter += 0.1;
  
}
