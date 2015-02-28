
void setup() {
  size (300, 300);
}

void draw () {

  background (0);

  for (int x=20; x<180; x+=10) {//count<12 affects number of items,y+=16 affects spacing in between
    stroke (-2);// negative value gives white line
    fill (223, 247, 167, 50);//transparency set to create gradient tone with overlapping
    quad (150+x-150, 120+x-150, 180+x-90, 150+x, 150, 180, 120, 150);//+5 moves object off side for x, 
    //affecting y variable can create a sloping line, width/2 affects stopping point
    //warped axis allows to create an obtuse triangle that repeats on top of itself
  }


  for (int x=30;x<150;x+=25) {

    noFill();
    stroke (252, 3, 23);
    strokeWeight (0);
    rect (0+x, 0+x, 12+x, 12+x);
  }
}
//for this composition I decided to use a composition build on negative space.
//simple forms of overlapping triangles and squares in squares were used to create 
//a sense of implied movement in the heart of the composition


