
int breite = 50;
 
void setup() {
  size(300, 300);
}
 
void draw() {
  
  //erste zeile
  for (int x = 0; x < 300; x++) {
    fill(255);
 
    if (x %2 == 0) {
      fill(0);
    }
    rect(x * breite, 0, breite, breite);
  }
  
  //zweite zeile
  for (int x = 0; x < 300; x++) {
    fill(0);
 
    if (x %2 == 0) {
      fill(255);
    }
    rect(x * breite, 50, breite, breite);
  }
  
  //dritte z. 
    for (int x = 0; x < 300; x++) {
    fill(255);
 
    if (x %2 == 0) {
      fill(0);
    }
    rect(x * breite, 100, breite, breite);
  }
  
  //vierte z.
  for (int x = 0; x < 300; x++) {
    fill(0);
 
    if (x %2 == 0) {
      fill(255);
    }
    rect(x * breite, 150, breite, breite);
  }
  
  //fünfte z.
    for (int x = 0; x < 300; x++) {
    fill(255);
 
    if (x %2 == 0) {
      fill(0);
    }
    rect(x * breite, 200, breite, breite);
  }
  
  //letzte z.
    for (int x = 0; x < 300; x++) {
    fill(0);
 
    if (x %2 == 0) {
      fill(255);
    }
    rect(x * breite, 250, breite, breite);
  }
  
}

