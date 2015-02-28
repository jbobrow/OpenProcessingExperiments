
boolean brush1 = false;
boolean brush2 = false;
boolean brush3 = false;
boolean brush4 = false;


void setup() {
  size(500, 500);
  background(random(width/2), random(height/2), random(230));
  noStroke();
  fill(250);
  ellipseMode(CORNER);


  rect(30, 30, 30, 30);
  rect(30, 64, 30, 30);
  rect(30, 98, 30, 30);
  rect(30, 132, 30, 30);


  smooth();
  colorMode(RGB, 256);

  //BRUSH1
  fill(200, 10, 30, 200);
  noStroke();
  ellipse(32, 32, 26, 26);


  //BRUSH2
  fill(250, 150, 0, 200);
  ellipse(32, 66, 26, 26);

  //BRUSH3
  fill(0, 150, 80, 200);
  beginShape();
  vertex(32, 102);
  vertex(32, 107);
  vertex(58, 130);
  vertex(58, 125);
  endShape(CLOSE);

  //BRUSH4
  fill(40, 160, 230, 200);
  rect(32, 134, 27, 27);

  //pixel grid

  fill(255);
  rect(width, height, 0, 0);
  stroke(random(width/2), random(height/2), random(230), 100);
  for (int i=0; i<200; i+=30) {
    for (int j=0; j<200; j+=30) {
      rect(j+200, i+160, 30, 30);
    }
  }
}



void draw() {

  /// draw brush1
  if (brush1 == true) {
    for (int i=0; i<200; i+=30) {
      for (int j=0; j<200; j+=30) {
        if (mouseX > j+202 && mouseX < j+232) {
          if (mouseY > i+162 && mouseY < i+192) {
            fill(200, 10, 30, 200);
            noStroke();
            ellipse(j+202, i+162, 26, 26);
          }
        }
      }
    }
  }


  /// draw brush2
  if (brush2 == true) {
    for (int i=0; i<200; i+=30) {
      for (int j=0; j<200; j+=30) {
        if (mouseX > j+202 && mouseX < j+232) {
          if (mouseY > i+162 && mouseY < i+192) {
            fill(250, 150, 0, 200);
            noStroke();
            ellipse(j+202, i+162, 26, 26);
          }
        }
      }
    }
  }
  
  

  /// draw brush4

  if (brush4 == true) {
    for (int i=0; i<200; i+=30) {
      for (int j=0; j<200; j+=30) {
        if (mouseX > j+202 && mouseX < j+232) {
          if (mouseY > i+162 && mouseY < i+192) {
            fill(40, 160, 230, 200);
            noStroke();
            rect(j+202, i+162, 26, 26);
          }
        }
      }
    }
  }
}

///END OF MOUSE CLICKED FUNCTION

void mouseClicked() {

  //BRUSH 1 ellipse
  if (brush1 == false && mouseX > 30 && mouseX < 60 && mouseY > 30 && mouseY < 60) {
    println("choose brush 1!!!");
    brush1 = true;
  }
  else {
    brush1 = false;
  }


  //BRUSH 2 ellipse 2
  if (brush2 == false && mouseX > 30 && mouseX < 60 && mouseY > 64 && mouseY < 94) {
    println("choose brush 2!!!");
    brush2 = true;
  }
  else {
    brush2 = false;
  }

  //BRUSH 3 //
  if (brush3 == false && mouseX > 30 && mouseX < 60 && mouseY > 64 && mouseY < 94) {
    println("choose brush 3!!!");
    brush3 = true;
  }
  else {
    brush3 = false;
  }



  //BRUSH 4 rect

  if (brush4 == false && mouseX > 30 && mouseX < 60 && mouseY > 132 && mouseY < 162) {
    println("choose brush 4!!!");
    brush4 = true;
  }
  else {
    brush4 = false;
  }
}

void keyPressed() {
  if (key =='s') {
    saveFrame("pixel-#.jpg");
  }
}

