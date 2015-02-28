
// Example to show that interactive exploration of data can help
// you to find coherencies and patterns that would otherwise be hidden.
PImage img;

void setup() {
  size(500,500, P3D);
  ortho(-width/2, width/2, -height/2, height/2, -600, 600);
  img = loadImage("trollface.png");  // Load the image into the program
  img.loadPixels();  
}

void draw() {
  background(0);
  translate(width/2, height/2,0);
  pushMatrix();
  rotateX(map(mouseY, 0, height, -PI/2, PI/2));
  rotateY(map(mouseX, 0, width,  -PI/2, PI/2));
  noFill();
  stroke(255);
  strokeWeight(1);
  box(img.width);
  
  for (int iX=0; iX<img.width; iX+=4)
    for (int iY=0; iY<img.height; iY+=4)
    {
      float zCrd = (random(-1,1) * sin(map(iX, 0, width, 0, PI*2)))*200;
      color pixelColor =img.get(iX, iY);  
      if (pixelColor < 0)
      {
        strokeWeight(4);
      stroke(img.get(iX, iY));
      point(iX-img.width/2, iY-img.height/2, zCrd);
      }
    }
    popMatrix();
}


