
float power = 100; //turbulence power
float d = 128;  //turbulence density
void setup(){
  size (400, 400);
  background(0);
  noStroke();

}
void draw(){
for (int y = 0; y < height; y++) {
  for (int x = 0; x < width; x++) {
    float total =0.0;
    for (float i = d; i >= 1; i = i/2.0) {
      total += noise(x/d, y/d) * d;
    }
    float turbulence = 128.0 * total /d;
    float base = (x * 0.2) + (y * 0.12);
    float offset = base + (power * turbulence / 256.0);
    float gray = abs(sin(offset)) * 20.0;
    stroke(gray);
    point(x,y);
  }
}
noStroke();
color c1 = color(126, 126, 0, 20);
fill(c1);
rect(0, 0, 200, 200);
rect(200, 200, 200, 200);
ellipse(300, 100, 100, 100);
ellipse(100, 300, 100, 100);

color c2 = color(0, 126, 255, 20);
fill(c2);
rect(20, 20, 160, 160);
rect(220, 220, 160, 160);

color c3 = color(126, 0, 255, 20);
fill(c3);
rect(40, 40, 120, 120);
rect(240, 240, 120, 120);

}

