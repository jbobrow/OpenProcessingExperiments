
//attempt to redu it agaaaiiinnn wtf

boolean touch = false;

color ColorRed = color (255, 0, 0);
color ColorOrange = color (255, 102, 0);
color ColorYellow = color (255, 247, 0);
color ColorGreen = color (0, 255, 1);
color ColorBlue = color (0, 14, 255);
color ColorPurple = color (254, 0, 255);
color ColorBlack = color (0);
color Erase = color (255);
color Pressed = color (155);

color PenColor = color (0);

float oldX, oldY;

int Thickness = 1;





void setup () {
  size (500, 500);
  smooth();
  background (255);


}

void draw() {
  
  //DRAW THE SHAPES
  noStroke();
  
  fill(ColorBlack);
  rect(430, 20, 50,70);
  
  fill(ColorRed);
  rect(20, 20, 30, 30);
  fill(ColorOrange);
  rect(20, 50, 30, 30);
  fill(ColorYellow);
  rect(20, 80, 30, 30);
  fill(ColorGreen);
  rect(20, 110, 30, 30);
  fill(ColorBlue);
  rect(20, 140, 30, 30);
  fill(ColorPurple);
  rect(20, 170, 30, 30);
  fill(ColorBlack);
  rect(20, 200, 30, 30);
  
  ellipseMode(CORNER);
  fill(Erase);
  stroke(0);
  strokeWeight(1);
  ellipse(20, 260, 30, 30);
  
  fill(ColorBlack);
  triangle(35, 320, 20, 350, 50, 350); 
  fill(ColorBlack);
  triangle(35, 390, 50, 360, 20, 360);
  
 
 
  //RED BUTTON
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 20 && mouseY < 50) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorRed);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorRed;
  }
  rect(20, 20, 30, 30);
  }


//ORANGE BUTTON

if(mouseX > 20 && mouseX < 50 && mouseY > 50 && mouseY < 80) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorOrange);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorOrange;
  }
  rect(20, 50, 30, 30);
  }
  
  
  //YELLOW BUTTON
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 80 && mouseY < 110) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorYellow);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorYellow;
  }
  rect(20, 80, 30, 30);
  }
  
  
  //GREEN BUTTON
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 110 && mouseY < 140) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorGreen);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorGreen;
  }
  rect(20, 110, 30, 30);
  }
  
  
  // BLUE BUTTON
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 140 && mouseY < 170) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorBlue);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorBlue;
  }
  rect(20, 140, 30, 30);
  }
  
  
  // PURPLE BUTTON
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 170 && mouseY < 200) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorPurple);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorPurple;
  }
  rect(20, 170, 30, 30);
  }
  
  
  // BLACK BUTTON
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 200 && mouseY < 230) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorBlack);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = ColorBlack;
  }
  rect(20, 200, 30, 30);
  }
  
  
  //WHITE ERASER
  
  if(dist(mouseX, mouseY,35, 275) <= 15) {
    touch = true;
  }else{
    touch = false;
  }
  if(touch == false) {
    fill(Erase);
  }else{
    fill(Pressed);
    if(mousePressed) {
      PenColor = Erase;
      Thickness = 30;
    }
    ellipse(20, 260, 30, 30);
  }
  
  
  
  //CLEAR SCREEN
  
  if(mouseX > 430 && mouseX < 480 && mouseY > 20 && mouseY < 90) {
    touch = true;
  }else{
    touch = false;
  }
  if(touch == false) {
    fill(ColorBlack);
  }else{
    fill(Pressed);
    if(mousePressed) {
      background(255);
    }
    rect(430, 20, 50,70);
  }
  
  
  //MAKE STROKE BIGGER ^^^^
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 320 && mouseY < 350) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorBlack);
  }else{
    fill(Pressed);
    if(mousePressed) {
      Thickness++;
    }
    triangle(35, 320, 20, 350, 50, 350); 
  }
  
  
  //MAKE STROKE SMALLER
  
  if(mouseX > 20 && mouseX < 50 && mouseY > 360 && mouseY < 390) {
    touch = true;
  }else{
    touch = false;
  }
  if (touch == false) {
    fill(ColorBlack);
  }else{
    fill(Pressed);
    if(mousePressed) {
      Thickness--;
    }
    triangle(35, 390, 50, 360, 20, 360);
  }

    

  
  
  
  
  
  
  
  //DRAW THE LINE
  
  if(mousePressed) {
    stroke(PenColor);
    strokeWeight(Thickness);
    line(oldX, oldY, mouseX, mouseY);
  }
  
  oldX = mouseX;
  oldY = mouseY;
}             
                
