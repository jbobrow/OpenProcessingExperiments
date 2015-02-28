
// muster nachzeichnen per processing
// bestehend aus 4 schleifen
// immer auf der x achse um faktor (breite / 4) versetzt

size (600,600);
background(255);
float sx = 0; // start x wert
float sy = height/4; // segmente - jeweils immer 4er gruppen
float faktor = 0; // faktor um den es erhört werden soll, am anfang 0
float space = width/4; // space = versatz horizontal um jeweils ein viertel
smooth();

// raster zeichen, kariertes feld
for (int i = 0; i < 4; i++) {
  line (0,sy+faktor,width,sy+faktor); // horizontalte linien
  line (space*i,0,space*i,height);// vertikale linien
  faktor += height/4;
}

// horizontale hälften
for (float ii = 0; ii < height; ii+=sy/2) {
   line (space,0+ii,width,0+ii);
}

// horizontale viertel
for (float z = 0; z < height; z+=sy/4) {
   line (space*2,0+z,width,0+z);
}

// horizontale achtel
for (float zi = 0; zi < height; zi+=sy/8) {
   line (space*3,0+zi,width,0+zi);
}

// und zum schluss noch ein schönen rahmen drum
// und fertig ist das bild
noFill();
strokeWeight(10);
rect (0,0,width,height);

