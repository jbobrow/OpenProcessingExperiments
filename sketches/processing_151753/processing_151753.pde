
///////////////////////////// Project_ APERTURE \\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2014\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background( 35);
  float x = width/2;
  float y = height/2;
  float a = 550;
  float b;
  float d = dist(mouseX, mouseY, width/2, height/2)/2.5 ;

  strokeCap(SQUARE);
  strokeWeight(5);
  rectMode(CENTER);
  fill(4);
  rect(x, y, a, a);
  
  strokeWeight(2);
  fill(65);
  triangle(x-a/2, y-a/2, x-a/2, y+a/2, mouseX-d, mouseY);
  fill(85);
  triangle(x-a/2, y+a/2, x+a/2, y+a/2, mouseX, mouseY+d);
  fill(55);
  triangle(x-a/2, y-a/2, x+a/2, y-a/2, mouseX, mouseY-d);
  fill(165);
  triangle(x+a/2, y-a/2, x+a/2, y+a/2, mouseX+d, mouseY);


  //pushMatrix();                     ///////////////logo
  fill(255, 255, 255, 95);
  noStroke();
  rect(width-80, height-55, 10, 10);
  rect(width-60, height-55, 10, 10);
  rect(width-70, height-45, 10, 10);
  rect(width-60, height-35, 10, 10);
  // popMatrix();
                                     ///////////////logo
}
///////////////////////////// Project_ APERTURE \\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2014\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
