
ArrayList <Dot> dots;
int menge = 25;

void setup() {
  size(500, 500);
  dots = new ArrayList();
  for (int i=0;i<menge;i++) {
    dots.add(new Dot());
  }
}

void draw() {
  if (mousePressed) {
    fill(255, 10);
    rect(0, 0, width, height);
    for (int i=0;i<menge;i++) {
      dots.get(i).moveDot();
      dots.get(i).checkEdges();
      dots.get(i).displayDot();
    }
    //filter(BLUR,1);

    drawLines();
  }
}
void drawLines() {
  Dot  p1;
  Dot  p2;
  float dis;
  //vergleich alle mit allen
  for (int i=0; i<dots.size(); i++) {
    p1 = dots.get(i);
    for (int j=i+1;j<dots.size(); j++) {
      p2=dots.get(j);
      dis = dist(p1.koordinaten.x, p1.koordinaten.y, p2.koordinaten.x, p2.koordinaten.y);
      if (dis < 100 ) {
        if (i%2 == 0)stroke(0, random(255));
        else stroke(255, random(255));
        strokeWeight(random(10));
        line (p1.koordinaten.x, p1.koordinaten.y, p2.koordinaten.x, p2.koordinaten.y);
      }
    }
  }
}

 /*String timestamp() {
  String s = "";
  //nf wandelt zahlen in Strings um und berücksichtigt die Anzahl der Zeichenkettelänge
  s +=nf(year(), 4);
  s +=nf(month(), 2);
  s +=nf(day(), 2);
  s +="_";
  s +=nf(hour(), 2);
  s +=nf(minute(), 2);
  s +=nf(second(), 2);
  return s;
}
void keyPressed() {
 if ( key == 's') {
    String savePath = "export/";
    savePath = savePath + timestamp();
    savePath += ".png";
    saveFrame(savePath);
  }
}
*/
class Dot {
  PVector koordinaten;
  PVector richtung;
  float tempo;
  float groesse;
  color farbe;
  float winkel;


  Dot() {
    koordinaten = new PVector((int)random(width), (int)random(height), (int)random(-height/2, height/2));
    groesse = random(100);
    winkel = random (TWO_PI);
    richtung = new PVector (cos (winkel), sin (winkel));
    tempo = random (2, 8);
    farbe = color(random(255), random(255), random(255));
  }
  void moveDot () {
    koordinaten.add (getVelocity ());
  }

  PVector getVelocity () {
    PVector velocity = new PVector (richtung.x * tempo, richtung.y * tempo);
    return velocity;
  }

  void checkEdges () {
    if (koordinaten.x < groesse/2)
    {
      koordinaten.x = groesse/2;
      richtung.x = richtung.x * -1;
    }
    else if (koordinaten.x > width-groesse/2) 
    {
      koordinaten.x = width-groesse/2;
      richtung.x = richtung.x * -1;
    }

    if (koordinaten.y < groesse/2)
    {
      koordinaten.y = groesse/2;
      richtung.y = richtung.y * -1;
    }
    else if (koordinaten.y > height-groesse/2) 
    {
      koordinaten.y = height-groesse/2;
      richtung.y = richtung.y * -1;
    }
  }

  void displayDot() {
    fill(farbe, random(25));
    noStroke();
    ellipse(koordinaten.x, koordinaten.y, groesse, groesse);
  }
}



