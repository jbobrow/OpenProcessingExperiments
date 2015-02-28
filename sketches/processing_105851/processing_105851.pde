
int radius=110;//radius of the circles


void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB, 550);
  stroke(550);
}

void draw() {
  
  for (int i=0; i<550; i=i+50) {
    for (int j=0; j<550; j=j+50) {
      float dis=dist(mouseX,mouseY,0,0);;//distance of mouse
      fill(dis, j, 500, 100);
      ellipse(i, j, radius, radius);//loop the circles to create a pattern
    }
  }
  
}




