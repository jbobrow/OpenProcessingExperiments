
//triangle
Point[] p = new Point [3];

//change hues
float hueCounter = 0;
float rateOfChange = 0.05;

void setup () {
  size (500, 500);
  colorMode (HSB, 100);

  p[0] = new Point (2, height-2);
  p[1] = new Point (width-2, height-2);
  p[2] = new Point (width/2, 2);

}

void draw () {

  hueCounter = hueCounter + rateOfChange;
  //setting variable
  if (hueCounter > 100) {
    hueCounter = 0; 
  }
  color changingColor = color (hueCounter, 100, 100);
  background (100);

  stroke (0);
  strokeWeight (2);
  
  //if mousePressed then hueCounter appears
  if (mousePressed) {
    fill (255);
  }
  else {
    //else the triangle is white
    fill (changingColor);
  }
  
  triangle(p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y);

}



