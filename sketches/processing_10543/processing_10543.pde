
class Controller {
  float x1, x2, y1, y2;
  float perfo;
  int breite = width/2;
  int hoehe = height/2;
  boolean[] zufall = new boolean[12];
  String[] beschriftung = {"Size", "Duration", "Speed", "Color / Sound", "Direction", instruments[0]+" Type", "Motion > Size", "Motion > Direction", "Motion > Pitch", "Motion > Volume"};
  
  Controller() {
    perfo = map(performance, 1, 100, 0, 300);
  }
  
  void init() {
    x1 = (mouseX < width/2) ? mouseX : mouseX-breite;
    x2 = x1+breite;
    y1 = (mouseY < height/2) ? mouseY : mouseY-hoehe;
    y2 = y1+hoehe;
    beschriftung[5] = instruments[aktuellInstrument]+" Type";
  }
  void initForKey() {
    x1 = width/4;
    x2 = 3*width/4;
    y1 = height/4;
    y2 = 3*height/4;
    beschriftung[5] = instruments[aktuellInstrument]+" Type";
  }
  
  void saveAndExit() {
    controllON = false;
  }
  
  void setPerformance() {
    performance = round(map(mouseX, x1+10, x1+310, 1, 100));
    perfo = map(performance, 1, 100, 0, 300);;
  }
  
  void zeichnen() {
    rectMode(CORNER);
    fill(90, 85);
    rect(x1, y1, breite, hoehe);
    rect(x1+breite-20, y1, 20, 20);
    line(x2-18, y1+2, x2-2, y1+18);
    line(x2-18, y1+18, x2-2, y1+2);
    // Anzahl
    rect(x1+10, y1+50, 300, 10);
    fill(50, 85);
    rect(x1+10, y1+50, perfo, 10);
    fill(90, 85);
    // Banden
    rect(x1+330, y1+50, 10, 10);
    if(banden) {
      fill(50, 85);
    }
    rect(x1+330, y1+50, 10, 10);
    fill(90, 85);
    // Zufall
    int anzahl = realTones ? 6 : 10;
    for(int i=0;i<anzahl;i++) {
      float xPosition = 0, yPosition = 0;
      fill(0);
      if(i<6) {
        xPosition = x1+10;
        yPosition = y1+95+i*20;
        text(beschriftung[i], x1+30, y1+105+i*20);
      } else if(i<12) {
        xPosition = x1+breite/2+10;
        yPosition = y1+95-6*20+i*20;
        text(beschriftung[i], x1+30+breite/2, y1+105+i*20-6*20);
      }
      fill(90, 85);
      if(zufall[i]) {
        fill(50, 85);
      }
      rect(xPosition, yPosition, 10, 10);
      fill(90, 85);
    }
    fill(0);
    text("Options", x1+5, y1+15);
    text("Border:", x1+330, y1+45);
    text("Number of Elements: "+performance, x1+10, y1+45);
    text("Random values: ", x1+10, y1+85);
  }
}

