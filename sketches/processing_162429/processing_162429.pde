
int z = 255;
int x = 300;
int y = 300;
int a = 0;
void setup() {
  size(600, 600);
}

void draw() {
  monster(x, y);
}

void monster(int x, int y) {
  background(255);
  fill(0);
  stroke(0);
  rect (x, y, 70, 70);
  triangle(x+10, y+70, x+20, y+70, x+15, y+81);
  triangle(x+50, y+70, x+60, y+70, x+55, y+81);
  triangle(x, y+25, x, y+45, mouseX- 100, mouseY);
  triangle(x+70, y+25, x+70, y+45, mouseX+100, mouseY);
  stroke(255);
  line(x+10, y+40, x+60, y+40);
  fill(a);
  noStroke();
  rect(x+10, y+41,51,10);
  fill(0);
  fill(z);
  noStroke();
  ellipse(x+10, y+10, 10, 10);
  ellipse(x+60, y+10, 10, 10);
 
}
void keyPressed() {
  if (key == 'o') {
    z = 255;
  }
  if (key == 'p') {
    z = 0;
  }
  if(key == 's') {
    y += 10;
  }
  if(key == 'w') {
    y -= 10;
  }
  if(key == 'd') {
    x += 10;
  }
  if(key == 'a') {
    x -= 10;
  }
  if (key == 'b') {
    a = 255;
  }
  if(key == 'v') {
    a = 0;
  }
    
}

