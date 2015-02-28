

void setup() {
  size(600, 600);
}

void draw() {

  //for loop for gradient background
  for (int i = 0; i<width; i++) {
    for (int j = 0; j<height; j++) {
      stroke(255, map(i, 0, width, 209, 151), map(j, 150, height, 143, 0) );
      point(i, j);
    }
  }

  //for loop for ellipse
  for (int x=0; x<=20; x++) {
    for (int y=0; y<=20; y++) {
      stroke(random(255), random(255), random(255)); //this is the function for stroke color
      noFill();
      ellipse(x*40, y*40, 30, 30);
    }
  }

  //for loop for pattern shape
  int count = 120;
  for (int x = 50; x <= width-50; x += 20) {
    for (int y = 50; y <= height-50; y+=20) {
      float s = map(count, 120, 0, 0, TWO_PI*2);
      arc(x, y, 14, 14, s, s + PI);
      count--;
    }
  }
}

//the map function will be useful in extending your gradients to
//beyond 255
//it helps "map" a range of values to another range
//so for eg. if you had the number 3 and its in the range of 1-12
//but you want to see a equivalent value in a 1-24 range
//you would write map(3,1,12,1,24)
//the reference is http://processing.org/reference/map_.html


