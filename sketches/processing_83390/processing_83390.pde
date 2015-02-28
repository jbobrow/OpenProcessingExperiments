
void setup() {
size (800, 600);
noStroke();

}
void draw() {
  
  int fattoreX = width/255;
  int fattoreY = height/255;
  int R = mouseX/fattoreX;
  int G = mouseY/fattoreY;

fill(R, G, 0);
rect(0, 0, width, height);
}
