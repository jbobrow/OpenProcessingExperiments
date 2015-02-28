
void setup() {
  colorMode(HSB, 360, 100, 100);
  size (1200, 800);
  smooth();
}

void draw() {
  background (13, 255, 249);
  for (int tangle = 1200; tangle > 0; tangle = tangle - 20) {
    fill(tangle/11, 60, 100);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, tangle, (3*tangle)/4);
  }
  for (int linear = 3000; linear > 0; linear = linear - 20) {
    noFill();
    stroke(linear/10+60, 70, 100);
    rectMode(CENTER);
    rect(width/2, height/2, (3*linear)/4, linear);
  }
  for (int x = 0; x < 350; x = x + 10) {
    //noStroke();
    //fill(100+x/4, 60, 100);
    //stroke(100+x/3, 80, 100);
    //triangle(width/2, 10, width/2-30, 10, ((width/2)+x), (height/2-x));//toptop right
    //triangle(width/2, 10, width/2-30, 10, ((width/2)-x), (height/2-x));//toptop left
    fill(100+x/4, 100, 100);
    stroke(100+x/3, 50, 100);
    //triangle(width/2, height-10, width/2-30, height-10, ((width/2)+x), (height/2-x));//bottombottom right
    triangle(width/2-35, height, width/2-30, height+20, ((width/2)-x), (height/2-x));//bottombottom left
    triangle(width, height/2, width, (height/2 - 30), (-width+x), (height/2-x));//bottom rightright
    triangle(width+100, height/2, width+100, (height/2 - 30), ((width/2)+x), (height/2-x));//top rightright
    triangle(-50, height/2, 0, (height/2 - 30), ((width)+10), (height/2+x));//bottom leftleft
    triangle(-50, height/2, 0, (height/2 - 30), ((width/2)-x), (height/2-x));//top leftleft
  }
}
