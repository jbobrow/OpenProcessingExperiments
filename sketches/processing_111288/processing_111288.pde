
void setup () {

  size (600, 600);
  background (40, 236, 200);
  smooth();
}

void draw () {




  //horizontal repetition

  for (int x = 30; x<width; x +=4) {

    for (int y = 20; y<height; y+=2) {
      fill (random(255), random(255), 210);
      stroke(random(255), random(255), 200);
      strokeWeight(17);
      point (y-20, x-30);
      point(x-3, y-5);
      {

        //PINK OVERLAY

        //for (int i=10; i<width;y+=30) {
          stroke(2);


          //fill(250, 167, 207, 10);

          //rect(200, 100, 10, 10);
        }
      }
    }
  }




