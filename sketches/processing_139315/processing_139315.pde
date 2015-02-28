
int lineLength = 100;
int[] x = new int [lineLength] ;
int[] y = new int [lineLength] ;
color[] c = new color [lineLength] ;
int[] s = new int [lineLength];
int counter = 0;


void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw () {
  noStroke();
  fill (222,222,222);
  
  

  if (keyPressed) {
    background( random(0, 255), random(0, 255), random(0, 255) );
  }

  int i = 0;
  while ( i < x.length ) {
   fill (c[i]);
    ellipse(x[i], y[i], 40, 40);
    i = i+ 1;
  }
 
 
  if ( mousePressed ) {
    if (counter >= x.length) {
      x = expand(x);
      y = expand(y);
      c = expand(c);
    }

   
    x[counter] = mouseX;
    y[counter] = mouseY;

    
    if (key == 'r') {
      c[counter] = color(185, 185 ,185,15);
    }
     if (key == 'b') {
      c[counter] = color(131, 131 ,131,15);
    }
    if (key == 'g') {
      c[counter] = color(67,67,67,15);
    }




    counter = counter + 1;
  }
}



