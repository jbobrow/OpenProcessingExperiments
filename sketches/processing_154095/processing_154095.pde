
//The MIT License (MIT) - See Licence.txt for details
//Copyright (c) 2014 Britta Gainey

int buttonW = 140;
int buttonH = 40;
int xOff = 10;
int yOff = 10;

boolean init=true;

int paintStrokeW = 20;
int buttonStrokeW = 2;

color colButtonStroke = #333333;
color colRed = #993333;
color colGreen = #669933;
color colBlue = #336699;
color colRandom = #000000;


void setup()
{
  size(600, 600);  
  background(255);
}

void draw()
{
  // code that happens every frame

  // only one time at the start and when button "clear" is clicked
  if (init) {
    drawButtons();
    init=false;
  }
}

void drawButtons()
{
  strokeWeight(buttonStrokeW);
  stroke(colButtonStroke);

  // red button
  fill(colRed);
  rect(xOff, yOff, buttonW, buttonH);

  // green button
  fill(colGreen);
  rect(xOff, 2*yOff + buttonH, buttonW, buttonH);

  // blue button
  fill(colBlue);
  rect(xOff, 3*yOff + 2*buttonH, buttonW, buttonH);

  // surprise button
  fill(100, 100, 100);
  rect(xOff, 4*yOff + 3*buttonH, buttonW, buttonH);

  // surprise text
  textSize(24);
  fill (0);
  text("Surprise", xOff, 4*yOff+4*buttonH );

  // clear button
  fill(255, 255, 255);
  rect(xOff, 5*yOff + 4*buttonH, buttonW, buttonH);

  // clear text
  textSize(24);
  fill (0);
  text("Clear", xOff, 5*yOff+5*buttonH );
}




void mouseClicked()
{
  // code that happens when the mouse 
  // is pressed and released at the same location

  // check whether the mouse is over a button 
  // and set the color used for painting accordingly



  if (mouseX > xOff && mouseX < 2*xOff + buttonW) {
    // the mouse is in the left button-area

    if (mouseY > yOff && mouseY< yOff + buttonH) {
      // the mouse is over the red button
      stroke (colRed);
    } else if (mouseY > 2*yOff && mouseY< 2*yOff + 2*buttonH) {
      // the mouse is over the second (green) button
      stroke (colGreen);
    } else if (mouseY > 3*yOff && mouseY< 3*yOff + 3*buttonH) {
      // the mouse is over the third (blue) button
      stroke (colBlue);
    } else if (mouseY > 4*yOff && mouseY< 4*yOff + 4*buttonH) {
      // the mouse is over the fourth (surprise) button

      // create a random color
      colRandom = color(random(255), random(255), random(255));

      // color the button
      fill(colRandom);
      strokeWeight(0);
      rect(xOff, 4*yOff + 3*buttonH, buttonW, buttonH);

      // repaint the text
      fill (0);
      text("Surprise", xOff, 4*yOff+4*buttonH );

      stroke (colRandom);
    } else if (mouseY > 5*yOff && mouseY< 5*yOff + 5*buttonH) {
      // the mouse is over the clear button
      // clear the background
      background(255);

      // let draw repaint the buttons
      init= true;
    }

    strokeWeight(paintStrokeW);
  }
}


void mouseDragged()
{
  // code that happens when the mouse moves
  // with the button down
  // when we are outside the button-area, which is buttonW + yOff, then draw line in the chosen color
  if (mouseX > buttonW + yOff) {

    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}


