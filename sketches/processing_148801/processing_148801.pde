
int screensize = 600;
int squaresize = 50;
int numsquares = screensize/squaresize;
Square squares[][] = new Square[numsquares][numsquares];
int stepsize = 30;
float cur_x, cur_y, step_x, step_y, new_x, new_y;
boolean stroke_w = true;
boolean gridWhite = true;
boolean gridHide = false;
int incr = 5;

void setup() {
  size(screensize, screensize);
  colorMode(HSB);
  background(0, 0, 0);
  stroke(0, 0, 255);
  cur_x = width/2;
  cur_y = height/2; 
  initArray();
}

void initArray() {
  for (int i = 0; i < numsquares; i++) {
    for (int j = 0; j < numsquares; j++) {
      squares[i][j] = new Square(i*squaresize, j*squaresize, squaresize);
    }
  }
}

void draw() {

  for (int i = 0; i < numsquares; i++) {
    for (int j = 0; j < numsquares; j++) {
      squares[i][j].display();
    }
  }

  strokeWeight(5);
  step_x = random(-stepsize, stepsize);
  step_y = random(-stepsize, stepsize);
  new_x = cur_x + step_x;
  new_y = cur_y + step_y;

  for (int i = 0; i < numsquares; i++) {
    for (int j = 0; j < numsquares; j++) {
      line(cur_x, cur_y, new_x, new_y);
      if (squares[i][j].is_in(new_x, new_y)) {
        squares[i][j].touched = true;
        squares[i][j].display();

        if (squares[i][j].c_hue >= 255) {  // if c_hue = 255, start decrementing c_sat

          if (squares[i][j].c_sat <= 0) {
            //squares[i][j].c_bright -=incr;  // comment out this line to end with a white screen rather than a black grid
          } else {
            squares[i][j].c_sat -=incr;
          }
        } else {
          squares[i][j].c_hue +=incr;
        }
      }
    }
  }

  if (new_x > width) { 
    new_x = width;
  }
  if (new_x < 0) { 
    new_x = 0;
  }
  if (new_y > height) { 
    new_y = height;
  }
  if (new_y < 0) { 
    new_y = 0;
  }

  cur_x = new_x;
  cur_y = new_y;
}

void mousePressed() {
  cur_x = mouseX;
  cur_y = mouseY;
}

void keyPressed() {
  if (key == '1') {
    newSize(10);
  } else if (key == '2') {
    newSize(20);
  } else if (key == '3') {
    newSize(30);
  } else if (key == '4') {
    newSize(40);
  } else if (key == '5') {
    newSize(50);
  } else if (key == '6') {
    newSize(60);
  } else if (key == '0') {
    newSize(100);
  } else if (key == '-') {
    stepsize-=1;
  } else if (key == '=') {
    stepsize+=1;
  } else if (key == '[') {
    stroke(0, 0, 0);
    stroke_w = false;
  } else if (key == ']') {
    stroke(0, 0, 255);
    stroke_w = true;
  } else if (key == '7') {
    incr = 1;
  } else if (key == '8') {
    incr = 5;
  } else if (key == '9') {
    incr = 10;
  } else if (key == 'g') {
   gridWhite = !gridWhite;
  } else if (key == 'h'){
   gridHide = !gridHide; 
  }
}

void newSize(int sqsize) {
  squaresize = sqsize;
  numsquares = screensize/squaresize;
  squares = new Square[numsquares][numsquares];
  initArray();
}



class Square {
  int x;
  int y;
  int size;
  int c_hue;
  int c_sat;
  int c_bright;
  boolean touched;

  Square(int _x, int _y, int _size) {
    x = _x;
    y = _y;
    size = _size;
    c_hue = 0;
    c_sat = 255;
    c_bright = 255;
    touched = false;
  }

  void display() {
    strokeWeight(1);
    
    if (!gridHide) {
      if (gridWhite) {
        stroke(0, 0, 255);
      } else {
        stroke(0, 0, 0);
      }
    } else {
     noStroke(); 
    }
    
    if (touched) {
      fill(c_hue, c_sat, c_bright);
    } else {
      fill(0, 0, 0);
    }
    rect(x, y, size, size);
    if (!stroke_w) {
      stroke(0, 0, 0);
    } else {
      stroke(0, 0, 255);
    }
  }

  boolean is_in(float px, float py) {
    if (px > x && px < x+size && py > y && py < y+size) {
      return true;
    } else {
      return false;
    }
  }
}

