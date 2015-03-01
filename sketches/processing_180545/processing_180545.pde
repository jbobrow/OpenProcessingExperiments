
//x pos
//y pos
//angle
//rotation
//color
float x, y, a, r, c;

void setup() {
  size(500, 500);
  background(#171717);
  noStroke();
  colorMode(HSB, 100);
}

void draw() {
  //Sets the (0,0) on the center of the screen
  translate(width/2, height/2);

  //rotates
  rotate(r);

  //adds distance from the center each frame  
  x = r;
  y = r;

  //changes color, from black to white. 
  fill(c);
  
  //Changes the ellipse radius over time
  float sinRad = map(sin(a), -1, 1, 50, 70);
  
  //draws the ellipse with all the previous parameters
  ellipse(x, y, sinRad, sinRad);

  //Increase whiteness
  c = c + .2;  
  
  //Increase angle from sin function
  a = a + 5;
  
  //Increase rotation
  r = r + .4;
}

void mousePressed() {
  //Resets everything on mouseclick
  background(#171717);
  c = 0;
  a = 0;
  r = 0;
}

