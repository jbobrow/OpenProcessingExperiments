
int x = 120;
int y = 270;
boolean maxHeightReached = false;
boolean maxWidthReached = false;

boolean maxRed = false;
boolean maxGreen = false;
boolean maxBlue = false;

int r = (int) random(255);
int g = (int) random(255);
int b = (int) random(255);

void setup() {
  size(800,500);
  background(255);
}

void draw() {
  fill(r,g,b);
  noStroke();
  ellipse(x,y,50,50);
  if (y > height-25) {
    maxHeightReached = true;
  } else if (y < 25) {
    maxHeightReached = false;
  }
  if (x > width-25) {
    maxWidthReached = true;
  } else if (x < 25) {
    maxWidthReached = false; 
  }
  
  if (maxHeightReached) {
    y= y - (int) random(10);
  } else {
     y=y + (int) random(10); 
  }
  
  if (maxWidthReached) {
    x = x - (int) random(10); 
  } else {
    x=x + (int) random(10);
  }
  
  if (r >= 245) {
    maxRed = true;
  } else if (r <= 10) {
    maxRed = false;
  }
  
  if (g >= 245) {
    maxGreen = true;
  } else if (g <= 10) {
    maxGreen = false;
  }
  
  if (b >= 245) {
    maxBlue = true;
  } else if (b <= 10) {
    maxBlue = false;
  }
  
    if (maxRed)
      r -= (int) random(10);
    else
      r += (int) random(10);
    
    if (maxGreen)
      g -= (int) random(10);
    else
      g += (int) random(10);
    
    if (maxBlue)
      b -= (int) random(10);
    else
      b += (int) random(10);

}
