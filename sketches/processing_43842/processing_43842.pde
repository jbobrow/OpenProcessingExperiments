
void setup() {
  // Controls page size
  size(500, 500);
}


void draw() {
  // Setting Defaults
  smooth();
  noStroke();

/*
  // Color R G B
  float cR = 0;
  float cG = 0;
  float cB = 0;

  for (float yCount = 0; yCount <255; yCount++) {
    for (float xCount = 0; xCount < 255; xCount++) {
      cR += 1;
      fill (cR, cG, cB);
      rect(xCount, yCount, 2, 2);
    }
    cR -= 255;
    cG += 1;
    cB += 1;
  }
*/
  
  
/*
  // Color C M Y K
  float cC = 0;
  float cM = 0;
  float cY = 0;
  float cK = 0;

  for (float yCount = 0; yCount <255; yCount++) {
    for (float xCount = 0; xCount < 255; xCount++) {
      cC += 1;
      fill (cC, cM, cY, cK);
      rect(xCount, yCount, 2, 2);
    }
    cC -= 255;
    
    cM += 1;
    cB += 1;
  }
*/
  
  // Color H S B
  colorMode(HSB, 100);
  float cH = 0;
  float cS = 0;
  float cB = 0;
  float cBoxSize = 500;

  for (float yCount = 0; yCount < cBoxSize; yCount+=(cBoxSize/100)) {
    for (float xCount = 0; xCount < cBoxSize; xCount+=(cBoxSize/100)) {
      cS += 1;
      fill ((mouseY/(cBoxSize/100)), cS, cB);
      rect(xCount, yCount, (cBoxSize/100), (cBoxSize/100));
    }
    cS -= 100;
    cB += 1;
  }
}


// Don't touch anything below this line!!! SERIOUSLY GUYS!!!
void mouseClicked() {
  println ("Mouse X Position: "+ mouseX +", Mouse Y Position: " + mouseY);
}

