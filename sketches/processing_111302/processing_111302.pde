
void setup () {

  size (600, 600);
  background (55, 36, 78);
  smooth();
}

void draw () {




  //horizontal repetition

  for (int x = 0; x<width; x +=1) {

    for (int y = 0; y<height; y+=7) {
      fill (random(255), random(255), 150);
      stroke(random(255), random(255), 200);
      strokeWeight(0.1);
      rect (y-30, x,0.1,7);
      rect(y-30,x, 600,1,2);
      {


        }
      }
    }
  }




