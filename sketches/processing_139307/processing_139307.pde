
int lineLength = 100;

int[] x = new int[lineLength];
int[] y = new int[lineLength];
color[] c = new color[lineLength];
int[] s = new int[lineLength];

int counter = 0; 

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {

  noStroke();


  if (keyPressed) {
    background(random(0, 255), random(0, 255), random(0, 255));
  }

  int i = 0;


  while (i< x.length) {

    fill(random(0, 255), c[i], random(0, 255), c[i]);
    ellipse( x[i], y[i], s[i], s[i] );

    i= i+1;
  }


  if ( mousePressed ) {
    if (counter >= x.length) {
      x = expand(x);
      y = expand(y);
      c = expand(c);
      s = expand(s);
    }

    x[counter] = mouseX;
    y[counter] = mouseY;
    c[counter]= counter % 255; // modulo
    s[counter]= counter % 90; // modulo

    /*
    if (key =='a') {
     
     c[i]= random(0, 255);
     }
     
     */
    counter = counter + 1;
  }
}

