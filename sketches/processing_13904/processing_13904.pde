
void setup (){
  
  size (200, 200);
  background (#C6E2FF);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  
//background change
    if (mousePressed) {
      background (#FF5656);
    } else {
      background (#C6E2FF);
    }


//eyes
    fill (#141414);
    ellipse (100, 75, 50,70);

    fill (#FFFFFF);
    ellipse (90, 80, 20, 70);
    ellipse (110, 80, 20, 70);


    fill (#9932CC);
    ellipse (90, 80, 10, 30);
    ellipse (110, 80, 10, 30);


//Schnauze
    fill (#FDF5E6);
    ellipse (width/2,height/2, 80, 50);
  
  
//nose
    fill (#141414);
    ellipse (width/2, 90, 30, 10);

//mouth
    line (115, 115, 80, 100);


//ears
    ellipse (55, 40, 60, 60);
    ellipse (145, 40, 60, 60);


//mouth moving
    if (mousePressed) {
      line (115, 115, 80, 100);
    } else {
      fill (255);
    triangle ( 115, 115, 80, 105, 80, 100);
    }
  
  

}

