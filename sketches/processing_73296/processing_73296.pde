
int x=0;
int y=0; 

void setup() {
  size(800, 600);
  frameRate(3);
}

void draw() {
  background(255);

  if (mouseX>100) {
    colorMode(HSB);
    for (int i=0; i<width; i++) {
      for (int d=height; d>0; d-=5) {
        noFill();
        stroke(321, i*2.5, 204);
        ellipse(width/2, height/2, d, d);
      }
    }
  }
      if(mouseX>300){
        background(255);
          rect(width/2, height/2, 100, 100);
        }
      
      
  fill(0);
  stroke(0);
  line(0, 100, width, 100);
  ellipse(mouseX, 100, 10, 10);
}






