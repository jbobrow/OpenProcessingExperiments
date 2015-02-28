
int x, y, z, zm; //x = x-coordinate, y = y-coordinate, z = brush size, zm = max brush size

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  x = width/2; //set start coords to the middel
  y = height/2;
  zm = 40;
  z = zm/2;
}

void draw() {  //draw function loops 
  x = x + random(-(12-4*(x/width)),12-4*(x/width)); //add or subtracts a bit
  if (x > width) x = width;
  if (x < 0) x = 0;
  y = y + random(-(12-4*(y/height)),12-4*(y/height)); //add or subtracts a bit
  if (y > height) y = height;
  if (y < 0) y = 0;
  z = z + random(-2,2); //add or subtracts a bit
  if (z > zm) z = zm;
  if (z < 1) z = 1;
  noStroke();
  fill(255*x/width,200*y/height+55,200*z/zm+55); //let z, y and z determine hue, saturation and brightness
  ellipse(x,y,z,z);
}
