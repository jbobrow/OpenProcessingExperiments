
String[] bezirke;
int[] zugezogene;
int[] weggezogene;
float[] fluktuation;
PFont schrift;
boolean firstView = true;


void setup() {

  smooth();

  // Schrift wählen und laden
  schrift = loadFont("Helvetica.vlw");
  textFont(schrift);

  String[] zeilen = loadStrings("input_clean_sorted.csv");
  // Arrays für gelesene Daten erstellen
  bezirke = new String[zeilen.length];
  zugezogene = new int[zeilen.length];
  weggezogene = new int[zeilen.length];
  fluktuation = new float[zeilen.length];

  // Zeilen in Tokens trennen und in den zugehörigen Arrays speichern
  for (int i = 0; i < zeilen.length; i++) {
    String[] spalten = splitTokens(zeilen[i], ";");
    spalten[0] = spalten[0].trim();

    // Werte auslesen
    bezirke[i] = spalten[0];
    zugezogene[i] = int(spalten[1]);
    weggezogene[i] = int(spalten[2]);

    String[] floats = new String[2];
    floats[1] = "0";
    if (spalten[7].contains(",")) {
      floats = splitTokens(spalten[7], ",");
    }
    else {
      floats[0] = spalten[7];
    }
    String value = floats[0] + "." + floats[1];

    println(floats[0] + "." + floats[1]);


    fluktuation[i] = float(value);
  }
  size(8 * zeilen.length + 70, 800);

  // Hintergrund
  background(255);
  stroke(0);

  // Legende
  fill(180, 50, 50);
  rect(10, 14, 4, 4);
  fill(0);
  text("Zugezogene", 20, 20);

  fill(50, 180, 50);
  rect(10, 30, 4, 4);
  fill(0);
  text("Weggezogene", 20, 36);


  drawNames(0, zugezogene.length / 2, 150);
  drawNames(zugezogene.length / 2, zugezogene.length, 500);

  drawRects(0, zugezogene.length / 2, 150);
  drawRects(zugezogene.length / 2, zugezogene.length, 500);
}

void draw() {
}

void drawNames(int start, int end, int vertPos) {  
  for (int i = start; i < end; i++) {
    pushMatrix();
    translate(16 * (i - start) + 20, vertPos);
    rotate(radians(320));

    fill(0);
    text(bezirke[i], 0, 0);

    popMatrix();
  }
}

void drawRects(int start, int end, int vertPos) {  
  for (int i = start; i < end; i++) {
    fill(180, 50, 50);
    rect(16 * (i - start) + 16, vertPos + 3, 4, map(zugezogene[i], 0, 3000, 0, 200));
    fill(50, 180, 50);
    rect(16 * (i - start) + 20, vertPos + 3, 4, map(weggezogene[i], 0, 3000, 0, 200));
  }
}

void drawRatio(int start, int end, int vertPos) {
  fill(0);
  text("100%", 20, vertPos + 200);
  line(0, vertPos + 203, width, vertPos + 203);
  for (int i = start; i < end; i++) {
    fill(50, 50, 180);
    rect(16 * (i - start) + 14, vertPos + 3, 8, map(fluktuation[i], 0, 100, 0, 200));
  }
}

void mouseClicked() {
  background(255);
  drawNames(0, zugezogene.length / 2, 150);
  drawNames(zugezogene.length / 2, zugezogene.length, 500);


  if (firstView) {
    // Legende
    fill(50, 50, 180);
    rect(10, 14, 4, 4);
    fill(0);
    text("Fluktuationsrate", 20, 20);

    drawRatio(0, zugezogene.length / 2, 150);
    drawRatio(zugezogene.length / 2, zugezogene.length, 500);
  }

  else {
    // Legende
    fill(180, 50, 50);
    rect(10, 14, 4, 4);
    fill(0);
    text("Zugezogene", 20, 20);

    fill(50, 180, 50);
    rect(10, 30, 4, 4);
    fill(0);
    text("Weggezogene", 20, 36);
    
    drawRects(0, zugezogene.length / 2, 150);
    drawRects(zugezogene.length / 2, zugezogene.length, 500);
  }

  firstView = !firstView;
}


