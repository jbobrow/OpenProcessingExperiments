
int d = 10;
int h = 60;
 
void setup() {
  size(600, 100);
  smooth();
}
 
void draw() {
  background(128);  
  int counter = 0;
  while( counter <= width ) {
    rect(counter, height/5, d, h);
    counter = counter + d; 
  }
}

void keyPressed() {
  saveFrame("PS1_06image.jpeg");
}

