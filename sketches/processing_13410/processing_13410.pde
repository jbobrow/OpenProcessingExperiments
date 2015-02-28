

void setup()
{size(400, 400);
smooth();
noStroke();
background(255, 185, 169);
  for(int y = 0; y <=height; y +=40) {
    for(int x = 0; x <=width; x +=40) {
        fill(255, 140);
        ellipse(x, y, 40, 40);
  }
  }
}

void draw(){
ellipse(mouseX, mouseY, 40, 40);
}

