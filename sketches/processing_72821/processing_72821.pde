
void setup() {
size(700, 700);
background(46, 46, 46);
smooth();
frameRate (9);
}

void draw () {
background(46, 46, 46);

//circles & lines
for (int y = 20; y <= height-20; y+= 20) {
  for (int x = 20; x <= width-20; x += 20) {
    //white circles
    fill(255);
    stroke(102);
    ellipse (x + y - 20, y, 14 - y/25.0, 14 - y/25.0);
    ellipse (y, x + y - 20, 14 - y/25.0, 14 - y/25.0);
    
    //lines towards mouse
    stroke(5, 5, 5, 80);
    line(x * 2 - 500, y * 2 - 500, mouseX, mouseY);
    
    //clean border
    fill(46, 46, 46);
    noStroke();
    rect(0, 690, width, 20);
    rect(690, 0, 20, height);
    rect(0, 0, 9, height);
    rect(0, 0,   width, 9);
     }
  }
}


