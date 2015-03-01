
int howMany = 10;
int[] posX = new int[howMany];
int[] posY = new int[howMany];
int diameter = 60;

void setup(){
  size(1000,800);
  for (int i = 0; i < howMany; i++){ //assign each of the positions, so we have randomly arranged ellipses before we start
   posX[i] = (int)random(width);
   posY[i] = (int)random(height);
  }
  noStroke();
}
void draw(){
  background(0);
  for(int i = 0; i < howMany; i++){ //draw each of the ellipses
   ellipse(posX[i] , posY[i], diameter, diameter);
  }
  
}

void mouseDragged(){ //start using the mouse position if the cursor is dragged and its close enough
  println("ZE MOUSE IS BEING DRAGGED");
 for ( int i = 0; i < howMany; i++){ //using a for loop, so we can check for each position in the array
   if (dist( mouseX, mouseY, posX[i], posY[i]) < diameter / 2){ //check to make sure the cursor is close enough to the ellipse
     posX[i] = mouseX;
     posY[i] = mouseY;
   } 
 }
  
}

