
void setup () {

  size (600, 600);
  background (15, 61, 98);
  smooth();
}

void draw () {






  for (int x = 0; x<width; x +=20) {

    for (int y = 0;  y<height; y+=30) {
      //fill (random(4), random(25), 210);
      stroke(134, 197, 166);

      strokeWeight(random(1));
      line(700, 100, 700, 200);


      stroke(127, random(40), 0);

      strokeWeight(random(0.1));
      line(700, 0, 700, 0);
      //line(random(700), random(300), random(700), random(300));

      //stroke(random(100,198), random(40), 92);


      strokeWeight(random(0.01));
      //color(253, 179, 178);
      stroke(87, 30, random(20,50));
      line(700, random(700), 1, random(-700));

      strokeWeight(random(1));
      color(random(253), 179, random(178));
      stroke(random(50, 180), 77, 80);
      line(700, random(700), 0, random(700));

      {
      }
    }
  }
}




