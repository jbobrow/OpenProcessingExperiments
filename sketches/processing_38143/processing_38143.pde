
void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 100);
  background(100);
}

void draw() {
  for (int x = 0; x <=  500; x= x+40) {
    for (int y = 0; y <= 500; y = y+40) {

     
      ellipse(x+10, y+10, 40, 40);//creates the first layer of circles
    }
    if (mousePressed==true) {
      for (int a = 0; a <=  500; a= a+40) {
        for (int b = 0; b <= 500; b = b+40) {
          fill(random(100));//fills circles with random grayscale
          ellipse(a-10, b-10, 40, 40);//creates the underlay of varying grayscale
        }
      }
    }
  }
}

//Drawing Machine
//The code results in a "machine" that draws a composition following a set of rules;
//1.create and shift two sets of circles within a grid
//2.with the click of the mouse change the circles grayscale
//3.with the same click disperse grayscale to underlay

