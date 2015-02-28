
int prevX = 0;
int prevY = 0;
int ctr1 = 2;
int ctr2 = 4;
int distance = 6;
int strokeMod = 0;
int strokeMod2 = 20;
int strokeMod3 = 0;
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


    // Periodically draws filled ellipses around mouse location
    if (ctr2 % 20 == 0) {
      if (ctr2 % 40 == 0) {
        fill(strokeMod, strokeMod2, strokeMod2);
        ellipse(mouseX + ctr2, mouseY, 20, 20);
        ellipse(mouseX - ctr2, mouseY, 20, 20);
        ellipse(mouseX , mouseY + ctr2, 20, 20);
        ellipse(mouseX , mouseY - ctr2, 20, 20);
        noFill();
      } else {
        fill(strokeMod, strokeMod2, strokeMod2);
        ellipse(mouseX + ctr2, mouseY + ctr2, 20, 20);
        ellipse(mouseX + ctr2, mouseY - ctr2, 20, 20);
        ellipse(mouseX - ctr2, mouseY + ctr2, 20, 20);
        ellipse(mouseX - ctr2, mouseY - ctr2, 20, 20);
        noFill();
      }
      if (ctr2 > 280) {
        ctr2 = 0;
      }
    }
           


    

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
  strokeMod++;
  strokeMod2++;
  strokeMod3++;
  if (strokeMod == 360) {
    strokeMod = 0;
  }
  if (strokeMod2 == 500) {
    strokeMod2 = 0;
  }
  if (strokeMod3 == 300) {
      strokeMod3 = 40;
  }

}



