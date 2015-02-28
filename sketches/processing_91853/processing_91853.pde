
int prevX = 0;
int prevY = 0;
int ctr1 = 2;
int ctr2 = 4;
int distance = 6;
int strokeMod = 0;
int strokeMod2 = 20;
int strokeMod3 = 0;
boolean toggle = true;
boolean toggle2 = true;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0);
  noFill(); 
}

void draw() {
  
    
  if (prevX == mouseX && prevY == mouseY) {
    
    stroke(strokeMod, strokeMod2/2, strokeMod3/2);
    
    // Creates 4 beziers and an ellipse whose parameters vary with mouse 
    // location and time.
    bezier(mouseX, mouseY, 
           ctr1, ctr1, 
           500 - ctr1, 500 - ctr1, 
           mouseX + distance , mouseY - distance);
    bezier(mouseX, mouseY, 
           -ctr1, mouseY + ctr1, 
           mouseX + ctr1, -ctr1, 
           mouseY + distance, mouseX - distance);
    bezier(mouseX, mouseY, 
           mouseX - ctr1, ctr1, 
           ctr1, mouseY - ctr1, 
           mouseY + distance, mouseY + distance);
    bezier(mouseX, mouseY, 
           -ctr1, -ctr1, 
           -ctr1, -ctr1, 
           mouseX , mouseY + distance);
    bezier(mouseX, mouseY, 
           -ctr1, -ctr1, 
           -ctr1, -ctr1, 
           mouseX + distance , mouseY - distance);
    ellipse(mouseX, mouseY, ctr1, ctr1);           


    

    // Increments variables    
    ctr1++; 
    ctr2++;
    distance++;

  } else {
    
    // Resets variables when mouse location changes
    prevX = mouseX;
    prevY = mouseY;
    ctr1 = 2;
    ctr2 = 4;
    distance = 6;
    
  }


  // Increments variables that control color on the HSB color scale
  if (toggle == true) {
    strokeMod2++;
  } else {
    strokeMod2--;
  }
  if (toggle2 == true) {
    strokeMod3++;
  } else {
    strokeMod3--;
  }

  strokeMod++;
  if (strokeMod == 360) {
    strokeMod = 0;
  }
  if (strokeMod2 >= 500) {
    toggle = false;
  }
  if (strokeMod2 <= 0) {
    toggle = true;
  }
  if (strokeMod3 >= 500) {
    toggle2 = false;
  }
  if (strokeMod3 <= 0) {
    toggle2 = true;
  }

}



