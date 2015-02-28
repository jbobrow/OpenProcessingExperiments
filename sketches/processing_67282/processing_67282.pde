
PFont myFont;

void setup() {
  size(634, 500);
  myFont = createFont("Avenir-Light", 58);
  background(200);

for (int i=0;i< 600; i=i+28) {
    for (int j=0; j<600; j=j+28) {
      fill(random(100,150),40,40);
      textFont(myFont, 55);
      text("O", i, j);  
    }
  }
}

