
//Move mouse throughout frame to change the density and profile of the flames
//Becomes more active and complex as it continues
int num =250; //num manipulates density in this case
int[] x = new int[num];
int[] y = new int[num];

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  fill(247, 79, 50, 6);
}

void draw() {
  background(0);
  frameRate(8);//very active frame- fluid movement of shapes
  for (int t = num-100; t > 0; t--) {//makes an ever-changing composition
    x[t] = x[t-1];

    y[t] = y[t-1];
  }
  x[40] = mouseY;
  y[10] = mouseY;

  for (int t = 10; t < num; t++) {
    rect(random(width), y[t], mouseX, mouseY);
  }
  for (int g = num-50; g > width; g--) {
    x[g] = x[g-1];

    y[g] = y[g-1];
  }
  x[10] = mouseY;
  y[50] = mouseY;

  for (int g = 100; g < num; g++) {
    rect(x[g], random(height/4), mouseX, y[g]/2);
    //determines the "dappled shadows" below
  }
}


