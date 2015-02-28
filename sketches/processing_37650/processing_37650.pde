
void setup() {
  size (800, 800);
}

  void draw() {
    background (255);

int nLines=20;

      for (int h=0; h< 1000; h=h+65) {
      for (int b=1; b< 1000; b=b+3) {


        ant (h, b*20);
      }
    }
  }

  void ant (int x, int y) {

   
    noStroke ();
    smooth ();
    noLoop ();
    
    int redness = (int)(random(255));
    
    fill(redness, 0, 0);

    //body
    ellipse (x, y, 15, 11);
    ellipse (x+13, y+5, 20, 10);
    ellipse (x+30, y+5, 25, 12);


    //antennae

    stroke (0);
    strokeWeight (1);
    line (x-14, y-11, x-1, y-2);
    line (x-2, y-5, x+2, y-16);

    //left leg
    line ( x+7, y+5, x, y+9);
    line (x, y+9, x, y+14);

    //right leg 1

    line (x+7, y+8, x+15, y+14);
    line (x+15, y+14, x+15, y+20);

    //right leg 2

    line (x+15, y+8, x+26, y+14);
    line (x+26, y+14, x+26, y+20);

    //right leg 3

    line (x+28, y+8, x+38, y+14);
    line (x+38, y+14, x+38, y+20);
  }
                
                
