
float xCourant = 200;
float yCourant = 200;
float xCible;
float yCible;
float diametre = 100;
float diametrePupille = 30;

void setup () {
  size (400, 400);
  smooth ();
  noStroke ();
}

void draw () {
  background (108, 24, 24);
  fill(255);
  ellipse (xCourant, yCourant, diametre, diametre);

  float distance = dist(mouseX, mouseY, xCourant, yCourant);
  distance = constrain (distance, 0, diametre/2 - diametrePupille/2);

  float radians =  atan2(mouseY - yCourant, mouseX - xCourant);
  float xPupille = cos (radians) * distance + xCourant;
  float yPupille = sin (radians) * distance + yCourant;

  xCourant = (xCible - xCourant) * 0.2 + xCourant;
  yCourant = (yCible - yCourant) * 0.2 + yCourant;

  fill (144, 79, 79);
  ellipse (xPupille, yPupille, diametrePupille, diametrePupille);
}

void mousePressed () {
  xCible = mouseX;
  yCible = mouseY;
}
