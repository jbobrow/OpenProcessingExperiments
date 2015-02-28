
void setup() {
  size(400,400);
  }
void draw() {
  float grade = random(0,100);
  background(grade);
if (grade > 90) {
  println("Assign letter grade A");
} else if (grade > 80) {
  println("Assign letter grade B");
} else if (grade > 70) {
  println("Assign letter grade C");
} else if (grade > 60) {
  println("Assign letter grade D");
} else {
  println("Assign letter grade E");
}
delay(100);
}
