
//Intro to Creative Programming
//Assignment 2
//Sang Un Jeon


int x = 30;
int y = 30;
int w = 15;
int h = 15;

void setup() {
  size(800,800);
  smooth();
}

void draw() {
  background(204);
  //When the mouse finds the right spot
  if ((mouseX > x) && (mouseX < x+w) && (mouseY > y) && (mouseY < y+h)) {
for (int i = -60; i < 1200; i += 5) {
  line(i-60, 200, i + 60, 50);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, 500, i + 60, 350);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, 800, i + 60, 650);
}

for (int i = -60; i < 1200; i += 5) {
  line(i-60, 1100, i + 60, 950);
}

for (int i = -60; i < 1200; i += 5) {
  line(200, i-60, 50, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(500, i-60, 350, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(800, i-60, 650, i+60);
}

for (int i = -60; i < 1200; i += 5) {
  line(1100, i-60, 950, i+60);
}

//in-between pattern



stroke(239,65,54,100);

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 280, i + 60, 270);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 580, i + 60, 570);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, 880, i + 60, 870);
}

for (int i = -60; i < 1200; i += 20) {
  line(280, i-60, 270, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(580, i-60, 570, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(880, i-60, 870, i+60);
}

    
    
    //when the mouse don't find the right spot
  } else {
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

//in-between pattern

stroke(95,203,241,100);
for (int i = -60; i < 1200; i += 20) {
  line(i-60, mouseY*5-220, i + 60, mouseY*5-230);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, mouseY*5+80, i + 60, mouseY*5+70);
}

for (int i = -60; i < 1200; i += 20) {
  line(i-60, mouseY*5+380, i + 60, mouseY*5+370);
}

for (int i = -60; i < 1200; i += 20) {
  line(mouseX*5-220, i-60, mouseX*5-230, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line( mouseX*5+80, i-60, mouseX*5+70, i+60);
}

for (int i = -60; i < 1200; i += 20) {
  line(mouseX*5+380, i-60, mouseX*5+370, i+60);
}

    
    
    
    
    
    
    
  }
  
}
