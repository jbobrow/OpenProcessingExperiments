
int startX, startY;
float abstand, radius, durchmesser;
float nachgeben = 0.23;
float gegenfarbe;
float textAnzeigeX, textAnzeigeY;
PFont schrift = createFont("Monospaced",12);
color farbe1, farbe2, farbe3, farbe4;
String zeichenkette;

void setup()
{
  size(700, 500, JAVA2D);
  frameRate(30);
  colorMode(HSB, width, 100, 100, 100);
  smooth();
}

void draw()
{
  background(0);
  if(startX < width / 2) gegenfarbe = startX + width / 2;
  else gegenfarbe = startX - width / 2;
  farbe1 = color(startX,100,100,100);
  farbe2 = color(gegenfarbe,100,100);
  farbe3 = color(0,0,0,70);
  farbe4 = color(0,0,70);
  abstand=sqrt(sq(startX-mouseX)+sq(startY-mouseY));
  if(mousePressed)
  {
    if(radius != abstand) radius += abstand * ((abstand-radius) / abstand) * nachgeben;
    durchmesser = radius * 2;
    noStroke();
    fill(farbe1);
    ellipse(startX, startY,durchmesser, durchmesser);
    fill(farbe2);
    ellipse(startX, startY, durchmesser * 0.618,durchmesser * 0.618);
    fill(farbe3);
    ellipse(startX, startY, 10, 10);
    ellipse(mouseX, mouseY, 10, 10);
    stroke(farbe4);
    line(startX, startY, mouseX, mouseY);
    fill(farbe4);
    textFont(schrift);
    zeichenkette = "startX: " + startX + "\nstartY: " + startY + "\nabstand: " + abstand + "\nradius: " + radius + "\nnachgeben: " + nachgeben;
    if(mouseX > startX) textAnzeigeX = mouseX + 15;
      else textAnzeigeX = mouseX - textWidth(zeichenkette) - 5;
    if(mouseY > startY) textAnzeigeY = mouseY + 15;
      else textAnzeigeY = mouseY - 70;
    text(zeichenkette, textAnzeigeX, textAnzeigeY);
  }
}

void mousePressed()
{
  startX = mouseX;
  startY = mouseY;
}

void mouseReleased()
{
  abstand = 0.0;
  radius = 0.0;
}

