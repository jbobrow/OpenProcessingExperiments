
int s = 400;
size(400, 400); //für web export darf man hier keine variablen verwenden
background(0);
strokeWeight(2);
colorMode(RGB,s); //der zweite Parameter bestimmt den Range der Kanäle, jetzt also Werte zwischen 0 und s
// draw points with colors
for(int i = 0; i < s; i++) {
  for(int j = 0; j < s; j++) {
    stroke(i,0,j); //rot & blau variieren
    point(i,j);
  }
}




