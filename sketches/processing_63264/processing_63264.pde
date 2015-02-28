
void setup() {
  size(500,700);
  smooth();
 
}

void draw() {
  background(0);
  noStroke();
  fill(300,333,42);
  //bewegter Kreis
  ellipse(mouseX,mouseY,mouseY,mouseY);
  
  //farbe fester Kreis
  fill(mouseX,mouseY,mouseX);
  ellipse(200,200,200,200);
  
  //rechtecke
noFill();
stroke(255);
rect(10,134,235,13);
rect(20,234,35,mouseY);
rect(mouseX,334,235,13);
rect(40,434,235,13);
rect(50,534,mouseY,13);
rect(60,mouseX,mouseX,13);
rect(70,734,235,13);

}

void keyPressed() {
   saveFrame("jazz.png");
}


