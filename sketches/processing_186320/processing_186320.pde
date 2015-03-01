
int number_of_presses = 0;
void setup() {}
void draw() {
  background(180);
  text(number_of_presses, width/2, height/2);
}
void mousePressed() {
  number_of_presses = number_of_presses + 1;
  println("mouse pressed " + number_of_presses);
}
