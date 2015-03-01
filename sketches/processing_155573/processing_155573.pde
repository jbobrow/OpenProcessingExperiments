
float incr_x, incr_y, x, y, r;
int countLine = 0; // how many lines in a (vertical) row?
int countCross = 0; // how many crosses in a (vertical) row?
int margin = 5;
int counter = -1;
int isX[] = {
};
int val;
int steps_x, steps_y; // number of rows and columns
int max = 4; // max number of symbols in a row, vertically!

void setup() {
  size(500, 500);
  stroke(0);
  strokeWeight(12);
  strokeCap(SQUARE);

  steps_x = 10; //number of columns
  steps_y = 12; //number of lines

  incr_x = width/float(steps_x);
  incr_y = height/float(steps_y);

  drawPattern();
}

void draw() {
}

void drawPattern() {
  background(255);
  for (x = 0; x < width; x += incr_x) {
    for (y = (incr_y)/2; y < height; y += incr_y) {
      counter += 1;
      r = random(1);
      if (counter>2*steps_y-1) {
        if (isX[counter-2*steps_y]+isX[counter-steps_y]== 2) {
          val = 0;
        } 
        else if (isX[counter-2*steps_y]+isX[counter-steps_y]== 0) {
          val = 1;
        } 
        else {
          if (r >0.6) {
            val = 1;
          } 
          else {
            val = 0;
          }
        }
      } 
      else {
        if (r >0.5) {
          val = 1;
        } 
        else {
          val = 0;
        }
      }
      if (countLine == max) {
        val = 1;
      }
      if (countCross == max) {
        val = 0;
      }
      isX = append(isX, val);
      if (isX[counter] == 1) {
        isCross();
      } 
      else {
        isLine();
      }
    }
  }
}


void mouseClicked() {
  drawPattern();
}

void isCross() {
  line(x+10, y+(incr_y)/2-margin, x+(incr_x) - margin, y-(incr_y)/2 +margin);
  line(x+10, y-(incr_y)/2+margin, x+(incr_x) - margin, y+ (incr_y)/2 -margin);
  countCross += 1;
  countLine =0;
}

void isLine() {
  line(x +margin, y, x + (incr_x)-margin, y);
  countCross = 0;
  countLine +=1;
}

