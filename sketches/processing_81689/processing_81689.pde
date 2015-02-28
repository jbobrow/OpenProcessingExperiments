

int arraySize = 50;

int[] xpos = new int[arraySize]; 
int[] ypos = new int[arraySize];
char[] chars = new char[arraySize];

float theta;
float thetaSpeed = 0.01;

int displayPromptFlag = 1;

void setup() {
  frameRate(10);
  size(300, 800, P3D);
  
  smooth();
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) 
  {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  
  // Create the font
  textFont(createFont("Times New Roman", 200));
  
  // fill the char array
  for (int i = 0; i < chars.length; i ++ ) 
  {
    chars[i] = char(i + 25);
  }
}

void draw() {
  background(0);
  
  if(displayPromptFlag == 1)
  {
      text("give rain", 100, 100);
  }
  
  theta += thetaSpeed;
  // Shift array values
  
  // save first elemant in array
  int xtemp = xpos[0];
  int ytemp = ypos[0];
  for (int i = 0; i < xpos.length-1; i ++ ) 
  {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  // give the last element the old first value
  xpos[xpos.length - 1] = xtemp;
  ypos[ypos.length - 1] = ytemp;
  
  if(mousePressed)
  {
    // Update the last spot in the array with the mouse location.
    xpos[xpos.length-1] = mouseX; 
    ypos[ypos.length-1] = mouseY;
  }
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     
     // Color is tied to the loop's counter: i.
    noStroke();
    fill(255 - i * (255./(float) arraySize));
    pushMatrix();
    translate(xpos[i],ypos[i]);
    rotateX(theta);
    text(chars[i], 0, 0);
    popMatrix();
  }
}

void mousePressed()
{
   displayPromptFlag = 0; 
}


