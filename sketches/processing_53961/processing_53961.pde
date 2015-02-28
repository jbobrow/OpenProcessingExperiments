


class HumptyDumpty {

  int w;
  int h;
  float x;
  float y;
  float spdX;
  float spdY;


  // Constructor 
  HumptyDumpty(float tempx, float tempy) {

    x=tempx;
    y=tempy;
  }

  //Display
  void display() {
    smooth();
    stroke (0);
    fill (220);
    ellipse (x, y-10, 95, 120); //egg body

    fill (255);
    ellipse (x-16, y-20, 20, 25);
    ellipse (x+15, y-20, 20, 25);//eyes

    arc (x+17, y-46, 12, 12, 5*PI/4, 2*PI);
    arc (x-18, y-46, 12, 12, PI, 7*PI/4); //eyebrows

    fill (0);
    ellipse (x-16, y-20, 10, 10);
    ellipse (x+15, y-20, 10, 10); //pupils

    smooth();
    noFill();
    arc (x-1, y, 40, 40, PI/6, 5*PI/6); //smile

    smooth();
    fill(250, 50, 180);
    ellipse (x, y, 10, 5); //nose

    smooth();
    stroke (0); 
    strokeWeight (3);
    line (x+46, y+10, x+65, y+50); 
    line (x-45, y+10, x-65, y+50);//arms

    strokeWeight (3);
    line (x-10, y+50, x-40, y+90);
    line (x+15, y+49, x+40, y+90); //legs


    fill (25, 25, 0);
    noStroke();
    strokeWeight (1);
    ellipse (x+45, y+90, 30, 10);
    ellipse (x-45, y+90, 30, 10);// dark green shoes

    smooth();
    fill (150, 0, 0);
    ellipse (x, y+50, 20, 15);
    fill (255, 0, 0);
    strokeWeight (2);
    triangle (x+8, y+50, x+45, y+30, x+45, y+60);

    triangle (x-6, y+50, x-37, y+30, x-37, y+60); //red bow
  }


  void move() {
    y += 1;
  }
  
}


