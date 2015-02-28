
// X - Werte
int xLeft = 10;
int xMiddle;
int xRight = 390;

// Y - Werte
int yTop = 10;
int yMiddle;
int yBottom = 390;



void setup() {
  frameRate(2);
  size(400, 400);
  background(120,200,185);
  smooth();
  
  xMiddle = width/2;
  yMiddle = width/2;
}


void draw() {
  stroke(255);
  strokeWeight(2);
  
  float randomX = random(50,350);
  float randomY = random(50,350);
  
  // Linien oben
  line(xLeft, yTop, randomX, randomY);
  line(xMiddle, yTop, randomX, randomY);
  line(xRight, yTop, randomX, randomY);
  
  // Linien in der Mitte
  line(xLeft, yMiddle, randomX, randomY);
  line(xRight, yMiddle, randomX, randomY);
  
  // Linien unten
  line(xLeft, yBottom, randomX, randomY);
  line(xMiddle, yBottom, randomX, randomY);
  line(xRight, yBottom, randomX, randomY);
}

void mousePressed(){
  background(random(250), random(250), random(255));
}

void keyPressed(){
  saveFrame("Zeichenautomat.png");
}

