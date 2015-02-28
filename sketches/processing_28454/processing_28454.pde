
// Daria Kovacs_Mut_Angst

void setup() { // Groessen, die immer vorhanden und bleiben
size (450, 320);
}

void draw() {
  background(255);

  for(int y = 220; y <= 450; y = y + 1){ 
   fill(55, 50);
   line(450, y, mouseX, mouseY);  
  }
    for(int x = -200; x <= 120; x = x + 10){ 
   fill(155, 100); 
   ellipse(0, x, mouseX, mouseY);      
  } 

  if (mousePressed) {
    // zeichne eine ellipse an der Mausposition
    line (mouseX, mouseY,20, 90);
  }  

}




