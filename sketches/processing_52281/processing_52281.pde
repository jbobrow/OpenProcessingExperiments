
void setup() {
  size(400, 400);
  fill(0);
  smooth();
}

void draw() {
  background(255);
  int anzahl = 30;

  for (int reihe=0; reihe<anzahl; reihe++) {
    
      for (int spalte=0; spalte<anzahl; spalte++) {

        float x = spalte*width/anzahl + width/anzahl/2;
        float y = reihe*height/anzahl + height/anzahl/2;
        
        float durchmesser = dist(x,y,mouseX,mouseY) / width * 30;        
        ellipse(x,y, durchmesser, durchmesser);

      }

  }
}


