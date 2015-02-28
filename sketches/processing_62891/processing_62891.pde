
float x, y, co = 0;
float sine, cose, sine2, cose2;
float mous, mousY;

void setup() {
  size(1000, 1000);
  background(255);
  colorMode(HSB, 100);
  strokeWeight(1);
  smooth();
  
}


void draw()  {
  fill(0, 10);
  rect(0,0, width, height);
  
sine = map(sin(x), -1, 1, 20, width - 20);
cose = map(cos(x), -1, 1, 20, height - 20);

sine2 = map(sin(y), -1, 1, 20, width - 20);
cose2 = map(cos(y), -1, 1, 20, height - 20);

stroke(co, 80, mous, 70);
line(sine, cose, sine2, cose2);

x = x + noise(0.01);
y = y + noise(1.9, 200);
co = map(sin(x), -1, 1, 0, 99);
mous = map(mouseX, 0, width, 0, 99);


if(co > 100)   {
  co = 0;
}


}
void mousePressed()  {
  save("beutiful_pattern.jpeg");
}

