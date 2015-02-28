
PFont myfont;

void setup()
{
  size(250, 250);
  // Verfuegbare Fonts ausgeben
  // println(PFont.list());
  
  myfont = createFont("sans-serif", 80);
  textFont(myfont);
  textAlign(CENTER, CENTER);
  // sans-serif,serif,monospace,cursive
  
  fill(100);
}

void draw()
{
    background(255);
  if (mousePressed == true)
  {
      text("Ja", width/2, height/2);
      }
      else
      {
      text("Nein", width/2, height/2);
      }
}
