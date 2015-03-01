
int xAxis = 100;
int yAxis = 100;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  rect(xAxis, yAxis, 50, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      yAxis += 10;
    }
  }
  background(255)  
}
