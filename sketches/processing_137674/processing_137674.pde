
//Assignment 3

/*
MOUSE 
position x : round size
position y : amount of shapes
drag : draw

KEYS
1-3 and "SPACE" : color palettes
DELETE/BACKSPACE : erase
s ; save png
*/

color[] palette = {#6B0174, #00D6FF, #DDCCFF, #FFF020, #FF0E4E, #60B1CC, #FFFFFF};

void setup() {
  size(800, 720);
  background(255);
}

void draw() {
  float r = random(1, 3);
  switch(key) {
  case '1':
    r = random(1, 3);
    break;
  case '2':
    r = random(3, 6);
    break;
  case '3':
    r = random(6);
    break;
  case ' ':
    r = random(6, 7);
    break;
  }

  if (mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    int bile = (int)map(mouseY+100, 0, height, 2, 16);
    int radius = mouseX-width/2;
    float angle = TWO_PI/bile;

    for (int i = 0; i <= bile; i++) {
      float x = 0 + sin(angle*i)*radius;
      float y = 0 + cos(angle*i)*radius;

      fill(palette[int(r)], 100);
      bezier(x, y, x-100, y-100, x+100, y-100, x, y);
      bezier(x+25, y, x-75, y-100, x+125, y-100, x+25, y);
    }
    popMatrix();
  }
}

void keyReleased() {
  if (key == BACKSPACE || key == DELETE) background(255);
  if (key == 's' || key == 'S') saveFrame("fatagrafija.png");
}



