

void setup() {
  size(500, 500);
  background(5);
  ellipseMode(RADIUS);
}

  //trying to create a pattern that 
  //interacts with the mouse by increasing radious of ellipse if dist
  //to pointer <10


void draw() {
  
  background(5);
  
    for (int a = 20; a<width; a+=20) {
      for (int b = 20; b<height; b+=20) {
        stroke(240);
        strokeWeight(1);
        fill(random(200), random(200), random(200));
        int s=5;
        if (dist(mouseX, mouseY, a, b)<40) {
        s=30;
        
       }
          ellipse(a, b, s, s);
      }
    }
  }




