
//Intro to Creative Programming
//Assignment - Perspective Shift Mod
//Sang Un Jeon

float speed = 2.5;
float x;
float y;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
}

void draw() {
  stroke(0,0,0,0);
  x+= random(-speed, speed);
  y+= random(-speed, speed);
  for (int t = 0; t < 800; t+=80) {
    fill(#D5E6DA, 50);
    for (int i = 0; i < 800; i+=100) {
      triangle(50+i, 0+t, 100+i, 80+t, 0+i, 80+t);
    }

    fill(#FFFFFF, 50);
    for (int i = -100; i < 800; i+=100) {
      triangle(50+i*x, 0+t*y, 150+i, 0+t, 100+i, 80+t);
    }
  }

  int x = 0;
  int y = 0;
  int w = 800;
  int h = 80;

  for (int p = 0; p < 800; p+=80) {
    if ((mouseX > x) && (mouseX < x+w) && (mouseY > y+p) && (mouseY < y+h+p)) {
      fill(#FF8B00, 50);

      for (int i = 0; i < 800; i+=100) {
        triangle(50+i, 0+p, 100+i, 80+p, 0+i, 80+p);
      }
    }
  }
  stroke(#FF8B00);
    
    //when the mouse don't find the right spot
 
      for (int i = -60; i < 1200; i += 5) {
  line(i-60, mouseX*5-300, i + 60, mouseX*5-450);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, mouseX*5, i + 60, mouseX*5-150);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, mouseX*5+300, i + 60, mouseX*5+150);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, mouseX*5+600, i + 60, mouseX*5+450);
}

for (int i = -60; i < 1200; i += 5) {
  line(mouseY*5-300, i-60, mouseY*5-450, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(mouseY*5, i-60, mouseY*5-150, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(mouseY*5+300, i-60, mouseY*5+150, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(mouseY*5+600, i-60, mouseY*5+450, i+60);
}

  
}
