
//triangle
Point[] p = new Point [3];

//change hues
float hueCounter = 0;
float rateOfChange = 0.15;

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

  fill (255);
  //strokeWeight (4);


  if (mousePressed) {

    strokeWeight(4);
    stroke (changingColor);

  }
  else {

    stroke (255);
    strokeWeight(1);
    fill(changingColor);

  }

  triangle(p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y);
}





