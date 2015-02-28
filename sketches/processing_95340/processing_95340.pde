
ArrayList <Bibitte> bibitteList;

int timeStamp;

PImage[ ] tableauImages;

void setup() {
  size(400, 400);
  smooth();


  bibitteList = new ArrayList();

  Bibitte b = new Bibitte(150, 150, color(255, 0, 255));

  bibitteList.add(b);

  tableauImages = new PImage[ 4 ];

  for ( int i =0 ; i < tableauImages.length ; i++ ) {
    tableauImages[i] = loadImage("Alex_00"+i+".png");
  }
}


void draw() {
  background(100);


  if (millis() - timeStamp >= 1000 ) {
    timeStamp = millis();

    Bibitte b = new Bibitte(random(width), random(height), color(255, 0, 255));
    bibitteList.add(b);
  }

  for ( int i =0; i < bibitteList.size() ; i++ ) {
    Bibitte b = bibitteList.get(i);
    b.draw();
  }
}


void mousePressed() {


  for ( int i = bibitteList.size() -1; i >= 0  ; i-- ) {
    Bibitte b = bibitteList.get(i);
    float distance = dist(mouseX, mouseY, b.x, b.y);
    if ( distance < 15 ) {
      bibitteList.remove(i);
    }
  }
}


class Bibitte {
  // Variables / Attributs
  float x;
  float y;
  color c;

  // Constructeur
  Bibitte ( float _x, float _y, color _c ) {

    x = _x;
    y = _y;
    c = _c;
  }

  // Fonctions / Méthodes
  void draw() {
    x = x + random(-2, 2);
    y = y + random(-2, 2);

    tint(255, 127);
    imageMode(CENTER);
    image( tableauImages[ int(frameCount*0.01) % tableauImages.length  ], x, y, 70, 70);
  }
}



