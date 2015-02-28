
color c1 = getRandomColor();
color c2 = getRandomColor();

void setup() {
  size(400, 300);
  background(255);
  noStroke();
  frameRate(20);
}

void draw() {
  //background(255);
  if (random(10)<3) {  //neue Farbe ins Spiel bringen
    c2 = c1; 
    c1 = getRandomColor();
  } 
  c2 = lerpColor(c1,c2,random(0.2,0.8));  //Farbe zwischen c1 und c2 finden
  fill(c2); //... und für den nächsten splash benutzen
  drawSplash(mouseX+(int)random(-40,40), mouseY+(int)random(-40,40), (int) random(40,80));
}

void drawSplash(int x, int y, int size) {
  ellipse(x, y, size, size);  //Kreis zeichnen
  int chance = 80;
  while (random(100)<chance && size > 3) {  //Abbruchkriterium. WICHTIG - verhindert infinite loop des rekursiven Aufrufs
    //chance = constrain(80, 95, chance +=3);  
    chance +=3; //die Chance erhöhen, so dass es mehr kleinere Kreise gibt
    int maxOffset = (int) (size*0.25+25);
    x += (int) random(-maxOffset, maxOffset);  //nächsten Kreis zufällig versetzen und verkleinern
    y += (int) random(-maxOffset, maxOffset);
    size = (int) (size-random(0, size*0.9));
    drawSplash(x, y, size);  //rekursiver Aufruf, das ganze nochmal...
  }
}

color getRandomColor() {
  color c = color(random(255), random(255), random(255));
  return c;
}



