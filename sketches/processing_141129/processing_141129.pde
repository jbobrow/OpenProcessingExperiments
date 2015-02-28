
//Copyright Leslie Bloomfield 2014 lbloomfi HW#8


final int max = 50;

float [ ] valuesX;
float [ ] valuesY;
float [ ] deltaX;
float [ ] deltaY;

color [ ] colors;

void setup( ) {
  size(600, 400);
  frameRate(24);
  noStroke();
  smooth();
  
  valuesX = new float[max];
  initFloatArray(valuesX, 10, width);
  
  valuesY = new float[max];
  initFloatArray(valuesY, 10, height);
  
  deltaX = new float[max];
  initFloatArray(deltaX, 1, 20);
  
  deltaY = new float[max];
  initFloatArray(deltaY, 5, 10);
  
  colors = new color[max];
  initColor(colors);
}

void initFloatArray (float[]anyFloatArray, int minVal, int maxVal) {
  for(int i = 0; i < anyFloatArray.length; i++){
    anyFloatArray[i] = int(random(minVal, maxVal));
    }
}

void initColor(color[]anyColor){
   for(int i = 0; i < anyColor.length; i++){
    anyColor[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(0);
  drawFigures();
  moveFigures();
}

void drawFigures() {
  for(int i = 0; i < max; i++) {
    fill(colors[i]);
    if (i %2 == 0) {
      pushMatrix();
      translate(valuesX[i], valuesY[i]);
      rotate(PI/4);
      ellipse(0, 0, deltaX[i], deltaY[i]);
      popMatrix(); 
      
      pushMatrix();
      translate(valuesX[i], valuesY[i]);
      rotate(-PI/4);
      ellipse(0, 0, deltaX[i], deltaY[i]);
      popMatrix();   
    }
    else {
      ellipse(valuesX[i], valuesY[i], deltaX[i], deltaY[i]);
    }
  }
}


   



void moveFigures() {
  for(int i = 0; i < deltaX.length; i++) {
    valuesX[i] += deltaX[i];
    valuesY[i] += deltaY[i];
    
    if(valuesX[i] + deltaX[i] > width || valuesX[i] < 0) {
      deltaX[i] = -deltaX[i];
    }
    
    if(valuesY[i] + deltaY[i] > height || valuesY[i] < 0) {
      deltaY[i] = -deltaY[i];
    }
  }
}


  
   



void keyPressed() {
if (key == ' ') {
   
     }
  else {
    exit();
  }
}



