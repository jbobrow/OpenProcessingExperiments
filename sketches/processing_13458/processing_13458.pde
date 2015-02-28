
// Project 2 - "Lazy Eyes."
// Zach Spitulski, Oct. 10 2010
// DMA 28, Fall

// Define Colors

color green = color (140,198,63); 

// set eye DEPTH + LOCATIONS
  int depth = 30;
  
  float leftx = 180;
  float lefty = 275;
  float rightx = 420;
  float righty = 275;
  
  // Measure distance from Mouse to eye centers
  float leftd = dist(180,275, mouseX, mouseY);
  float rightd = dist(420,275, mouseX, mouseY);

void setup() {
 
 size (600,600);
 smooth(); 
}

//--------------------------Eye Whites -------------- 
void draw() {
  
  noStroke();
  fill(255);
  background(0);
  
  ellipse(180,275,120,120);
  ellipse(420,275,120,120);
 
// -----------------------Pupils (Moving) -----------------

fill(green);

//left
  leftd = constrain(leftd, -30, depth);
  float aleft = atan2(mouseY-200, mouseX-200); //atan2 calculates the angle. look it up!
  float xleft = leftx + cos(aleft) * leftd;
  float yleft = lefty + sin(aleft) * leftd;
  ellipse(xleft, yleft, 50, 50);
  
  //right
  rightd = constrain(rightd, -30, depth);
  float aright = atan2(mouseY-200, mouseX-350); //atan2 calculates the angle. look it up!
  float xright = rightx + cos(aright) * rightd;
  float yright = righty + sin(aright) * rightd;
  ellipse(xright, yright, 50, 50);

// Draw Eye Lids
 fill(0);
 
  ellipse (180,200,190,110);
  ellipse (420,200,190,110);
}





