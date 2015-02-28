
float a = 10.0;

void setup() {
  size(600, 600);
  fill(0, 255, 0);
  cursor(CROSS);
}
//using random

//for (int x=0; x<width; x+=20) {
//  for (int y=0; y<height; y+=20) {
// int ran= int(random(97,123)); 
// text (char(ran), x, y);
//  }
//}

void draw() {
  background(0);

  for (int x=0; x<width; x+=20) {

    for (int y=0; y<height; y+=20) {
      a = mouseX + mouseY;
      int noi= int(map(noise(x+y/a), 0, 1, 97, 122)); 
      if (mouseX>x && mouseX<x+80 && mouseY>y && mouseY<y+80) { 
        fill(255); 
        pushMatrix();
        translate(2*x+textWidth(char(noi)),0);
        scale(-1, 1);
        text (char(noi), x, y);
        popMatrix();
      } 
      else {
        fill(0, 255, 0); 
        text (char(noi), x, y);
      }
    }
  }
}



