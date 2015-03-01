
float x = 0;
float y = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  point(x * 200 + 25, 225 - y * 200);
  int which = (int) random(0, 3);
  if (which == 0) {
     x = x * 0.5;
     y = y * 0.5;
  } else if (which == 1) {
     x = x * 0.5 + 0.5;
     y = y * 0.5;
  
  } else if (which == 2) {
     x = x * 0.5 + 0.25;
     y = y * 0.5 + 0.5;
  }
}
