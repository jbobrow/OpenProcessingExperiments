
Int num1 = 1;
Int num2 = 0;
Int num3 = 0;
Int counter = 0;
string d = "done";

Void setup() {
size(480,720);
Background(255,0,0);
}

Void draw() {
background(255,0,0);
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
print(d, 50,50);
print(num3,50,50);
noloop();
}
}
