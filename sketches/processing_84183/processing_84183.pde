
float[] tm_data = {
  10,9,8,7,6,5,4,3,2,1
}; 
float[] tm_dataoriginal = {
  10,9,8,7,6,5,4,3,2,1
};  
// Grösse und Aussehen der Treemap definieren
int tm_width=500;
int tm_height=300;
int width=600;
int height=600;
int liniendicke = 2;
int randlinks = 50;
color hintergrund = color(89, 147, 213);
color linien = color(255, 255, 255);
color beschriftung = color(0, 0, 0);
// weitere Variablen definieren
float tm_restbreite=tm_width;
float tm_resthoehe=tm_height;
float tm_gesamtflaeche;
float tm_faktor;
int variante;

void setup() {
  size(600,600);
  background(255);
  legende();
  //Erste Treemap zeichnen
  treemap();
}

void draw() {
  if (keyPressed) {
    if (key == 'u') {
      tm_height=tm_height-5;
      if (tm_height<100) {
        tm_height=100;
      }
      cleardata();
      treemap();
    }
    else if (key == 'd') {
      tm_height=tm_height+5;
      if (tm_height>height) {
        tm_height=height;
      }
      cleardata();
      treemap();
    }
    else if (key == 'e') {
      exit();
    }
  }
}


void treemap() {
  //Hintergrund zeichnen
  fill(230);
  noStroke();
  rect(0+randlinks, 0, tm_width, tm_height);
  // Fläche der Treemap berechnen
  for (int i=0;i < tm_data.length;i++) {
    tm_gesamtflaeche = tm_gesamtflaeche + tm_data[i];
  }
  // Vergrösserung/Verkleinerung berechnen
  tm_faktor = tm_width*tm_height/tm_gesamtflaeche;
  stroke(linien);
  strokeWeight(liniendicke);
  for (int l=0; tm_data.length>0;l++) {
    if ((l%2)==0) {
      col();
    }
    if ((l%2)==1) {
      row();
    }
  }
}

void col() {
  float streifenflaeche;
  float[] streifenbreite = new float[tm_data.length];
  float[] proportion = new float[tm_data.length];
  // Flächen ausrechenn für 1 Rechteck, 2 Rechtecke, ... i Rechtecke
  for (int i=0;i<tm_data.length;i++) {
    streifenflaeche=0;
    for (int k=0;k<=i;k++) {
      streifenflaeche = streifenflaeche + tm_data[k];
    }
    // Streifenbreite berechnen
    streifenbreite[i] = streifenflaeche*tm_faktor/tm_resthoehe;
    // Proportion berechnen
    for (int k=0; k<=i;k++) {
      proportion[i] = proportion[i] + streifenbreite[i]/(tm_data[k]*tm_faktor/streifenbreite[i]);
    }
    proportion[i]=(abs(1-proportion[i]/(i+1)));
  }
  // die beste Variante auswählen
  variante = 0;
  for (int i=0;i<tm_data.length;i++) {
    if ((i>0) && (proportion[i]<proportion[i-1])) {
      variante = i;
    }
  }
  //Spalte zeichnen
  float tmpheight=0;
  for (int i=0;i<=variante;i++) {
    fill(hintergrund);
    rect(tm_width-tm_restbreite+randlinks, tm_height-tm_resthoehe-tmpheight, streifenbreite[variante], tm_data[i]*tm_faktor/streifenbreite[variante]);
    fill(beschriftung);
    text(tm_data[i], tm_width-tm_restbreite+2+randlinks, tm_height-tm_resthoehe-tmpheight+14);
    noFill();
    tmpheight = tmpheight - tm_data[i]*tm_faktor/streifenbreite[variante];
  }
  //Variablen aktualisieren
  tm_restbreite = tm_restbreite - streifenbreite[variante];
  tm_data=reverse(tm_data);
  for (int i=0;i<=variante;i++) {
    tm_data = shorten(tm_data);
  }
  tm_data=reverse(tm_data);
}

void row() {
  float streifenflaeche;
  float[] streifenhoehe = new float[tm_data.length];
  float[] proportion = new float[tm_data.length];
  // Flächen ausrechenn für 1 Rechteck, 2 Rechtecke, ... i Rechtecke
  for (int i=0;i<tm_data.length;i++) {
    streifenflaeche=0;
    for (int k=0;k<=i;k++) {
      streifenflaeche = streifenflaeche + tm_data[k];
    }
    // Streifenhöhe berechnen
    streifenhoehe[i] = streifenflaeche*tm_faktor/tm_restbreite;
    // Proportion berechnen
    for (int k=0; k<=i;k++) {
      proportion[i] = proportion[i] + streifenhoehe[i]/(tm_data[k]*tm_faktor/streifenhoehe[i]);
    }
    proportion[i]=(abs(1-proportion[i]/(i+1)));
  }
  // die beste Variante auswählen
  variante = 0;
  for (int i=0;i<tm_data.length;i++) {
    if ((i>0) && (proportion[i]<proportion[i-1])) {
      variante = i;
    }
  }
  //Reihe zeichnen
  float tmpwidth=0;
  for (int i=0;i<=variante;i++) {
    fill(hintergrund);
    rect(tm_width-tm_restbreite-tmpwidth+randlinks, tm_height-tm_resthoehe, tm_data[i]*tm_faktor/streifenhoehe[variante], streifenhoehe[variante]);
    fill(beschriftung);
    text(tm_data[i], tm_width-tm_restbreite-tmpwidth+2+randlinks, tm_height-tm_resthoehe+14);
    noFill();
    tmpwidth = tmpwidth - tm_data[i]*tm_faktor/streifenhoehe[variante];
  }
  //Variablen aktualisieren
  tm_resthoehe = tm_resthoehe - streifenhoehe[variante];
  tm_data=reverse(tm_data);
  for (int i=0;i<=variante;i++) {
    tm_data = shorten(tm_data);
  }
  tm_data=reverse(tm_data);
}

void cleardata() {
  //Bildschirm leeren
  size(width, height);
  background(255);
  //tm_data wiederherstellen
  for (int i=0; i<tm_dataoriginal.length;i++) {
    tm_data = append(tm_data, tm_dataoriginal[i]);
    tm_restbreite=tm_width;
    tm_resthoehe=tm_height;
    tm_gesamtflaeche=0;
    tm_faktor=0;
  }
}

void legende() {
  fill(0);
  text("Please click this window to activate it", 50, 350);
    text("then press 'u' or 'd' to change the proportions", 50, 370);
}


