
/**
 * Dripping
 */
 
void setup () {
  size(400, 400);
  background(255);
  noStroke();
}

void draw () {
  fill(55 + random(200), 55 + random(200), 55 + random(200), 55 + random(200));
  float rayon = random(100);
  float posx = random(400);
  float posy = random(400);
  for (int i = 0; i <= random(10); i++) {
    ellipse(posx, posy, rayon, rayon);
    posx = posx + (random(rayon * 2) - rayon);
    posy = posy + (random(rayon * 2) - rayon);
    rayon = rayon / 2;
  }
  filter(BLUR, 1);
  filter(DILATE);
}

