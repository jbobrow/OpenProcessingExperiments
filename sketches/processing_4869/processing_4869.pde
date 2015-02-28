
/*
How does color mode affect lerpColor?
Run to see.

This app draws a narrow horiz strip 800 px wide,
interpolating from color 1 to 2 to 3, across it.
The top half interpolates colors in HSB, the bottom half
in RGB.

Witness the mud!
*/

size(800, 100);

color one = #0033ee;
color two = #00ee33;
color three = #ee3300;

one = #ff0000;
two = #00ff00;
three = #0000ff;

// white to red to black -- HSB only affects red to black! weird.
//one = #ffffff;
//two = #ff0000;
//three = #000000;

for (int i = 0; i < width/2; i++) {
  float percent = norm(i, 0, width/2);
  
  stroke(lerpColor(one, two, percent, HSB));
  line(i, 0, i, height/2);
  
  stroke(lerpColor(one, two, percent, RGB));
  line(i, height/2, i, height);
}

for (int i = width/2; i < width; i++) {
  float percent = norm(i, width/2, width);
  
  stroke(lerpColor(two, three, percent, HSB));
  line(i, 0, i, height/2);
  
  stroke(lerpColor(two, three, percent, RGB));
  line(i, height/2, i, height);
}


textFont(createFont("sans serif", 20));
fill(255);
text("HSB", 20, height/4);
text("RGB", 20, 3*height/4);

