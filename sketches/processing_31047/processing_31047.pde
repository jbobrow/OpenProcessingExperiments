
//based on Dan Shiffman's sketch

void setup() {
  size(500, 200);
  smooth();
  noStroke();
  background(255);

  cantor(0, 0, width);
}

void draw() {
  noLoop();
}

void cantor(float x, float y, float len) {
  
  float h = 30;
  
  // recursive exit condition
  if (len >= 1) {
    // Draw line (as rectangle to make it easier to see)
    noStroke();
    fill(map(len, 0,width, 100,255),100,100);
    rect(x, y, len, h/3);
    // Go down to next y position
    y += h;
    // Draw 2 more lines 1/3rd the length (without the middle section)
    cantor(x, y, len/3);
    cantor(x+len*2/3,y, len/3);
    //cantor(x+len*2/5, y, len*3/5);
    
  }
}


void keyPressed(){
  if(key == 's' || key == 'S'){
    saveFrame();
  }
}

