
int lineLength = 100;

int [] x = new int[lineLength];
int [] y = new int[lineLength];

int [] c = new int[lineLength];

//int [] r = new int[lineLength];
//int [] g = new int[lineLength];
//int [] b = new int[lineLength];

int counter = 0;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {

  stroke(50, 50, 150);
  fill(150, 150, 225);

  if ( keyPressed ) {
    background( random(0, 255), random(0, 255), random(0, 255) );
  }

  int i = 0;
  while ( i < x.length ) {
    fill(c[i]);
    ellipse( x[i], y[i], 10, 10 );
    i = i + 1;
  }

  if ( mousePressed ) {
    if ( counter >= x.length) { 
      x = expand(x);
      y = expand(y);
      c = expand(c);
    }
    x[counter] = mouseX;
    y[counter] = mouseY;
    if ( key == 'r') {
      c[counter] = color(255, 0, 0);
    }
    if ( key == 'g') {
      c[counter] = color(0, 255, 0);
    }
    if ( key == 'b') {
      c[counter] = color(0, 0, 255);
    }
    

      counter = counter + 1;
  }
}



