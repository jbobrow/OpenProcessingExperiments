
/**
 * Width and Height. 
 * 
 * The 'width' and 'height' variables contain the width and height 
 * of the display window as defined in the size() function. 
 
 *    Übungsaufgabe an der FH-Mainz
 *    Siimple Modifikation von vorhanden Beispielen
 *    von Paul Schneider 
 *
 *    betreut von: fjenett 20071010
 */
 

size(400, 400);
smooth();

  background(0);
  for(int i=0; i<height; i+=20) {
    stroke(i);
   // links utnen
   line(i, 0, 0, height); 
   // links oben
   line(0, 0, width,i);
   // rechts oben
   line(width, 0, width-i, height);
    // rechts unten
   line(width, height, 0, height-i);
}


