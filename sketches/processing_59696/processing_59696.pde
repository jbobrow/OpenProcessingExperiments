
// Funktion void setup wird beim start des Programms ausgeführt
void setup() {
  size(200,200);
  smooth();
  background(50);
  frameRate(60);
  rectMode(CENTER);
  noStroke();
}


//void draw wird 60 mal/sekunde ausgeführt
void draw() {
  
  background(50);
  fill(255); //Alphawerte unter 5 machen Probleme!!!
  rect(width/2, height/2, 50, 50);
  ellipse(mouseX, mouseY, 50, 50);
}
