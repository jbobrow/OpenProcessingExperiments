


void setup () {
  size(800, 600);
  background(255);
  noStroke();
}

void draw () {
  int gridSize = 100;
  int R = 255*mouseX/800;
  int B = 255*mouseY/600;
  int G = int(random(100,200));
background(255);

  for (int x = gridSize; x <= width - gridSize; x += gridSize) {
    for (int y = gridSize; y <= height - gridSize; y += gridSize) {
      fill(R,B,G);
      triangle(x, y-20, x-20, y+20, x+20, y+20);
      fill(B,R,G);
      ellipse(x,y+5,20,20);
      stroke(0, 150);
      line(x,y-5,x,y+15);
      line(x,y,int(random(1,8))*100,int(random(1,6))*100);
      
    }
  }
}



