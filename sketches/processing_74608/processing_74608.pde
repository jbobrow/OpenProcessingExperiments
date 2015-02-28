
float the_average;
void setup() {
//  println( average(9.442, 50, 40) );
  float the_average = average(490, 30, -39);
  println(the_average);
  println( random(30, 45) );
}

void draw() {
  background(200);
  if ( onRightSide(mouseX) ) {
    rect(40, 20, 10, 400);
  }
}

int add_Em_Up(int number_1, int number_2) {
  int added = number_1 + number_2;
  return added;
}
Boolean onRightSide(int mX) {//returns true if the passed in value is greater than half the screen
  if (mX > width/2) {
    return true;
  }else {
    return false;
  }
}
float average(float num1, float num2, float num3) {
  float added = num1 + num2 + num3;
  added = added / 3;
  return added;
}
