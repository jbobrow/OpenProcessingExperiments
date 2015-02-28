
PImage img;
float nSpacing = 0.01; //wie eng die noise-funktion gesampelt wird
color c;
float n;
float nc;
float scaleSlope = 0.2; //wie sehr die Ränder der Karte nach unten gezogen werden --> Wasser am Rand.  
//float scaleSlope = 0;  //ohne scaleSlope gibt es Festland mit Seen
int lod = 4;  //s. noiseDetail - die Anzahl der Oktaven
float falloff = 0.5; //s. noiseDetail - die Gewichtung der Oktaven


void setup() {
  size(400, 400);  
  img = createImage(width, height, RGB);  //hier werden die errechneten Pixel eingefüllt
  frameRate(20);
  colorMode(HSB, 100);
  noiseDetail(lod, falloff);
  redraw();
}

void draw(){
  //hier passiert zwar nichts, aber ohne draw() werden auch neue Tastatur- oder Mauseingaben nicht registriert
}

void redraw() {
  //loop über alle pixel im bild
  for (int i=0; i<img.width; i++) {
    for (int j=0; j<img.height; j++) {
      n = noise(i*nSpacing, j*nSpacing); //der noise-Wert an der entsprechenden Stelle
      //hier wird von etwas abgezogen, und zwar um so mehr, je näher der Rand der Karte ist -> die Pixel am Rand bekommen niedrige nc-Werte
      nc=n-(pow(map(i, 0, width, -2, 2), 2)+pow(map(j, 0, height, -2, 2), 2))*scaleSlope;
      if (nc<0.3) {
        c = color(65-n*10, 100, 100); //für kleine nc-Werte blaue Farben -> Wasser
      } 
      else {
        c = color(-3+nc*70, 80, 100-(nc-0.4)*200); //für grosse nc-Werte gelb bis grün und etwas dunkler
      }
      img.set(i, j, c); //die Farbe für dieses Pixel speichern
    }
  }
  image(img, 0, 0); //Bild anzeigen
  text("lod: " + int(lod) + "; falloff: "+falloff, 10, 20); //Parameter anzeigen
}

//bei Mausklick wird eine neue Noise-funktion generiert --> andere Karte
void mousePressed() {
  nOffset = random(100);  
  //noiseSeed(int(random(100)));
  redraw();
}

//durch Tastendrucke können die beiden Parameter der Noise-Funktion beeinflusst werden
void keyPressed() {
  if (key == CODED) {
  if (keyCode == RIGHT) {
    falloff += 0.05;
  } 
  if (keyCode == LEFT) {
    falloff -= 0.05;
  } 
  if (keyCode == UP) {
    lod++;
  } 
  if (keyCode == DOWN) {
    lod--;
  }
  }
  if (key == ENTER || key == RETURN || keyCode==32) {
    nOffset = random(100);
    redraw();
  }
  falloff = constrain(falloff, 0.02, 0.8);
  lod = constrain(lod, 1, 8);
  noiseDetail(lod, falloff);
  redraw();
}


