
Int num1 = 1;
Int num2 = 0;
Int num3 = 0;

Void setup() {
}

Void draw() {
num2++;
If (num1 % num2 == 0) {
counter++;
}
If (counter > 2) {
counter = 0;
num2 = 0;
num1++;
}
If (num2 == num1) {
num3 = num3 + num1;
num2 = 0;
num1++;
}
If (num1 == 1000) {
println(done);
println(num3);
Noloop();
}
}
