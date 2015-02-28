
// PS_2 Question 1
//Milton Sukhabut

void setup() {
  size(500, 500);
  background(0);
}

color from = color(130, 30, 0);
color to = color(0, 122, 180);
void draw() {

  for (int x =0; x < height; x ++) {
    float atm = norm(x, 0, height);
    stroke(lerpColor(from, to, atm));
    rect(x, 0, x, width);
  }
}


