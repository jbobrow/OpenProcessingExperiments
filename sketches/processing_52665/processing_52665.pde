
void setup() {
  size(600, 600);
  background(158, 195, 211);
  smooth();
  {
    fill(157, 73, 73);
    quad(0, 300, 300, 0, 600, 300, 300, 600);
  }

  int counter = 0;
  while (counter < 120) {
    //void octogon(int sides, float radius, float xPos, float yPos){
    createPoly(0.0, 60, 250, 16);
    counter = counter +1;
    //void drawFourCircles(int distance, int size){
    drawFourCircles(10+counter, 10+counter);
    counter = counter +1;
  }
}


