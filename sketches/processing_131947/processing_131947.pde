
void setup(){
  size(1400, 900);
}

void draw(){
background(1);
int a = mouseX;
int b = mouseY;

fill(b + 31, a - 1,b / 6 + 8);

rect(b, b * 2, a, b * 2);
fill(a, b / 6 + 5, a + 29);
ellipse(a, b * 2, b * 2, b - 1);
fill(0, a + b / 2 + 5, a + 20);
triangle(30, b / 2 + 25, b / 2 + 5, b / 6, 86, b/ 2 + 25);

}
