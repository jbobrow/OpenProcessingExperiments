
//Inspired by Wall Drawing 51

void setup() {
  size(500, 500);
  smooth();
  colorMode(RGB, width);
  background(255);
}

void draw() {
}

void mousePressed() {
  for (int x=0;x<width; x+=5) { 
    for (int y=0; y<height;y+=5) {
      if (x<width) {
        fill(random(100, 255), random(50, 200), random(0, 100), random(0, 100)); //random color and opacity
        noStroke();
        ellipse(random(5+x), random(5+y), 50, 50); //sets up circles in upper left corner, with concentration closer to top

        if (mousePressed==true) { //random lines concentrated on the left side slightly angled to the top right
          stroke(500);
          line(random(width), x, 0, 2*x);
          x++;
          stroke(random(200));

          if (x>=500) { // changes background color when clicked
            x=0;
            background(random(400));
          }
        }
      }
    }
  }
}


