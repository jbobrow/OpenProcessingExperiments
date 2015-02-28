
void setup() {
  size(500, 500);
  background(30);//dark grey background (inital)
  smooth();
}

void draw () {
  if (mousePressed == true) {
    background(30);
    for (int x = 0; x < 25; x++) {
      float r = random(width/2);
      float s = random(height/2);
      float t = random(height);
      float u = random(width);
      
      noStroke();
      fill(200, 0, 25, 50);//red, 50% opacity
      ellipseMode(CENTER);
      ellipse(r, t, 30, 30);//draws red circles on the left 1/2 of the page
      fill(247, 247, 247, 50);//change color to white, 50% opacity
      ellipse(u, s, 30, 30);//draws white circles across top 1/2 of the page
    }
    for (int y = 0; y< 25; y++) {
      float plusW = random(width/2);
      float H = random(height);
      float plusH = random(height/2);
      float W = random(width);
      fill(242, 105, 42, 50);//change color to orange
      ellipse(plusW + width/2, H, 30, 30);
      fill(230, 240, 83, 50);//change color to yellow
      ellipse(W, plusH+height/2, 30, 30);
    }
  }
}


