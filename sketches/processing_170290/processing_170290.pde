
void setup() {
 size(600,600); 
 colorMode(HSB);
}

void draw() {
 float a = 0, b = 0, c = 0;
 for(int i = 0; i < height; i+=10) {
  for(int j = 0; j <width; j+=10) {
    stroke(sin(noise(a)), sin(noise(b))*255, sin(noise(c))*255);
    fill(sin(noise(a)), sin(noise(b))*255, sin(noise(c))*255);
    rect(i,j,i+10,j+10);
    a++;
    b++;
    c++;
  }
 }
}
