
//Diego Rodriguez, in class exercise, arrays.


int lineLength = 100;
int [] x = new int [lineLength];
int [] y = new int [lineLength];
color[] col = new color [lineLength];

int size = 50;
int counter = 0;

void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void draw() {

  stroke(50, 50, 150);
  fill(255);

  if ( mousePressed ) {
    ellipse( mouseX, mouseY, 10, 10 );
  }

  if (keyPressed) {
    background(random(0, 255), random(0, 255), random(0, 255));
  }

  int i = 0;
  while (i < x.length) {
    fill(col[i]);
    ellipse(x[i]+size, y[i]+size, size, size);
    
    i = i + 1;
  }
  
  if (mousePressed) {
    if (counter >= x.length){
      x = expand(x);
      y = expand(y);
      col = expand(col);
    }
    x[counter] = mouseX;
    y [counter] = mouseY;
    if (key == 'r'){
    col[counter] = color(255,0,0);
  }else if (key == 'b'){
    col [counter] = color(0,0,250);
  }
    counter = counter +5;
    
  }
  
  
}



