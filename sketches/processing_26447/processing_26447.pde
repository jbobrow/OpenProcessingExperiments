
float fadeOne = 0;
float fadeTwo = 0;
float fadeThree = 0;
float fadeFour = 0;

void setup() { 
  size(200, 200); 
} 

void draw() { 

  background(0); 

  if (mouseX < 100 && mouseY < 100) { 
    fadeOne = 255;
  } 
  else if (mouseX > 100 && mouseY < 100) { 
    fadeTwo = 255;
  } 
  else if (mouseX < 100 && mouseY > 100) { 
    fadeThree = 255;
  } 
  else if (mouseX > 100 && mouseY > 100) { 
    fadeFour = 255;
  } 

  // rect fade
  fadeOne = fadeOne - 1;
  fadeTwo = fadeTwo - 1;
  fadeThree = fadeThree - 1;
  fadeFour = fadeFour - 1;

  //rect colour
  noStroke(); 
  fill(fadeOne);
  rect(0, 0, 100, 100); 
  fill(fadeTwo);
  rect(100, 0, 100, 100); 
  fill(fadeThree);
  rect(0, 100, 100, 100); 
  fill(fadeFour);
  rect(100, 100, 100, 100); 
  
  //grid lines
  stroke(255); 
  line(100, 0, 100, 200); 
  line(0, 100, 200, 100); 

} 

