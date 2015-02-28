
boolean mouseIsDown = false;
boolean keyIsDown = false;
int cover = 0;


color RealColor;
int red1, green1, blue1;

void setup()
{
  size(500, 500);
  smooth();
  background(0, 0, 0);
  stroke(0, 100);

  //sets my color variables 
  red1 = int(random(255));
  green1 = int(random(255));
  blue1 = int(random(255));
  //creates one line that can be used to randomize all of the colors
  RealColor = color(int(random(255)), int(random(255)), int(random(255)));
}


color colorCycler(color RealColor) {
  //turns my variable into int and redefining variables into another variable
  int r = int(red(RealColor));
  int g = int(green(RealColor));
  int b = int(blue(RealColor));
  if (r == red1) {
    red1 = int(random(255));
  }
  if (r < red1) {
    r++;
  }
  if (r > red1) {
    r--;
  }
  if (g == green1) {
    green1 = int(random(255));
  }
  if (g < green1) {
    g++;
  }
  if (g > green1) {
    g--;
  }
  if (b == blue1) {
    blue1 = int(random(255));
  }
  if (b < blue1) {
    b++;
  }
  if (b > blue1) {
    b--;
  }
  RealColor = color(r, g, b);
  return(RealColor);
}

void mousePressed()
{
  mouseIsDown = true;
}

void mouseReleased()
{ 
  mouseIsDown = false;
}

void keyPressed()
{ 
  keyIsDown = true;
}

void keyReleased()
{ 
  keyIsDown = false;
}

void draw()
{ 
  if (keyPressed)
  { 
    float weight = dist(mouseX, mouseY, pmouseX, pmouseY); 
    
  }

  RealColor = colorCycler(RealColor);
  if (mouseIsDown == true)
  {
    //makes the distance that you move over the previous mouse coorindates to
    // create a number, the faster the mouse moves the higher the number, that 
    //number is used to determine the weight of the stroke that you make with 
    //the next function
    float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
    frameRate(60);

    strokeWeight(weight);
    stroke(RealColor);

    if (key == 'c' || key == 'C') {
      noFill();
      ellipse(pmouseY+((mouseX)/2), pmouseX+(mouseY/-2), random(-10, 10), random(-10, 10));
      noStroke();
    }
    if (key == 's' || key == 'S') { 
      fill(RealColor);
      strokeWeight(random(weight));
      line(random(width), random(height), random(width), random(height));
      noStroke();
    }
    if (key == 'r' || key == 'R') {
      fill(RealColor);
      rect(random(width), random(height), random(weight), random(weight));
    noStroke();
    }
      
      if (keyCode == ENTER){
    line(mouseY, mouseX, pmouseY,pmouseX);}
  }

  if (mouseIsDown == false)
  {
    noStroke();
    cover++;
    fill(0, 0, 0, 10);
    delay(50);
    rect(0, 0, width, height);
    fill(255, 255, 255);
    textSize(20);
    text("Press Enter to Draw a line", 1, 40);
    textSize(10);
    text("Press'r' to draw a rectangle", 1, 50);
    text("Press 's' to draw a straight line", 1, 60);
    text("Press 'c' to draw a circle", 1, 70);
  }
}


