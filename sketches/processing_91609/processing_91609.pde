
// Parameterized Form/ Objects _week07 _ID03
scissors[] scissorsRow = new scissors [20];

void setup () {
  size (850, 850);
  smooth ();
  noLoop ();
  noStroke ();

  //DIGITALIZE 
  for (int i=0; i< scissorsRow.length ; i++) {
   // for (int j=10; j< width ; j++) {
     // for (int h=10; h< height ; h++) {
        scissorsRow[i] = new scissors ();
      }
    
}

void draw () {
  background (54);

  //CALL FUNCTIONALITY
  for (int i=0; i< scissorsRow.length ; i+=50){
    scissorsRow[i].display();
    println("test");
  }
}

void mousePressed () {
  redraw ();
}

class scissors {
  // GLOBAL VARIABLES
  float x;
  float y;
  float middle;
  float thickness;
  float length;
  float slant;
  float scalar;
  float circle;

  //CONSTRUCTOR
  scissors() {
    middle = random (5, 10);
    thickness = random (20, 39);
    length = random (40, 90);
    slant = random (5, 25);
    scalar = random (0.5, 1.0);
    circle = random (20, 30);
  }

  //---------------------------------FUNCTION---------------------------------
  void display () {   

    for (int x=0; x<width+50 ; x+=100) { 
     for    (int y=0; y<height+50 ; y+=100){
      //scissors shape
      fill (random (255), random (255), 255);    
      quad (x-thickness-5, y-length, x-thickness, y-length, x+thickness+5, y+length, x+thickness-5, y+length);
      quad (x+thickness-5, y-length, x+thickness, y-length, x-thickness+5, y+length, x-thickness-5, y+length);
      ellipseMode (CENTER);
      ellipse (x-thickness-8, y+length, circle+5, 35);            //left hole
      ellipse (x+thickness+8, y+length, circle+5, 35);            //right hole
      fill (54);
      ellipse (x+thickness+8, y+length, 20, circle);
      ellipse (x-thickness-8, y+length, 20, circle);
      fill (133, 133, 133);
      ellipse (x-1, y, 8, 9);
    }
    }
  }
}



