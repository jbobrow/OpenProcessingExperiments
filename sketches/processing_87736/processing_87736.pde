
float xpos=0; 
float ypos=0;

void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
  for (float x=xpos; x>=0 && x<=width; x+=10) {
    for (float y=ypos; y>=0 && y<=height; y+=10) {
      noStroke();
      fill(random(x,255),random(200,255),random(x,y),50);
      triangle(x,height/2, x+50, height/2+y, x,y);
    }
  }
}



