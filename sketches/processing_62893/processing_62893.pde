
int counter;

int breite = 50;
 
void setup() {
  size(300, 300);
}
 
void draw() {
  for (int x = 0; x < 300; x++) {
    fill(255);
 
    if (x %2 == 0) {
      fill(0);
    }
    rect(x * breite, 0, breite, breite);
    rect(x * breite, 100, breite, breite);
    rect(x * breite, 200, breite, breite);
  
    
  }
   for (int x = 0; x < 300; x++) {
    fill(0);
 
    if (x %2 == 0) {
      fill(255);
    }
    rect(x * breite, 50, breite, breite);
    rect(x * breite, 150, breite, breite);
    rect(x * breite, 250, breite, breite);
  
    
  }
}
