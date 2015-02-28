
void setup(){
  size(255, 255);
  background(255);
}

void draw(){
  varRGB(mouseX, mouseY);
}

void varRGB(int x, int y){
  int r, g, b;
  r = x;
  g = x;
  b = x;
  print("colors: " + r, g, b + "\n");
  fill(r+g+b, y);
  noStroke();
  ellipse(x, y, 5, 5);
}
