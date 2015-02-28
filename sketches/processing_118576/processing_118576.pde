
PFont times;
PFont arial;
PFont blackoak;

void setup()
{
  size(500,500);
  background(255);
  times = createFont("Comic Sans MS",64);
  ariel = createFont("Arial",64);
  blackoak = createFont("Blackoak Std",32);
}

void draw()
{
  fill(0);
  textSize(50);
  textFont(blackoak);
  text("blackoak", 100, 100);
  textFont(ariel);
  text("Arial", 100, 400);
}


