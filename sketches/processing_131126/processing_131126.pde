
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// HW #5
// 1/28/14

//******************************************
// DECLARE GLOBAL VARIABLES

// Figure 1
float figure1X;
float figure1Y;
float figure1Scale;
float figure1Speed;
float figure1Orient;

// Figure 2
float figure2X;
float figure2Y;
float figure2Scale;
float figure2Speed;
float figure2Orient;

// Drawing variables
float gridSize;
float indent;

// Colors
color colorBackground;
color colorTRex;
color colorTeeth;
color colorEyeShadow;

//******************************************
void setup(){
  size(600,400);
  
  // Initialize drawing size variable
  gridSize = height / 30;
  indent = 7*gridSize;
  
  
  // Initialize color variables
  colorBackground = color(220,150,255,40);
  colorTRex = color(50,255,0);
  colorTeeth = color(255,255,220);
  colorEyeShadow = color(40,200,0);
  
  // Initialize figure 1 variables
  figure1Scale = 1;
  figure1Speed = 3;
  figure1X = indent;
  figure1Y = indent;
  figure1Orient = 1; // facing right
  
  // Initialize figure 2 variables
  figure2Scale = .5;
  figure2Speed = 1;
  figure2X = width-indent;
  figure2Y = height-indent;
  figure2Orient = -1; // facing left
  
}

//******************************************
void draw(){
  prepWindow();
  moveFigures();
  drawFigures();
}

//******************************************
void prepWindow() {
  noStroke();
  fill(colorBackground);
  rect(0,0,width,height);
}

//******************************************
void moveFigures() {
// move figures in x or y direction based on current position
// adjust orientation (facing left or right) as needed

  //**********************
  // FIGURE 1
  //**********************
  if(figure1Y <= indent){
    // Top edge
    figure1X += figure1Speed; // move right
    figure1Y = indent; // reset y position in case out of bounds
    figure1Orient = 1; //facing right
  }
  if(figure1X >= (width-indent)){
    // Right edge
    figure1Y += figure1Speed; // move down
    figure1X = width-indent; // reset x position in case out of bounds
    if(figure1Speed>0){
      figure1Orient = 1; //facing right
    }else{
      figure1Orient = -1; // facing left
    }
  }
  if(figure1Y >= (height-indent)){
    // Bottom edge
    figure1X += -figure1Speed; // move left
    figure1Y = height-indent; // reset y position in case out of bounds
    figure1Orient = -1; // facing left
  }
  if(figure1X <= indent){
    // Left edge
    figure1Y += -figure1Speed; // move up
    figure1X = indent; // reset x position in case out of bounds
    if(figure1Speed>0){
      figure1Orient = -1; // facing left
    }else{
      figure1Orient = 1; // facing right
    }
  }
  
  //**********************
  // FIGURE 2
  //**********************
  if(figure2Y <= indent){
    // Top edge
    figure2X += figure2Speed; // move right
    figure2Y = indent; // reset y position in case out of bounds
    figure2Orient = 1; //facing right
  }
  if(figure2X >= (width-indent)){
    // Right edge
    figure2Y += figure2Speed; // move down
    figure2X = width-indent; // reset x position in case out of bounds
    if(figure2Speed>0){
      figure2Orient = 1; //facing right
    }else{
      figure2Orient = -1; // facing left
    }
  }
  if(figure2Y >= (height-indent)){
    // Bottom edge
    figure2X += -figure2Speed; // move left
    figure2Y = height-indent; // reset y position in case out of bounds
    figure2Orient = -1; // facing left
  }
  if(figure2X <= indent){
    // Left edge
    figure2Y += -figure2Speed; // move up
    figure2X = indent; // reset x position in case out of bounds
    if(figure2Speed>0){
      figure2Orient = -1; // facing left
    }else{
      figure2Orient = 1; // facing right
    }
  }
  
}

//******************************************
void drawFigures() {
  // draw figure 1
  figure(figure1X,figure1Y,figure1Scale,figure1Orient);
  // draw figure 2
  figure(figure2X,figure2Y,figure2Scale,figure2Orient);
}

//******************************************
void figure(float x, float y, float figureScale, float orient){
  // Declare local variables
  float unit;
  
  // Set drawing unit size
  unit = gridSize * figureScale;
    
  //**********************
  // Teeth
  //**********************
  noStroke();
  fill(colorTeeth);
  beginShape();
    vertex(x+orient*(4*unit),y+(-5*unit));
    vertex(x+orient*(3.9*unit),y+(-3.9*unit));
    vertex(x+orient*(3.6*unit),y+(-4.9*unit));
    vertex(x+orient*(3.5*unit),y+(-3.9*unit));
    vertex(x+orient*(3.2*unit),y+(-4.8*unit));
    vertex(x+orient*(3.1*unit),y+(-3.9*unit));
    vertex(x+orient*(2.8*unit),y+(-4.7*unit));
    vertex(x+orient*(2.7*unit),y+(-3.9*unit));
    vertex(x+orient*(2.3*unit),y+(-4.6*unit));  
  endShape();
  beginShape();
    vertex(x+orient*(3.95*unit),y+(-3.5*unit));
    vertex(x+orient*(3.9*unit),y+(-3.8*unit));
    vertex(x+orient*(3.75*unit),y+(-3.4*unit));
    vertex(x+orient*(3.65*unit),y+(-3.8*unit));
    vertex(x+orient*(3.45*unit),y+(-3.3*unit));
    vertex(x+orient*(3.3*unit),y+(-3.8*unit));
    vertex(x+orient*(3.2*unit),y+(-3.2*unit));
    vertex(x+orient*(3*unit),y+(-3.8*unit));
    vertex(x+orient*(2.8*unit),y+(-3.1*unit));  
  endShape();
  
  //**********************
  // Main Body
  //**********************
  fill(colorTRex);
  stroke(0);
  beginShape();
    curveVertex(x+orient*(1*unit),y+(-4*unit));
    curveVertex(x+orient*(2*unit),y+(-4*unit));
    curveVertex(x+orient*(2.5*unit),y+(-4.1*unit));
    curveVertex(x+orient*(3*unit),y+(-4.3*unit));
    curveVertex(x+orient*(4*unit),y+(-4.5*unit));
    curveVertex(x+orient*(4*unit),y+(-5*unit));
    curveVertex(x+orient*(3*unit),y+(-5.25*unit));
    curveVertex(x+orient*(1.5*unit),y+(-5.5*unit));
    curveVertex(x+orient*(0*unit),y+(-4*unit));
    curveVertex(x+orient*(0*unit),y+(-2.5*unit));
    curveVertex(x+orient*(-2*unit), y+(0*unit));
    curveVertex(x+orient*(-3.5*unit), y+(3*unit));
    curveVertex(x+orient*(-6*unit), y+(3*unit));
    curveVertex(x+orient*(-3.5*unit), y+(4*unit));
    curveVertex(x+orient*(0*unit), y+(2*unit));
    curveVertex(x+orient*(2*unit), y+(-1*unit));
    curveVertex(x+orient*(1.5*unit), y+(-3*unit));
    curveVertex(x+orient*(0.5*unit), y+(-4*unit));
  endShape();
  
  //**********************
  // Lower Jaw  
  //**********************
  beginShape();
    curveVertex(x+orient*(1*unit),y+(-4*unit));
    curveVertex(x+orient*(2*unit),y+(-4*unit));
    curveVertex(x+orient*(2.5*unit),y+(-3.8*unit));
    curveVertex(x+orient*(3*unit),y+(-3.6*unit));
    curveVertex(x+orient*(4*unit),y+(-3.4*unit));
    curveVertex(x+orient*(4*unit),y+(-3*unit));
    curveVertex(x+orient*(3*unit),y+(-2.85*unit));
    curveVertex(x+orient*(1.5*unit),y+(-2.75*unit));
    curveVertex(x+orient*(1*unit),y+(-3.5*unit));
    curveVertex(x+orient*(1*unit), y+(-4*unit));
  endShape();
  
  //**********************
  // Leg
  //**********************
  beginShape();
    vertex(x+orient*(-1*unit),y+(2*unit));
    vertex(x+orient*(1*unit),y+(2.5*unit));
    vertex(x+orient*(1*unit),y+(3.5*unit));
    vertex(x+orient*(1.5*unit),y+(4*unit));
    vertex(x+orient*(2.5*unit),y+(4*unit));
    vertex(x+orient*(1.5*unit),y+(3.5*unit));
    vertex(x+orient*(2*unit),y+(1.75*unit));
    vertex(x+orient*(.5*unit),y+(.75*unit));
  endShape();
  
  //**********************
  // Arm
  //**********************
  beginShape();
    vertex(x+orient*(.5*unit),y+(-1*unit));
    vertex(x+orient*(1*unit),y+(0*unit));
    vertex(x+orient*(2*unit),y+(0*unit));
    vertex(x+orient*(2.5*unit),y+(0.5*unit));
    vertex(x+orient*(2.25*unit),y+(-.5*unit));
    vertex(x+orient*(1.5*unit),y+(-.5*unit));
    vertex(x+orient*(1.25*unit),y+(-1*unit));
  endShape();
  
  //**********************
  // Eye
  //**********************
  noStroke();
  fill(colorEyeShadow);
  ellipse(x+orient*(1.8*unit),y+(-4.9*unit),1.25*unit,.9*unit);
  stroke(0);
  fill(255);
  ellipse(x+orient*(1.8*unit),y+(-4.9*unit),.5*unit,.3*unit);
  fill(255,255,0);
  ellipse(x+orient*(1.8*unit),y+(-4.9*unit),.2*unit,.3*unit);
  noStroke();
  fill(0);
  ellipse(x+orient*(1.8*unit),y+(-4.9*unit),.1*unit,.3*unit);
  
  //**********************
  // Balloons
  //**********************
  stroke(0);
  // red balloon
  fill(230,0,50);
  line(x+orient*(1.5*unit),y+(-.5*unit),x+orient*(-3.6*unit),y+(-4.7*unit));
  ellipse(x+orient*(-3.6*unit),y+(-4.7*unit),2*unit,2.5*unit);
  // blue balloon
  fill(100,50,255);
  line(x+orient*(1.5*unit),y+(-.5*unit),x+orient*(-2*unit),y+(-5*unit));
  ellipse(x+orient*(-2*unit),y+(-5*unit),2*unit,2.5*unit);
  // yellow balloon
  fill(230,230,0);
  line(x+orient*(1.5*unit),y+(-.5*unit),x+orient*(-3*unit),y+(-3.75*unit));
  ellipse(x+orient*(-3*unit),y+(-3.75*unit),2*unit,2.5*unit);
  
}

//******************************************
void keyPressed(){
  if(key=='+'){
    // Increase speed
    figure1Speed++;
    figure2Speed++;
  }else if(key =='-'){
    // Decrease speed
    figure1Speed--;
    figure2Speed--;
  }
}


