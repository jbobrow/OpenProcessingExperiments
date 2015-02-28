
int[] arrayPosY; 
int[] arrayPosX; 

void setup() {
  size(500, 500); 
  arrayPosY = new int[4]; 
  arrayPosX = new int[4]; 

  arrayPosY[0] = 75; 
  arrayPosY[1] = 150;
  arrayPosY[2] = 250; 
  arrayPosY[3] = 325; 

  arrayPosX[0] = 100;
  arrayPosX[1] = 100;
  arrayPosX[2] = 100;
  arrayPosX[3] = 100;
}

void draw() {
  background(255); 

  for (int i = 0; i < 4; i++) 
  { 
    fill(255); 
    if (mouseX > arrayPosX[i] && mouseX < arrayPosX[i] + 50 && mouseY > arrayPosY[i] && mouseY < arrayPosY[i] + 50) 
    { 
      fill(255, 0, 0); 
      arrayPosX[i] = arrayPosX[i] + 2;
    }
    rect(arrayPosX[i], arrayPosY[i], 50, 50);
  }
}
