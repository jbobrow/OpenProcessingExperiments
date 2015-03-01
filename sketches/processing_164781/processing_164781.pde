
int y = 35;

void setup(){
size(300,300);
}

void draw() {
  background(y*y, y+50, y*3);
  line(10, 50, 300, 50);
   line(20, 100, 300, 50);
   line(30, 150, 300, 50);
  if (key == CODED) { 
    if (keyCode == UP) {
      y=20;
    } else if (keyCode == DOWN) {
      y=50; 
    }
  } else { 
    y = 35;
  }
  rect(25, y, 50, 30);
  ellipse(300, 50, y, 10); 
  fill(y*2, y+100, Y*y);
}



