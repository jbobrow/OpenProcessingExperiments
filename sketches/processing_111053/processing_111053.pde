
int pattern = 1;
color c1 = getRandomColor();
color c2 = getRandomColor();

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  frameRate(30);
}

void draw() {
  if (pattern == 1) {
    drawPattern1();
  } 
  else if (pattern == 2) {
    drawPattern2();
  }
  else if (pattern == 3) {
    drawPattern3();
  } 
  else if (pattern == 4) {
    drawPattern4();
  }
}

void mousePressed() {
  pattern = int(random(4))+1;

}

void drawPattern1() {
  noStroke();
  changeBaseColors();
  fill(c2); //... und für den nächsten splash benutzen
  drawSplash(mouseX+(int)random(-40, 40), mouseY+(int)random(-40, 40), (int) random(40, 80));
}

void drawPattern2() {
  strokeWeight(6);
  rectMode(CENTER);
  changeBaseColors();
  stroke(c2);
  fill(c2, 100);
  rect(mouseX, mouseY, mouseX/3, mouseY/3);
}

void drawPattern3() {
  rectMode(CORNER);
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);
  strokeWeight(10);
  color c = getRandomColor();
  stroke(c);
  line(frameCount*10%width, 0, noise(float(frameCount*10%width)/100)*width, height);
}

void drawPattern4() {
  fill(map(mouseX,0,width,0,255),50);
  rectMode(CORNER);
  rect(0, 0, width, height);
  float angle = -map(frameCount%100,0,100,0,PI);
  float radius = 100;
  changeBaseColors();
  fill(c2);
  noStroke();
  for (int i=0; i<8;i++) {
    radius = 60+i*40-i*i*3;
    angle+=0.2;
    for (int j=0; j<8;j++) {
      angle+=PI*2/8;
      float x = width/2 +cos(angle)*radius;
      float y = height/2 + sin(angle)*radius;
      ellipse(x, y, 35-i*4, 35-i*4);
    }
  }
}

void drawSplash(int x, int y, int size) {
  ellipse(x, y, size, size);  //Kreis zeichnen
  int chance = 80;
  while (random (100)<chance && size > 3) {  //Abbruchkriterium. WICHTIG - verhindert infinite loop des rekursiven Aufrufs
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

void changeBaseColors() {
  if (random(10)<3) {  //neue Farbe ins Spiel bringen
    c2 = c1; 
    c1 = getRandomColor();
  } 
  c2 = lerpColor(c1, c2, random(0.2, 0.8));  //Farbe zwischen c1 und c2 finden
}



