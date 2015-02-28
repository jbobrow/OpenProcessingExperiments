
PImage turtle;//this sketch is based off of an image of a turtle

void setup() {
  size(300, 300);
  turtle= loadImage("turtle.jpg");
  frameRate(2);//this slows the drawing down so you can see whats happening
  smooth();
}

int cellsize=30;

void draw() {
  background(0);
  for (int y=0;y<=width;y+=cellsize) {
    for (int x=0;x<=height; x+=cellsize) {

      int a=int(random(0, turtle.width));
      int b=int(random(0, turtle.height));

      color newColor= turtle.get(a, b);//this gives the random color that is seen

      fill(newColor);
      
      ellipse(x, y, cellsize, cellsize);
      noStroke();
      rect(x, y, cellsize, cellsize);
    }
  }
  noLoop();
}

void mousePressed(){//this creates a new sketch
  loop();
}

