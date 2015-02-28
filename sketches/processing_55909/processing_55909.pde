
/** relating to the bars*/
float bar = 50;
float x = 0;
float y = 0;
float stage = 0;
float col = 0;

void setup () {
  size(500, 500);
}

void draw () {


  stroke(mouseX-col, mouseY-col, mouseY+col);

  if (stage == 0) {
    x = x+1;
    col = col+0.5;
  }
  else if (stage == 1) {
    x = x-1;
    col = col+0.5;
  }

  if (x == 0) {
    stage = 0;
    col = 0;
  } 
  else if (x == 500) {
    stage = 1;
    col = 0;
  }

  line(x, y, x, (y+bar));
  line(x, 2*bar, x, 3*(y+bar));
  line(x, 4*bar, x, 5*(y+bar));
  line(x, 6*bar, x, 7*(y+bar));
  line(x, 8*bar, x, 9*(y+bar));

  line((500-x), (y+bar), (500-x), 2*(y+bar));
  line((500-x), 3*(y+bar), (500-x), 4*(y+bar));
  line((500-x), 5*(y+bar), (500-x), 6*(y+bar));
  line((500-x), 7*(y+bar), (500-x), 8*(y+bar));
  line((500-x), 9*(y+bar), (500-x), 10*(y+bar));
}


