
float x, y, _x, _y, angle;

int freqX = 1;
int freqY = 2;
float phase = 90;
String s;
int margin = 20;


void setup() {
  size(500, 500);
  smooth();
  textSize(10);
  strokeWeight(3);
}

void draw() {
  // effacer chaque trace avant le suivant
  noStroke();
  fill(0);
  rect(0, 0, width, height);

  // courbe
  phase = map(mouseX, 0, width, 0, 360);
  stroke(255);
  beginShape();
  for (float pas = 0; pas < width; pas += 0.5)
  {
    angle = map(pas, 0, width, -PI, PI);
    x = sin(angle * freqX + radians(phase));
    y = sin(angle * freqY);
    _x = map(x, -1, 1, margin, width - margin);
    _y = map(y, -1, 1, margin, height - margin);
    vertex(_x, _y);
  }
  endShape();


  // infos
  s = "freqX: " + freqX + "  freqY: " + freqY + "  phase: " + int(phase);
  fill(150);
  text(s, 10, 10);
}

void keyPressed() {
  if (key == '2')
    freqX++;
  if (key == '1')
    freqX--;
  freqX = max(freqX, 1); // pas de freq < 1

  if (key == '5')
    freqY++;
  if (key == '4')
    freqY--;
  freqY = max(freqY, 1); // pas de freq < 1
}



