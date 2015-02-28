
//My First Function
//Nested for loops with gradient


void setup() {
  size(200, 400);
  colorMode(HSB, width);
}

void draw() {

  for(int y = 0; y < height; y++) {  
    for(int x = 0; x < width; x++) {
//        stroke(255-(x+y)/2, 255-(x+y)/2, 255-(x+y)/2);
        stroke(x, y, height-y);
        point(x, y);
    }
  }
}




