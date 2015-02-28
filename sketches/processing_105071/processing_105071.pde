
int xPos1;
int yPos1;
int dia1;
int velocity;

void setup() {
  size (500, 500);
  background (255);

  xPos1 = width/2;
  yPos1 = height/2;
  dia1 = 50;
  velocity = 5;
}

void draw () {
  xPos1 += velocity;
  background (255);  
  fill (100);

  if (xPos1 >= 500) {
   velocity=-velocity;
    println (xPos1);
  }
  else if (xPos1 <= 5) {
    velocity=-velocity;
  }
  ellipse (xPos1, yPos1, dia1, dia1);
}



