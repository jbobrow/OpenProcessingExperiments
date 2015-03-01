


String[] ancre1 =
{
  "el magenta es", "el magenta", "el verde es", "el verde", "el no verde", "el no magenta", "pero el verde", "pero el magenta", "no es", "verde", "magenta", "no", "es", "pero"
};
String[] ancre2 =
{
  "el magenta es", "el magenta", "el verde es", "el verde", "el no verde", "el no magenta", "pero el verde", "pero el magenta", "no es", "verde", "magenta", "no", "es", "pero"
};
String[] ancre3 =
{
  "el magenta es", "el magenta", "el verde es", "el verde", "el no verde", "el no magenta", "pero el verde", "pero el magenta", "no es", "verde", "magenta", "no", "es", "pero"
};

PFont f;
void setup()
{
  size(1024, 600);
  background(255);
  smooth();
  fill(40);
  f = createFont("Arial", 12, true);
  textFont(f, 24);
  textAlign(CENTER);

  text ("el magenta es el no verde", width/2, height/4);
  text ("pero el verde", width/2-68, height/2.7);
  text ("no es el no magenta", width/2+5, height/2.3);
  text ("verde es el pasto no seco", width/2, height/1.8);
}

void draw()
{
  if (mousePressed)
  {
    background(255);
    text (ancre1[int(random(0, ancre1.length))], width/2, height/4);
    text (ancre2[int(random(0, ancre2.length))], width/2, height/2.7);
    text (ancre1[int(random(0, ancre3.length))], width/2, height/2.3);
    text ("verde es el pasto no seco", width/2, height/1.8);
  }
}



