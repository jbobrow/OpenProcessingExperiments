
/* Define globals */
color bgFill = color(0,0,0);
int fillB = 5;
int fillR = 5;
int fillG = 5;
int frame = 0;

/* snow flake variables */
color flakeColor = color(255, 255, 255);
int nFlakes = int(random(30, 50));
int[] xFlakes = new int[nFlakes];
int[] yFlakes = new int[nFlakes];
int[] vFlakes = new int[nFlakes];
int[] sizeFlakes = new int[nFlakes];
int[] stateFlakes = new int[nFlakes];
int vMax = 1;
int sizeMin = 1;
int sizeMax = 10;
int margin = 30;

void setup(){
  size(600, 600);  
  frameRate(20);
  sizeMax = int(width * 0.03);
  sizeMin = int(width * 0.001);
  background(bgFill);
  noStroke();
  fill(flakeColor);
  for (int i = 0; i < nFlakes; i += 1){
     sizeFlakes[i] = int(random(sizeMin, sizeMax));
     xFlakes[i] = int(random(margin, width - margin));
     yFlakes[i] = int(random(margin, height - margin));
     vFlakes[i] = int(random(1, vMax));
     ellipse(xFlakes[i], yFlakes[i], sizeFlakes[i], sizeFlakes[i]);
     stateFlakes[i] = 0;
  }
}

/* snow animation */
void draw(){
  // change fill color based on frame no 
  if (frame <= 1000){
    int prevFillB = fillB;
    fillB = constrain(int(random(prevFillB - 5, prevFillB + 5)), 5, 60);
    fill(0, 0, fillB, 60);
  }
  else if (frame <= 2000){
    int prevFillR = fillR;
    fillR = constrain(int(random(prevFillR - 5, prevFillR + 5)), 5, 60);
    fill(fillR, 0, 0, 60);
  }
  else {
    int prevFillG = fillG;
    fillG = constrain(int(random(prevFillG - 5, prevFillG + 5)), 5, 60);
    fill(0, fillG, 0, 60);
  }
  rect(0, 0, width, height);
  fill(flakeColor, 190);
  /* draw the flakes based on their state */
  for (int i = 1; i < nFlakes; i++){
    if (stateFlakes[i] == 0){
      drawflakesy();
    }
    else if (stateFlakes[i] == 1){
      drawflakesxlt();
    }
    else if (stateFlakes[i] == 2){
      drawflakesyup();
    }
    else if (stateFlakes[i] == 3){
      drawflakesx();
    }
    else {
      println("Flakey.");
    }
    margin = int(random(width/10, width/8));
  }
  /* update flakes' state */
  updateflakes();
  /* save frame for animation */
  //saveFrame("output/snow-####.png");
  //frame += 1;
}

void drawflakesy(){
  for (int i = 0; i < nFlakes; i += 1){
    if (yFlakes[i] > height - margin){
      xFlakes[i] = int(random(margin, width - margin));
      yFlakes[i] = margin;
    }
    else{
      yFlakes[i] = yFlakes[i] + vFlakes[i];
    }
    ellipse(xFlakes[i], yFlakes[i], sizeFlakes[i], sizeFlakes[i]);
  }
}

void drawflakesx(){
  for (int i = 0; i < nFlakes; i += 1){
    if (xFlakes[i] > width - margin){
      xFlakes[i] = margin;
      yFlakes[i] = int(random(margin, height - margin));
    }
    else{
      xFlakes[i] = xFlakes[i] + vFlakes[i];
    }
    ellipse(xFlakes[i], yFlakes[i], sizeFlakes[i], sizeFlakes[i]);
  }
}

void drawflakesyup(){
  for (int i = 0; i < nFlakes; i += 1){
    if (yFlakes[i] < margin){
      xFlakes[i] = int(random(margin, width - margin));
      yFlakes[i] = height - margin;
    }
    else{
      yFlakes[i] = yFlakes[i] - vFlakes[i];
    }
    ellipse(xFlakes[i], yFlakes[i], sizeFlakes[i], sizeFlakes[i]);
  }
}

void drawflakesxlt(){
  for (int i = 0; i < nFlakes; i += 1){
    if (xFlakes[i] < margin){
      xFlakes[i] = width - margin;
      yFlakes[i] = int(random(margin, height - margin));
    }
    else{
      xFlakes[i] = xFlakes[i] - vFlakes[i];
    }
    ellipse(xFlakes[i], yFlakes[i], sizeFlakes[i], sizeFlakes[i]);
  }
}

void updateflakes(){
  for (int i = 0; i < nFlakes; i++){
    // state 1: falling left to  x = margin
   if (yFlakes[i] >= height - margin){
     stateFlakes[i] = 1;
   }
   // state 2: falling up to y = margin
   else if (xFlakes[i] <= margin){
    stateFlakes[i] = 2;
   }
   // state 3: falling right to x = width - margin
   else if (yFlakes[i] <= margin){
    stateFlakes[i] = 3;
   }
   // state 0: falling downward to y = height - margin
   else if (xFlakes[i] >= width - margin){
     stateFlakes[i] = 0;
   }
  }  
}

/* Print canvas when "p" is pressed */
void keyPressed(){
  if (key == 'p') {
    save("fallingsnow2.jpg");
  }
}


