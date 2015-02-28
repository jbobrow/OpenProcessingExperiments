

size(900, 900);
background(0);

float rectSize = 50;
float gap = 0;

/* initials set at bottom left of the screen*/
float startX = rectSize/2 + gap;
float startY = (height/rectSize)*rectSize - rectSize/2 - gap;
float x = startX;
float y = startY;
int color_Incfactor = 5;

/*Put Rectangles to the half of the Matrix*/
int counterA = 0;    
while (y > 0) {  
  boolean isReachedSide = false;
  while (!isReachedSide) { //while not reached the bottom of screen
    fill(0 + counterA*color_Incfactor);
    noStroke();
    rectMode(CENTER);
    rect(x, y, rectSize, rectSize); 
    fill(255, 100);
    //text(counterA, x, y);

    /*Go diagonal direction*/
    x = x + rectSize + gap;
    y = y + rectSize + gap;

    /*Check if is it reached at bottom of screen*/
    if (y > height - rectSize/2 - gap) {
      isReachedSide = true;
    }
  }
  /* Arrange x coord and Decrease the y coordinate for the next diagonal rectangle array*/
  counterA = counterA + 1;
  x = startX;
  y = startY - (counterA*(rectSize+gap));
}

counterA = counterA - 1;

/*Put Rectangles to the other half of the Matrix*/
int counterB = 0;    
while (x <= (width - rectSize/2 - gap)) {  
  boolean isReachedSide = false;
  while (!isReachedSide) { //while not reached the bottom of screen
    fill(0 + (counterA +counterB)*color_Incfactor);
    noStroke();
    rectMode(CENTER);
    rect(x, y, rectSize, rectSize); 
    fill(255, 100);
    //text(counterA + counterB, x, y);

    /*Go diagonal direction*/
    x = x + rectSize + gap;
    y = y + rectSize + gap;

    /*Check if is it reached at bottom of screen*/
    if (x > width - rectSize/2 - gap) {
      isReachedSide = true;
    }
  }
  /* Arrange x coord and Decrease the y coordinate for the next diagonal rectangle array*/
  counterB = counterB + 1;
  x = startX + counterB*(rectSize+gap);
  y = rectSize/2 + gap;
}



