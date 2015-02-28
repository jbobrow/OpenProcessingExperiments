
// einstellungen
size(600,600);
smooth();
fill(0);
int faktor = 10; // abstände, breiten, alles mögliche

// muster und go!
for (int i = 0; i < width/2; i+=10) {
  
  // linien zeichnen
  line (faktor+i,0,faktor+i,height); // bis mitte, fein gestreift
  line (faktor+i+i,0,faktor+i+i,height); // komplett durch, grob gestreift
  
  // rechtecke zeichnen bis mitte
  if (faktor+i*2 < width/2) {
    rect(faktor+i*2,faktor+i*2,faktor,faktor);
  } else  {
    rect(faktor+i*2,faktor+i*2,faktor+i+i,faktor);
  }
  
}



