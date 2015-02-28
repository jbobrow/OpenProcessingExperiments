
size(765, 765);
background (255);
// aktiviere Kantenglättung
smooth ();
// deaktiviere outlines
noStroke ();

// führe die Schleife aus bis die Zählvariable "diameter" 
// einen Wert erreicht der kleiner als 0 ist. Verringere dabei 
// ihren Wert nach jedem Durchgang um 12.





for (int diameter=255; diameter > 0; diameter = diameter - 1) {
  // setze die Füllfarbe neu

  // zeichne den Kreis mit variablem Durchmesser

    for(float y = 127.5; y<= height; y = y + 255) {
    for(float x = 127.5; x <= width; x = x + 255) {
      fill (diameter);
      ellipse (x, y, diameter, diameter);
      ellipse (x, y, diameter, diameter);
    }
  }
}

