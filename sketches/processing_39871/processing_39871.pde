
int num = 300; //number of circles

//create arrays
float []x = new float [num]; //x-coordinate
float []y = new float [num]; //y-coordinate
float []s = new float [num]; //circle speed
color []c = new color [num]; //cicle color

void setup () {
  size (300, 300);
  colorMode (HSB, 300);
  smooth ();

  //seed the array
  for (int i=0; i < num; i++) {
    x[i] = random (width);
    y[i] = random (height);
    s[i] = random (0.5, 5);
    c[i] = color(255);
  }
}

void draw () {
  background (0);

  for (int i=0; i<num; i++) {

    //draw circle
    ellipseMode(CENTER);
    stroke (c[i]);
    strokeWeight(random(1,3));
    fill (0);
    ellipse (x[i], y[i], random(width/2), random(height/2));

    //update circle's variables in the array
    x[i] = x[i/3] + s[i];
      if (x[i/3] > width + 50 ) {
      x[i] = 1;
    }
  }
}


