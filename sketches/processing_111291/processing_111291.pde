
void setup () {

  size (600, 600);
  background (20, 43, 75);
  smooth();
}

void draw () {




  //horizontal repetition

  for (int x = 0; x<width; x +=10) {

    for (int y = 0;  y<height; y+=100) {
      //fill (random(4), random(25), 210);
      //stroke(100, random(-10, 179), random(124));
      //strokeWeight(random(10));
      line (0, 0, 700, 0);
      strokeWeight(10);
      //line(x, y, x, y);

      strokeWeight(random(0.05));
      //color(253,179,178);
      stroke(random(240, 253), 179, random(150, 178));
      line(random(700), random(700), 0, random(700));
      {
      }
    }
  }
}



