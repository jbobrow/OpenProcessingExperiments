
// Homework 11
// 51-757 Computing for the Arts with Processing
// October 27, 2011
// Copyright Molly Nix October 2011 Pittsburgh, PA 15232

color cblue = color(121, 219, 215);
color sliderBG = color(30, 30, 30);
color sliderKnob = color(219, 219, 219);
color lighterDarkBlueBG = color(60, 60, 60);
color darkerDarkBlueBG = color(48, 48, 48);
color greyTextColor = color(140, 140, 140);
color white = color(255, 255, 255);
color black = color(0, 0, 0);
PFont font;
color bgcolor;
float centerX = 0;
float centerY = 0;
float centerZ = 0;
float mChangeInX;
float mChangeInY;
float mChangeInZ;
float xRotation;
float yRotation;
float zRotation;
float lastZlocation;
float sliderWidth;
float sliderHeight;
float sliderDistanceFromShortEdge;
float sliderDistanceFromLongEdge;
float sliderKnobSize = 10;
float stopButtonX;
float stopButtonY;
float resetButtonX;
float resetButtonY;
float buttonSize;
float buttonDistanceFromEdge = 7;

void setup()
{
  size(500, 500, P3D);
  smooth();
  centerX = 0;
  centerY = 0;
  centerZ = 0;
  mChangeInX = 0;
  mChangeInY = 0;
  mChangeInZ = 0;
  sliderWidth = width*.6;
  sliderHeight = height*.035;
  sliderDistanceFromShortEdge = width/2-(sliderWidth/2);
  sliderDistanceFromLongEdge = (sliderHeight*1.5);
  font = loadFont("TradeGothic.vlw");
  textFont(font, 11);
  buttonSize = (width-sliderWidth)*.3;
  stopButtonX = width-buttonSize-buttonDistanceFromEdge;
  stopButtonY = buttonDistanceFromEdge;
  resetButtonX = width-buttonSize-buttonDistanceFromEdge;
  resetButtonY = height-buttonSize-buttonDistanceFromEdge;
}

void draw()
{
  background(darkerDarkBlueBG);
  drawBgGradient();
  turnOnLights();
  displayData();
  drawGUIControls();
  checkForMousePress();
  rotateM();
  moveM();
  drawM();
  drawLines();
}

void drawBgGradient() {
  createGradient(width/2, height/2, width, 
  lighterDarkBlueBG, 
  darkerDarkBlueBG);
}

void displayData() {
  fill(greyTextColor);
  textAlign(LEFT, TOP);
  text("DISTANCE:" + 
    "\n" + "X: " + int(centerX) + " px" + 
    "\n"+ "Y: " + int(centerY) + " px" +
    "\n"+ "Z: " + int(centerZ) + " px", 10, 10);

  textAlign(LEFT, BOTTOM);
  text("MOVEMENT:" + 
    "\n" + "X: " + int(mChangeInX) + " px/frm" + 
    "\n"+ "Y: " + int(mChangeInY) + " px/frm" +
    "\n"+ "Z: " + int(mChangeInZ) + " px/frm", 10, height-10);
}



void drawGUIControls() {
  sliderY(sliderDistanceFromShortEdge, height-sliderDistanceFromLongEdge, sliderWidth, sliderHeight);
  sliderZ(sliderDistanceFromShortEdge, sliderDistanceFromLongEdge-sliderHeight, sliderWidth, sliderHeight);
  sliderX(width-sliderDistanceFromLongEdge, sliderDistanceFromShortEdge, sliderHeight, sliderWidth);
  drawResetandStopButtons();
}

void drawResetandStopButtons() {
  ellipseMode(CORNER);
  ellipse(resetButtonX, resetButtonY, buttonSize, buttonSize);
  ellipse(stopButtonX, stopButtonY, buttonSize, buttonSize);
  fill(darkerDarkBlueBG);
  textAlign(CENTER, CENTER);
  text("RESET", resetButtonX+(buttonSize/2), resetButtonY+(buttonSize/2));
  text("STOP", stopButtonX+(buttonSize/2), stopButtonY+(buttonSize/2));
    ellipseMode(CENTER);
}

boolean overResetButton(float x, float y, float width, float height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

boolean overStopButton(float x, float y, float width, float height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}


void checkForMousePress() {
  if (mousePressed) {
    mapMouseSliderY(sliderDistanceFromShortEdge, height-sliderDistanceFromLongEdge, sliderWidth, sliderHeight);
    mapMouseSliderZ(sliderDistanceFromShortEdge, sliderDistanceFromLongEdge-sliderHeight, sliderWidth, sliderHeight);
    mapMouseSliderX(width-sliderDistanceFromLongEdge, sliderDistanceFromShortEdge, sliderHeight, sliderWidth);
  }
}

void mouseReleased() {
  if (overResetButton(resetButtonX, resetButtonY, buttonSize, buttonSize) == true) {
    mChangeInY = 0;
    mChangeInX = 0;
    mChangeInZ = 0;
    centerX = 0;
    centerY = 0;
    centerZ = 0;
    xRotation=0;
    yRotation=0;
    zRotation=0;
  }
  if (overStopButton(stopButtonX, stopButtonY, buttonSize, buttonSize) == true) {
    mChangeInY = 0;
    mChangeInX = 0;
    mChangeInZ = 0;
  }
}

void sliderX(float barX, float barY, float barWidth, float barHeight) {
  // Draw Slider BG
  noStroke( ) ; 
  fill( black ) ;
  ellipse((barX+barWidth/2)+1, barY, barWidth, barWidth);
  ellipse((barX+barWidth/2)+1, barY+barHeight, barWidth, barWidth);
  rect( barX+1, barY, barWidth, barHeight);
  fill( white ) ;
  ellipse((barX+barWidth/2)-1, barY, barWidth, barWidth);
  ellipse((barX+barWidth/2)-1, barY+barHeight, barWidth, barWidth);
  rect( barX-1, barY, barWidth, barHeight);
  fill( sliderBG ) ;
  ellipse(barX+barWidth/2, barY, barWidth, barWidth);
  ellipse(barX+barWidth/2, barY+barHeight, barWidth, barWidth);
  rect( barX, barY, barWidth, barHeight);
  // Draw Slider Knob
  float x = map( xRotation, -360, 360, barY, barY+barHeight) ; 
  fill (white);
  ellipse((barX+(barWidth/2))+1, x, barWidth+(barWidth*.1), barWidth+(barWidth*.1));
  fill (black);
  ellipse((barX+(barWidth/2))-1, x, barWidth+(barWidth*.1), barWidth+(barWidth*.1));
  fill (sliderKnob);
  ellipse(barX+(barWidth/2), x, barWidth+(barWidth*.1), barWidth+(barWidth*.1));
  fill (lighterDarkBlueBG);
  ellipse(barX+(barWidth/2), x, barWidth*.6, barWidth*.6);
  // Draw Rotation Info
  fill(greyTextColor);
  textAlign(RIGHT, CENTER);
  text("X Rotation\n" + int(xRotation) + "° ", barX-(barWidth*.3), x);
}




void mapMouseSliderX(float barX, float barY, float barWidth, float barHeight) {
  if (((mouseX >= barX) && (mouseX <= barX+barWidth)) &&
       ((mouseY >= barY-sliderKnobSize) && (mouseY <= barY+barHeight+sliderKnobSize))) {
    xRotation = int( map( mouseY, barY, barY + barHeight, -360, 360 ) ) ;
    if ( xRotation < -360 ) { 
      xRotation = -360;
    } 
    else if ( xRotation > 360 ) { 
      xRotation = 360 ;
    }
  }
}



void sliderZ(float barX, float barY, float barWidth, float barHeight) {
  // Draw Slider BG
  noStroke( ) ; 
  fill( black ) ;
  ellipse(barX, (barY+barHeight/2)-1, barHeight, barHeight);
  ellipse(barX+barWidth, (barY+barHeight/2)-1, barHeight, barHeight);
  rect( barX, barY-1, barWidth, barHeight); 
  fill( white ) ;
  ellipse(barX, (barY+barHeight/2)+1, barHeight, barHeight);
  ellipse(barX+barWidth, (barY+barHeight/2)+1, barHeight, barHeight);
  rect( barX, barY+1, barWidth, barHeight); 
  fill( sliderBG ) ;
  ellipse(barX, barY+barHeight/2, barHeight, barHeight);
  ellipse(barX+barWidth, barY+barHeight/2, barHeight, barHeight);
  rect( barX, barY, barWidth, barHeight); 
  // Draw Slider Knob
  float z = map( zRotation, -360, 360, barX, barX+barWidth) ; 
  fill (white);
  ellipse(z, (barY+(barHeight/2))-1, barHeight+(barHeight*.1), barHeight+(barHeight*.1));
  fill (black);
  ellipse(z, (barY+(barHeight/2))+1, barHeight+(barHeight*.1), barHeight+(barHeight*.1));
  fill (sliderKnob);
  ellipse(z, barY+(barHeight/2), barHeight+(barHeight*.1), barHeight+(barHeight*.1));
  fill (lighterDarkBlueBG);
  ellipse(z, barY+(barHeight/2), barHeight*.6, barHeight*.6);
  // Draw Rotation Info
  fill(greyTextColor);
  textAlign(CENTER, TOP);
  text("Z Rotation\n" + int(zRotation) + "°", z, barY+(barHeight)+(barHeight*.3));
}

void mapMouseSliderZ(float barX, float barY, float barWidth, float barHeight) {
  if (((mouseY >= barY) && (mouseY <= barY+barHeight)) &&
  ((mouseX >= barX-sliderKnobSize) && (mouseX <= barX+barWidth+sliderKnobSize))) {
    zRotation = int( map( mouseX, barX, barX + barWidth, -360, 360 ) ) ;
    if ( zRotation < -360 ) { 
      zRotation = -360;
    } 
    else if ( zRotation > 360 ) { 
      zRotation = 360 ;
    }
  }
}


void sliderY(float barX, float barY, float barWidth, float barHeight) {
  // Draw Slider BG
  noStroke( ) ; 
  fill( black ) ; 
  ellipse(barX, (barY+barHeight/2)-1, barHeight, barHeight);
  ellipse(barX+barWidth, (barY+barHeight/2)-1, barHeight, barHeight);
  rect( barX, barY-1, barWidth, barHeight);
  fill( white ) ; 
  ellipse(barX, (barY+barHeight/2)+1, barHeight, barHeight);
  ellipse(barX+barWidth, (barY+barHeight/2)+1, barHeight, barHeight);
  rect( barX, barY+1, barWidth, barHeight);
  fill( sliderBG ) ; 
  ellipse(barX, barY+barHeight/2, barHeight, barHeight);
  ellipse(barX+barWidth, barY+barHeight/2, barHeight, barHeight);
  rect( barX, barY, barWidth, barHeight);
  // Draw Slider Knob
  float x = map( yRotation, -360, 360, barX, barX+barWidth) ; 
  fill (white);
  ellipse(x, (barY+(barHeight/2))-1, barHeight+(barHeight*.1), barHeight+(barHeight*.1));
  fill (black);
  ellipse(x, (barY+(barHeight/2))+1, barHeight+(barHeight*.1), barHeight+(barHeight*.1));
  fill (sliderKnob);
  ellipse(x, barY+(barHeight/2), barHeight+(barHeight*.1), barHeight+(barHeight*.1));
  fill (lighterDarkBlueBG);
  ellipse(x, barY+(barHeight/2), barHeight*.6, barHeight*.6);
  // Draw Rotation Info
  fill(greyTextColor);
  textAlign(CENTER, BOTTOM);
  text("Y Rotation\n" + int(yRotation) + "°", x, barY-(barHeight*.3));
}

void mapMouseSliderY(float barX, float barY, float barWidth, float barHeight) {
  if (((mouseY >= barY) && (mouseY <= barY+barHeight)) &&
((mouseX >= barX-sliderKnobSize) && (mouseX <= barX+barWidth+sliderKnobSize))) {
    yRotation = int( map( mouseX, barX, barX + barWidth, -360, 360 ) ) ;
    if ( yRotation < -360 ) { 
      yRotation = -360;
    } 
    else if ( yRotation > 360 ) { 
      yRotation = 360 ;
    }
  }
}

void keyPressed() {
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      mChangeInY = mChangeInY-1;
    }
    else if (keyCode == DOWN)
    {
      mChangeInY = mChangeInY+1;
    }
    else if (keyCode == LEFT )
    {
      mChangeInX = mChangeInX-1;
    }
    else if (keyCode == RIGHT)
    {
      mChangeInX = mChangeInX+1;
    }
  }
  else if (key == 'a')
  {
    mChangeInZ = mChangeInZ-1;
  }
  else if (key == 'c')
  {
    mChangeInZ = mChangeInZ+1;
  }
  else if (key == 's') {
    mChangeInY = 0;
    mChangeInX = 0;
    mChangeInZ = 0;
  }
  else if (key == 'z') {
    mChangeInZ = 0;
    lastZlocation = centerZ;
    centerZ = -500;
  }
  else if (key == 'x') {
    centerZ = lastZlocation;
  }
  else if (key == ' ')
  {
    mChangeInY = 0;
    mChangeInX = 0;
    mChangeInZ = 0;
    centerX = 0;
    centerY = 0;
    centerZ = 0;
    xRotation=0;
    yRotation=0;
    zRotation=0;
  }
}

void moveM () {
  centerX = centerX+mChangeInX;
  centerY = centerY+mChangeInY;
  centerZ = centerZ+mChangeInZ;
}


void rotateM() 
{
  translate(width/2, height/2, 0);
  rotateY(radians(yRotation));
  rotateX(radians(xRotation));
  rotateZ(radians(zRotation));
}

void turnOnLights() 
{
  lights();
  directionalLight(102, 102, 102, -1, 1, -1);
}

void drawLines()
{
  line(centerX-width/2, centerY, centerZ, centerX+width/2, centerY, centerZ);
  line(centerX, centerY-height/2, centerZ, centerX, centerY+height/2, centerZ);
  line(centerX, centerY, centerZ-width/2, centerX, centerY, centerZ+width/2);
}


void drawM()
{
  fill(cblue, 240);
  stroke(darkerDarkBlueBG);
  strokeWeight(.75);
  pushMatrix();
  translate(centerX-(width*.174), centerY, centerZ);
  box(width*.069, height*.285, height*.075);
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.174), centerY, centerZ);
  box(width*.069, height*.285, height*.075);
  popMatrix();


  pushMatrix();
  translate(centerX-(width*.159), centerY-(height*.1725), centerZ);
  box(width*.1875, height*.057, height*.15);
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.159), centerY-(height*.1725), centerZ);
  box(width*.1875, height*.057, height*.15);
  popMatrix();

  pushMatrix();
  translate(centerX-(width*.189), centerY+(height*.1695), centerZ);
  box(width*.1665, height*.06, height*.15);
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.189), centerY+(height*.1695), centerZ);
  box(width*.1665, height*.06, height*.15);
  popMatrix();

  pushMatrix();
  translate(centerX-(width*.0765), centerY, centerZ);
  beginShape();
  vertex(width*.0765, height*.0975);
  vertex(width*.0765, height*.1995);
  vertex(width*.027, height*.1995);
  vertex(-width*.0765, -height*.144);
  vertex(-width*.0765, -height*.1995);
  vertex(-width*.0765, -height*.1995);
  vertex(-width*.0135, -height*.1995);
  vertex(width*.0765, height*.0975);
  endShape();
  popMatrix();

  pushMatrix();
  translate(centerX+(width*.0765), centerY, centerZ);
  beginShape();
  vertex(-width*.0765, height*.0975);
  vertex(-width*.0765, height*.1995);
  vertex(-width*.027, height*.1995);
  vertex(width*.0765, -height*.144);
  vertex(width*.0765, -height*.1995);
  vertex(width*.0765, -height*.1995);
  vertex(width*.0135, -height*.1995);
  vertex(-width*.0765, height*.0975);
  endShape();
  popMatrix();
}




//CREATEGRADIENT FUNCTION FROM PROCESSING API: http://processing.org/learning/basics/radialgradient.html
void createGradient (float x, float y, float radius, color c1, color c2) {
  float px = 0, py = 0, angle = 0;

  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 8.0;

  for (int i=0; i< radius; i++) {
    for (float j=0; j<360; j+=1.0/gapFiller) {
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)), 
      (green(c1)+(i)*(deltaG/radius)), 
      (blue(c1)+(i)*(deltaB/radius)) 
        );
      set(int(px), int(py), c);
    }
  }
  // adds smooth edge 
  // hack anti-aliasing
  noFill();
  strokeWeight(3);
  ellipse(x, y, radius*2, radius*2);
}


