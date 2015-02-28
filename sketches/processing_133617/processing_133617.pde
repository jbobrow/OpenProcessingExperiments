
// Declare the Hair array variable
Hair[] myHairs;
int amount = 1000;
PImage img;

void setup() {
  size(800, 400);
  myHairs = new Hair[amount];
  img = loadImage("butterfly.png");

  for ( int i=0; i<amount; i=i+1) {
    float newX = map( i, 0, myHairs.length, 0, width);
    float newRed = map(i, 0, myHairs.length, 0, 255);
    color newColor = color(newRed, 0, 100);
    myHairs[i] = new Hair(newX, newColor);
  }
}

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);

  for ( int i=0; i<amount; i=i+1) {
    myHairs[i].update();
    myHairs[i].display();
  }

  //myHair.update();
  //myHair.display();
  fill(random(0, 255), 40);
  ellipse(mouseX, mouseY, 1, 1);
  //img.resize(50, 50);
  //image(img,mouseX,mouseY);
  //tint(255, 126);
  //float distance = mouseX-x;
}

class Hair {
  float x;
  float y;
  color fillColor;
  PImage img;

  // Constructor
  Hair( float theX, color theColor) {
    x = theX;
    y = height/2;
    fillColor = theColor;
  }

  void update() {
    
    float distance = dist( mouseX, mouseY, x, y );
    //println(distance);

    if (distance < 80 ) {
      float vectorX = (x-mouseX)/100;
      float vectorY = (y-mouseY)/100;
      
      x = x + vectorX;
      y = y + vectorY;
    }
    if (distance > 100) {
      x = x + random(-5, 5);
      y = y + random(-5, 5);
    }
  }

  void display() {
    noStroke();
    fill(fillColor);
    //image(img,x,y);
    ellipse(x, y, random(5), random(5));
  }
}



