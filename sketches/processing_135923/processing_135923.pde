
int x = 0;
int y = 0;
int rect1 = 0;
int twodirection = 5;


void setup() {
  size(600, 600);
  smooth();
  noStroke();
}


void draw () {
  background(0);
  //moving square
  fill(225);
  if (y >= 550) {
    fill( 225, random(0, 200), 0);
    y= 550;
  }
  rect(x, y, 50, 50);
  if (x > 550) {
    x = 0;
  }
  else if ( x < 0) {
    x = 0;
  }


  else if (y < 0) {
    y = 0;
  }


  if (keyPressed) {
    if ( key == 's') {
      x = x+2;
    }
    if (key == 'a') {
      x = x-2;
    }
    if (key =='c') {
      y= y+2;
    }
    if (key == 'd') {
      y = y-2;
    }
  }

  rect (0, 100, 300, 10);
  rect (400, 100, 300, 10);
  rect ( 0, 200, 100, 10);
  rect (200, 200, 400, 10);
  rect ( 0, 300, 500, 10);
  rect (300, 400, 300, 10);

  //bouncingrectangle
  rect(rect1, 400, 50, 50);
  rect1 = rect1 + twodirection;

  if (rect1 > 200) {
    twodirection= -5;
  }
  else if (rect1 < 0) {
    twodirection = 5;
  }

  if (x >= rect1 && x <= rect1+5 && y >= 400 && y<= 450) {
    x = 0;
    y = 0;
  }

  if ( x>=0 && x <=300 && y>= 50 && y <= 60) {
    x=0;
    y=0;
  } 
  if ( x >= 400 && x <= 600 && y >= 50 && y <=60) {
    x=0;
    y=0;
  } 
  if ( x>= 0 && x <= 100 && y >= 150 && y<=160) {
    x=0;
    y=0;
  }

  if ( x>= 200 && x <= 600 && y>=150 && y<=160) {
    x=0;
    y=0;
  }
  if (x >=0 && x<=500 && y>=250 && y<= 260) {
    x=0;
    y=0;
  }

  if (x >= 300 && x<= 600 && y >=350 && y<=360) {
    x=0;
    y=0;
  }
  
}



