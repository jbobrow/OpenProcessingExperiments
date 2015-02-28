
//EXAMPLE 2-A

void setup () {
  size (200,200);
}
void draw () {
  background(255);
  stroke(0);
  noFill();
  
  int i=0;
   
  while (i <10) {
    ellipse (width/2, height/2, i*10, i*10);
    i++;
  }
}




/*
EXERCISE 6-3: 

EXAMPLE 1-D

void setup () {
  size (200,200);
}
void draw () {
  background(255);
  stroke(0);
  noFill();
  for (int i = 0; i < 10; i++) {
    rect(i*20, height/2, 5, 5);
  }
}


EXAMPLE 3-B


void setup () {
  size (200,200);
}
void draw () {
  background(255);
  stroke(0);
  noFill();
  for (float i = 1.0; i < width; i*= 1.1) {
    rect(0, i, i, i*2);
  }
}





EXAMPLE 4-C

void setup () {
  size (200,200);
}
void draw () {
  background(255);
  stroke(0);
  noFill();
  
  int x=0;
   
  for (int c = 255; c > 0; c-= 15) {
    fill(c);
    rect(x, height/2, 10, 10);
    x = x +10;
  }
}




*/

