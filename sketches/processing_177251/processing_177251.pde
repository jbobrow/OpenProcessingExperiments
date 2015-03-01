
color[] palette = {
  #572107, #9f310e, #f15a23, #f57921, #fc9b18
};
float theta; 
int dir,frames=240;

void setup() {
  size(500, 300);
}


void draw() {
  int i=0;
  for (int x=0; x<width; x+=100) {
    noStroke();
    fill(palette[i]);
    rectMode(CORNER);
    rect(x, 0, x+100, height);
    if (i<4) {
      float sz = 50+i*15;
      fill(20);
      rectMode(CENTER);
      pushMatrix();
      translate(x+100, height/2);
      dir=i%2==0?1:-1; 
      rotate(theta*dir);
      fill(255);
      rect(0, 0, sz*1.1, sz*1.1, 5);
      fill(20);
      rect(0, 0, sz, sz, 5);
      popMatrix();
    }
    i++;
  }
  theta += TWO_PI/frames;
  //if (frameCount%2==0 && frameCount<=frames) saveFrame("image-###.gif");
}

