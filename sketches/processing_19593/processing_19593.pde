
PFont bob, kelly;
String AJ = "L6A 1J3";
float X, Y;
void setup() {
  size(250,250);
  background(0,75,200);
  smooth();
  bob = createFont("Big Caslon", 50);
  kelly = createFont("Helvetica",50);
}

void draw() {
  fill(0,75,200,50);
  rect(-5,-5,260,260);
  if (mousePressed) {
    textFont(bob);
    fill(200,75,0);
    text(AJ,mouseX++,mouseY);
 
  }
 X = random(width);
 Y = random(height);
     textFont(kelly);
    fill(0,75,75);
    text(AJ,X,Y);
}


