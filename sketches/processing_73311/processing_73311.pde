
int t;

void setup()
{
  size(300, 300);
  background(0);
  t = millis();
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
  rectMode(CENTER);
  rect(width/2, height/2, 200, 20);
  noStroke();
  fill(255);
  rectMode(CORNER);
  int loaded = round(map(millis()-t, 0, 5000, 0, 100));
  if (millis()-t <= 5000)
  {
    rect(width/2 - 100, height/2 - 10, map(millis()-t, 0, 5000, 0, 200), 20);
    text("LOADING " + nf(loaded, 0) + " %", width/2 - 100, height/2 - 15);
  }
  else
  {
    rect(width/2 - 100, height/2 - 10, 200, 20);
    text("LOADING 100%", width/2 - 100, height/2 - 15);
  }
}

void mousePressed()
{
  if (millis()-t >= 5000) t = millis();
}
