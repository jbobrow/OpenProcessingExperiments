
int xPos;
int dia;
int velocity;
int[] circleX = new int[11];

void setup() {
  size (500, 500);
  background (255);
  smooth();
  
  for (int i=0; i<11; i++){
    circleX[i]= 50*i;
  }

  xPos = width/2;
  dia = 50;
  velocity = 5;

}

void draw () {
  xPos += velocity;
  background (255);  
  fill (100);

  if (xPos >= 500) {
   velocity=-velocity;

  }
  else if (xPos <= 0) {
    velocity=-velocity;
  }
    
  for (int i=0; i<11; i++){
  ellipse (xPos, circleX[i], dia, dia);
  }
}




