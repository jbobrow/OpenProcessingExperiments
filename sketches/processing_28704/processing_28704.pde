
void setup() {
  size(640,480);
  background(255);
  smooth();
}

float AleaX;
float AleaY;
float AleaCol;
float AleaSize;


void draw() {
AleaX = random(640);
AleaY = random(480);
AleaSize = random(5, 25);
color AleaCol=color(random(255),random(255),random(255),random(0,50));


fill(AleaCol);
noStroke();
ellipse(AleaX, AleaY, AleaSize, AleaSize);

}



