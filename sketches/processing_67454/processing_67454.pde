
boolean brush1 = false;
boolean brush4 = false;
//PImage brush1mouse;

void setup() {
  size(500, 500);
  background(230);
  fill(250);
  ellipseMode(CORNER);
  

  //  PImage brush1mouse = loadImage("brush1.png");

  rect(30, 30, 30, 30);
  rect(30, 64, 30, 30);
  rect(30, 98, 30, 30);
  rect(30, 132, 30, 30);
  /*
  rect(30, 230, 30, 30);
   rect(30, 264, 30, 30);
   rect(30, 298, 30, 30);
   rect(30, 332, 30, 30);*/

  smooth();
  colorMode(RGB, 256);

  //BRUSH1
  fill(200, 10, 30, 200);
  noStroke();
  ellipse(32, 32, 27, 27);



  //BRUSH2
  fill(250, 150, 0, 200);
  triangle(45, 66, 32, 92, 58, 92);

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
  stroke(1);
  for (int i=0; i<200; i+=30) {
    for (int j=0; j<200; j+=30) {
      rect(j+200, i+160, 30, 30);
    }
  }
}



void draw() {
}

void mouseClicked() {

  //BRUSH 1 ellipse
  if (brush1 == false && mouseX > 30 && mouseX < 60 && mouseY > 30 && mouseY < 60) {
    println("choose brush 1!!!");
    brush1 = true;
  } 
  else {
    brush1 = false;
  }

  if (mouseX > 200 && mouseX < 230 && mouseY > 160 && mouseY < 190) {
    fill(200, 10, 30, 200);
    noStroke();  

    ellipse(202, 162, 26, 26);
  }

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

  /*//BRUSH 2 triangle

  if (brush2 == false && mouseX > 30 && mouseX < 60 && mouseY > 30 && mouseY < 60) {
    println("choose brush 1!!!");
    brush2 = true;
  } 
  else {
    brush2 = false;
  }

  if (mouseX > 200 && mouseX < 230 && mouseY > 160 && mouseY < 190) {

    fill(250, 150, 0, 200);
    triangle(45, 66, 32, 92, 58, 92);
    }

    for (int i=0; i<200; i+=30) {
      for (int j=0; j<200; j+=30) {
        if (mouseX > j+202 && mouseX < j+232) {
          if (mouseY > i+162 && mouseY < i+192) {

            fill(250, 150, 0, 200);
            noStroke();
            triangle(j+45, j+66, i+32, i+92, i+58, i+92);
            }
          }
        }
      }
      */

    //BRUSH 3 //
   /*
    if (brush1 == false && mouseX > 30 && mouseX < 60 && mouseY > 30 && mouseY < 60) {
      println("choose brush 1!!!");
      brush1 = true;
    } 
    else {
      brush1 = false;
    }

    if (mouseX > 200 && mouseX < 230 && mouseY > 160 && mouseY < 190) {
      fill(200, 10, 30, 200);
      noStroke();  

      ellipse(202, 162, 26, 26);
    }

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
 */


    //BRUSH 4 rect

    if (brush4 == false && mouseX > 30 && mouseX < 60 && mouseY > 30 && mouseY < 60) {
      println("choose brush 2!!!");
      brush4 = true;
    } 
    else {
      brush4 = false;
    }

    if (mouseX > 200 && mouseX < 230 && mouseY > 160 && mouseY < 190) {
      fill(40, 160, 230, 200);
      rect(202, 162, 27, 27);
    }

    for (int i=0; i<200; i+=30) {
      for (int j=0; j<200; j+=30) {
        if (mouseX > j+202 && mouseX < j+232) {
          if (mouseY > i+162 && mouseY < i+192) {
            fill(40, 160, 20, 200);
            noStroke(); 
            rect(j+202, i+162, 27, 27);
          }
        }
      }
    }



    ///END OF MOUSE CLICKED FUNCTION
  }
  
  

