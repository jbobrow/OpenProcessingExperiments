
int Default = 1; // Set the default tool to be the first pattern

// Define the variables for the buttons
boolean colour1Over = false; // By default the mouse is not over the button
int colour1X, colour1Y; // Position of the button
int colour1Size = 30; // The size of the button

boolean colour2Over = false;
int colour2X, colour2Y;
int colour2Size = 30;

boolean colour3Over = false;
int colour3X, colour3Y;
int colour3Size = 30;

boolean colour4Over = false;
int colour4X, colour4Y;
int colour4Size = 30;

boolean colour5Over = false;
int colour5X, colour5Y;
int colour5Size = 30;

boolean colour6Over = false;
int colour6X, colour6Y;
int colour6Size = 30;

boolean colour7Over = false;
int colour7X, colour7Y;
int colour7Size = 30;

boolean clearOver = false;
int clearX, clearY;
int clearSize = 30;

void setup() {
  size(1000, 1000);
  background(255);
  smooth();

  // Set the positions of the buttons
  colour1X = colour1Size;
  colour1Y = colour1Size/2;
  colour2X = colour2Size+40;
  colour2Y = colour2Size/2;
  colour3X = colour3Size+80;
  colour3Y = colour3Size/2;
  colour4X = colour4Size+120;
  colour4Y = colour4Size/2;
  colour5X = colour5Size+160;
  colour5Y = colour5Size/2; 
  colour6X = colour6Size+200;
  colour6Y = colour6Size/2; 
  colour7X = colour7Size+240;
  colour7Y = colour7Size/2;
  clearX = clearSize+280;
  clearY = clearSize/2;
}

void draw() {
  update(mouseX, mouseY);

  noStroke();
  fill(255, 0, 0);
  rect(colour1X, colour1Y, colour1Size, colour1Size);

  fill(0, 255, 0);
  rect(colour2X, colour2Y, colour2Size, colour2Size);

  fill(0, 0, 255);
  rect(colour3X, colour3Y, colour3Size, colour3Size);

  fill(255, 255, 0);
  rect(colour4X, colour4Y, colour4Size, colour4Size);

  fill(255, 0, 255);
  rect(colour5X, colour5Y, colour5Size, colour5Size);
  
  fill(80,0,255);
  rect(colour6X, colour6Y, colour6Size, colour6Size);

  fill(random(255),random(255),random(255));
  rect(colour7X, colour7Y, colour7Size, colour7Size);


  noStroke();
  fill(255);
  rect(clearX, clearY, clearSize, clearSize);
  fill(0);
  textAlign(CENTER);
  textSize(25);
  text("C", clearX+12.5, clearY+22.5);


  if (mousePressed) {
    switch(Default) {     
    case 1: 
      colour1();  
      break;
    case 2: 
      colour2();
      break;
    case 3: 
      colour3();
      break;
    case 4: 
      colour4();
      break;
    case 5: 
      colour5();
      break;
    case 6:
      colour6();
      break;
    case 7:
      colour7();
      break;
    }
  }
}

// Update to check whether the mouse position is within one of the
// buttons
void update(int x, int y) {
  colour1Over = colourSelect(colour1X, colour1Y, colour1Size, colour1Size); 
  colour2Over = colourSelect(colour2X, colour2Y, colour2Size, colour2Size); 
  colour3Over = colourSelect(colour3X, colour3Y, colour3Size, colour3Size); 
  colour4Over = colourSelect(colour4X, colour4Y, colour4Size, colour4Size); 
  colour5Over = colourSelect(colour5X, colour5Y, colour5Size, colour5Size); 
  colour6Over = colourSelect(colour6X, colour6Y, colour6Size, colour6Size);
  colour7Over = colourSelect(colour7X, colour7Y, colour7Size, colour7Size);
  clearOver = colourSelect(clearX, clearY, clearSize, clearSize);
}

void mousePressed() {
  if (colour1Over) {
    Default = 1;
  }
  else if (colour2Over) {
    Default = 2;
  }
  else if (colour3Over) {
    Default = 3;
  }
  else if (colour4Over) {
    Default = 4;
  } 
  else if (colour5Over) {
    Default = 5;
  } 
  else if (colour6Over) {
    Default = 6;
  }
  else if(colour7Over) {
    Default = 7;
  }
  else if (clearOver) {
    background(255);    // clear the screen
  }
}


void colour1() {
  strokeWeight(10);    
  stroke(255, 0, 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colour2() {
  strokeWeight(10);    
  stroke(0, 255, 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colour3() {
  strokeWeight(10);    
  stroke(0, 0, 255);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colour4() {
  strokeWeight(10);    
  stroke(255, 255, 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colour5() {
  strokeWeight(10);    
  stroke(255, 0, 255);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colour6() {
  strokeWeight(10); 
  stroke(80,0,255); 
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colour7() {
  strokeWeight(10);  
  stroke(random(255), random(255), random(255));
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void colourOver() {
  background(255);
}

boolean colourSelect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

//Co-ordinates for mouse
void mouseClicked() {
  println("Mouse clicked at (" + mouseX + ", " + mouseY + ")");
}



