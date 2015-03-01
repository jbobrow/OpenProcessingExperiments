
void setup () {
  size(600, 600);
  smooth();
}

void draw () {
  background(#57385c);
  fill(#ffedbc);
  stroke(#A75265);
  int num = (int) map (mouseY, 0, height, 100, 5000);
  int i = 0;
  while (i < num) {
    float a = TWO_PI / num * i;
    float x = width/2 + cos(a) * 180;
    float y = height/2 + sin(a) * 180;
    
    int numberOfRotations = (int) map(mouseX, 0, width, 0, 50); 
    float a2 = numberOfRotations * TWO_PI / num * i;
    x = x + cos(a+a2) * 50;
    y = y + sin(a+a2) * 50;
    
    ellipse(x, y, 6, 6);
    i = i + 1;
  }
}
