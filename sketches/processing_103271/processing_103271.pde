
//allen
//july,8 2013
//Keypress
//Reference: DMA Sample
void setup () {
size (1000,1000);
}
void draw() {
    background(255, 0, 0);
  if (keyPressed == true) {
    fill(0, 255, 0);
    textSize(60);
    text("Hello, What are you doing?", 100, 500);
  }
}
