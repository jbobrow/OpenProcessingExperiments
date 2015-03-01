
int x = 0;  // x location of square
int y = 0;  // y location of square

int speed = 2;  // speed of square

int state = 0;  
  
int x2 = 9;  // x location of square
int y2 = 9;  // y location of square

int speed2 = 3;  // speed of square
int state2 = 0; 
int x3 = 18;  // x location of square
int y3 = 18;  // y location of square

int speed3 = 2;  // speed of square
int state3 = 0;  

int x4 = 27;  // x location of square
int y4 = 27;  // y location of square

int speed4 = 3;  // speed of square
int state4 = 0;  

int x5 = 36;  // x location of square
int y5 = 36;  // y location of square

int speed5 = 2;  // speed of square
int state5 = 0;  

  
int x6 = 45;  // x location of square
int y6 = 45;  // y location of square

int speed6 = 2;  // speed of square
int state6 = 0;  



void setup() {
  size(200,200);
  background(255);
  ellipseMode(CENTER);
  
}

void draw() {
 

  // Display the square
  stroke(0);
  fill(0);
  rect(x,y,9,9);

  // If the state is 0, move to the right.
  if (state == 0) {
      y = y + speed;
    if (y > height-x) {
      y = height-10;
      state = 1;
    }
  } else if (state == 1) {
  x = x + speed;
    if (x > width-10 ) {
      x = width-10;
      state = 2;
    }
  } else if (state == 2) {
     y = y - speed;
    if (y < 0) {
      y = 0;
      state = 3;
    }
  } else if (state == 3) {
    x = x - speed;
    if (x < 0) {
      x = 0;
      state=0;
    }
  }


  stroke(0);
  fill(0,0,200);
  rect(x2,y2,9,9);

  if (state2 == 0) {
    x2 = x2 + speed2;
    if (x2 > width-20) {
      x2 = width-20;
      state2 = 1;
    }
  } else if (state2 == 1) {
    y2 = y2 + speed2;
    if (y2 > height-20) {
      y2 = height-20;
      state2 = 2;
    }
  } else if (state2 == 2) {
    x2 = x2 - speed2;
    if (x2 < 10) {
      x2 = 10;
      state2 = 3;
    }
  } else if (state2 == 3) {
    y2 = y2 - speed2;
    if (y2 < 10) {
      y2 = 10;
      state2=0;
    }
  }
  
  



  stroke(0);
  fill(0);
  rect(x3,y3,9,9);

  if (state3 == 0) {
      y3 = y3 + speed3;
    if (y3 > height-30) {
      y3 = height-30;
      state3 = 1;
    }
  } else if (state3 == 1) {
  x3 = x3 + speed3;
    if (x3 > width-30 ) {
      x3 = width-30;
      state3 = 2;
    }
  } else if (state3 == 2) {
     y3 = y3 - speed3;
    if (y3 < 20) {
      y3 = 20;
      state3 = 3;
    }
  } else if (state3 == 3) {
    x3 = x3 - speed3;
    if (x3 < 20) {
      x3 = 20;
      state3=0;
    }
  }
  


  stroke(0);
  fill(0,0,200);
  rect(x4,y4,9,9);

  if (state4 == 0) {
    x4 = x4 + speed4;
    if (x4 > width-40) {
      x4 = width-40;
      state4 = 1;
    }
  } else if (state4 == 1) {
    y4 = y4 + speed4;
    if (y4 > height-40) {
      y4 = height-40;
      state4 = 2;
    }
  } else if (state4 == 2) {
    x4 = x4 - speed4;
    if (x4 < 30) {
      x4 = 30;
      state4 = 3;
    }
  } else if (state4 == 3) {
    y4 = y4 - speed4;
    if (y4 < 30) {
      y4 = 30;
      state4=0;
    }
  }
  

  stroke(0);
  fill(0);
  rect(x5,y5,9,9);

  if (state5 == 0) {
      y5 = y5 + speed5;
    if (y5 > height-50) {
      y5 = height-50;
      state5 = 1;
    }
  } else if (state5 == 1) {
  x5 = x5 + speed5;
    if (x5 > width-50 ) {
      x5 = width-50;
      state5 = 2;
    }
  } else if (state5 == 2) {
     y5 = y5 - speed5;
    if (y5 < 40) {
      y5 = 40;
      state5 = 3;
    }
  } else if (state5 == 3) {
    x5 = x5 - speed5;
    if (x5 < 40) {
      x5 = 40;
      state5=0;
    }
  }



  stroke(0);
  fill(0,0,200);
  rect(x6,y6,9,9);

  if (state6 == 0) {
    x6 = x6 + speed6;
    if (x6 > width-60) {
      x6 = width-60;
      state6 = 1;
    }
  } else if (state6 == 1) {
    y6 = y6 + speed6;
    if (y6 > height-60) {
      y6 = height-60;
      state6 = 2;
    }
  } else if (state6 == 2) {
    x6 = x6 - speed6;
    if (x6 < 50) {
      x6 = 50;
      state6 = 3;
    }
  } else if (state6 == 3) {
    y6 = y6 - speed6;
    if (y6 < 50) {
      y6 = 50;
      state6=0;
    }
  }
}
void mousePressed() {
  mouseButton=CENTER;
  stroke(0);
  fill(0,210,0,200);
  int count = 0;
  float spacing = -20;
  while (count < 3){
    count++;
    spacing = spacing + 10;
    ellipse(mouseX-spacing, mouseY, 10, 10);
    triangle(mouseX-spacing,mouseY,20,40,40,20);
  }
}


void keyPressed() {
  //background(255);
}

