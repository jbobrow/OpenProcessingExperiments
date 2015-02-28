
void setup () {

  size (600, 600);
  background (40, 236, 200);
  //smooth();
}

void draw () {




  //horizontal repetition

  for (int x = 0; x<height; x +=1.5) {

    for (int y = 0; y<height; y+=7) {



      //fill (random(40), random(255), 10);
      fill (216, 248, 81, 20);

      stroke(random(255), random(255), 160);

      strokeWeight(random(40));
      point (x-1, x+15);
      point(y-1, x);


      //PINK OVERLAY

      //for (int i=10; i<width;y+=30) {
      stroke(2);


      //fill(250, 167, 207, 10);

      //rect(200, 100, 10, 10);
    }
  }
}



