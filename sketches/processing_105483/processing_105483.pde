
size(600, 400);

float bgSq = 80;
float smSq = bgSq/sqrt(2);

colorMode(HSB, 360, 100, 100);

color evnBgFill = color(30, 0, 100);
color oddBgFill = color(30, 0, 0);
color evnSmFill = color(180, 80, 30);
color oddSmFill = color(135, 90, 65);

rectMode(CENTER);
smooth(8);

noStroke();

background(250);

pushMatrix();

translate(bgSq/2, bgSq/2);

int tally = 0;

for (float x = 0; x < width; x += bgSq) 
{
  for (float y = 0; y < height; y += bgSq) 
  {
    pushMatrix();
    translate(x, y);

    if (tally % 2 == 0) fill(evnBgFill);
    else fill(oddBgFill);

    rect(0, 0, bgSq, bgSq);
    rotate(PI/4);

    if (tally % 2 == 0) fill(evnSmFill);
    else fill(oddSmFill);

    rect(0, 0, smSq, smSq);

    popMatrix();
    
    tally += 1;
  }
}
popMatrix();
