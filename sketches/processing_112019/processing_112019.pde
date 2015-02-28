
int milli;
int offset = 3;
int row;
int hora;
String h;
String m;

color orange = color(255, 98, 0, 100);
color blue = color(0, 197, 255, 150);
void setup() {
  size(600, 600);
  noStroke();
  smooth();
}

void draw() {
  noStroke();

  // TURN MILITARY TIME INTO 12 HR TIME
  hora = hour() % 12;
  if (hora == 0) {
    hora = 12;
  }
  
  h = binary(hora);
  m = binary(minute());

  // BACKGROUND
  background(225);

  // SECONDS
  fill(210);
  triseconds(6);

  // HOURS
  stroke(blue);
  sqtime(width*.25, height*.3, width*.75, height*.125, 3, h, blue);
  
  // MINUTES
  stroke(orange);
  sqtime(width*.25, height*.45, width*.75, height*.05, 5, m, orange);
}

void triseconds(int pad) {
  int rows = second();
  if (rows == 0) { 
    rows = 1;
  }

  int twidth = (width - ((rows+1) * pad)) / rows; //triangle width
  int theight = (height - ((rows+1) * pad)) / rows; //triangle height

  for (int i = 0; i < second(); i++) {
    for (int j = 0; j < second(); j++) {
      milli = int(binary(millis()));
      pushMatrix();
      translate(j*(pad + twidth) + pad, i*(pad + theight) + pad);
      if (second() % int(random(1, 10)) == 0) {
        triangle(0, 0, twidth, 0, 0, theight);
      }
      popMatrix();
    }
  }
}

void sqtime(float x0, float y0, float x1, float y1, float pad, String s, color c) {
  float xmax = x1 - x0;
  float ymax = y1 - y0;
  float xwidth = (xmax - (pad*(s.length()-1))) / s.length();
  
  for (int i = 0; i < s.length(); i++) {
    noFill();
    pushMatrix();
    translate(x0 + i*(xwidth+pad), y0);
    if (int(s.substring(i, i+1)) == 0) {
      noFill();
    }
    else {
      fill(c);
    }
    rect(0, 0, xwidth, y1);
    popMatrix();
  }
}



