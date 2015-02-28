
//Inspired by Theo van Doesburg. Color appear when mouse is on the right side of the window.

void setup() {
  size(300, 300);
  background(230, 230, 200);
}

void draw() {
  if (mouseX > width/2) {

    //red rect
    fill(255, 0, 0);
    rect(height*1/8, width*3/8, width*3/8, height*1/2);

    //blue rect
    fill(0, 0, 255);
    rect(width/2, height*3/8, width*3/8, height*3/8);

    //yellow rect
    fill(255, 255, 0);
    rect(width/2, height*1/8, width*3/8, height*2/8);

    //white rects
    fill(255, 255, 255);
    rect(width*1/8, height*1/8, width*3/8, height*2/8);

    rect(width/2, height*6/8, width*3/8, height*1/8);
  }
  else {

    background(230, 230, 200);
    strokeWeight(4);
    line(width*1/8, 0, width*1/8, height);
    line(width*7/8, 0, width*7/8, height);
    line(width/2, 0, width/2, height);
    line(0, height*3/8, width, height*3/8);
    line(width*1/8, height*1/8, width*7/8, height*1/8);
    line(width*1/8, height*7/8, width*7/8, height*7/8);
    line(width/2, height*6/8, width*7/8, height*6/8);
  }
}


