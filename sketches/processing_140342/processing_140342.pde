
int lineLenght = 100;

int[] x = new int[lineLenght];
int[] y = new int[lineLenght];
color[] c = new color[lineLenght];
int[] s = new int[lineLenght];

int counter = 0;


void setup() {
  size(600, 600);
  background(255);
  smooth();
}

int currentsize = 5;


void draw() {

  stroke(50, 50, 150);
  fill(150, 150, 255);

  //  if (keyPressed) {
  //    background ( random(0, 255), random (0, 255), random(0, 255) ) ;
  //  }


  int i = 0;

  while ( i < x.length) {
    fill(c[i]);

    ellipse( x[i], y[i], s[i], s[i] );

    i = i + 1 ;
  }


  if ( mousePressed ) {
    if ( counter >= x.length) {
      x = expand(x);
      y = expand(y);
      c = expand(c);
      s = expand(s);
    }
    x[counter] = mouseX;
    y[counter] = mouseY;
    s[counter] = currentsize;



    if (key == 'r') {
      c[counter] = color(240, 50, 0);
    }

    if (key == 'g') {
      c[counter] = color(50, 230, 0);
    }

    if (key == 'b') {
      c[counter] = color(0, 50, 230);
    }

    if ( keyPressed ) {
      if (key == 's') {
        currentsize = currentsize + 1;
      }
    }

    counter = counter + 1; // contar quantas vezes esta sendo desenhado
  }
}



