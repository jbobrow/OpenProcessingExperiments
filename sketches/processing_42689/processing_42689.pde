
float x, y;

void setup() {
  background(255);
  size(600, 600);
  smooth();
}

void draw() {
  fill(209, 209, 209, 20);
  translate (mouseX, mouseY);
  strokeWeight( 3);
  arc(x+35, y, 20, 20, HALF_PI, PI+HALF_PI);
  arc(x-5, y, 20, 20, PI+HALF_PI, TWO_PI+HALF_PI );
  arc(x+50, y, 20, 20, PI+HALF_PI, TWO_PI+HALF_PI );
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      stroke(255, 0, 0);
    }
  } 
  else {
    stroke(0);
  }

  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      stroke(0, 166, 81);
    }
  } 
  else {
    stroke(0);
  }

  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      stroke(46, 49, 146);
    }
  } 
  else {
    stroke(0);
  }

  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      stroke(0, 174, 239);
    }
  } 
  else {
    stroke(0);
  }

  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      stroke(236, 0, 140);
    }
  } 
  else {
    stroke(0);
  }

  if (keyPressed) {
    if (key == 'y' || key == 'Y') {
      stroke(255, 242, 0);
    }
  } 
  else {
    stroke(0);
  }

  //BRUSH STROKE - 1,2,3


  if (keyPressed) {
    if (key == '1' || key == '1') {
      strokeWeight( 3);
      arc(x+35, y, 40, 40, HALF_PI, PI+HALF_PI);
      arc(x-5, y, 40, 40, PI+HALF_PI, TWO_PI+HALF_PI );
      arc(x+50, y, 40, 40, PI+HALF_PI, TWO_PI+HALF_PI );
      strokeWeight( 5);
      arc(x+35, y, 60, 60, HALF_PI, PI+HALF_PI);
      arc(x-5, y, 60, 60, PI+HALF_PI, TWO_PI+HALF_PI );
      arc(x+50, y, 60, 60, PI+HALF_PI, TWO_PI+HALF_PI );
    }
  }
  
  
    if (keyPressed) {
    if (key == '2' || key == '2') {
      strokeWeight( 3);
      arc(x+35, y, 60, 60, HALF_PI, PI+HALF_PI);
      arc(x-5, y, 60, 60, PI+HALF_PI, TWO_PI+HALF_PI );
      arc(x+50, y, 60, 60, PI+HALF_PI, TWO_PI+HALF_PI );
      strokeWeight( 5);
      arc(x+35, y, 80, 80, HALF_PI, PI+HALF_PI);
      arc(x-5, y, 80, 80, PI+HALF_PI, TWO_PI+HALF_PI );
      arc(x+50, y, 80, 80, PI+HALF_PI, TWO_PI+HALF_PI );
    }
  }
  
      if (keyPressed) {
    if (key == '3' || key == '3') {
      strokeWeight( 3);
      arc(x+35, y, 80, 80, HALF_PI, PI+HALF_PI);
      arc(x-5, y, 80, 80, PI+HALF_PI, TWO_PI+HALF_PI );
      arc(x+50, y, 80, 80, PI+HALF_PI, TWO_PI+HALF_PI );
      strokeWeight( 5);
      arc(x+35, y, 100, 100, HALF_PI, PI+HALF_PI);
      arc(x-5, y, 100, 100, PI+HALF_PI, TWO_PI+HALF_PI );
      arc(x+50, y, 100, 100, PI+HALF_PI, TWO_PI+HALF_PI );
    }
  }
  
  
  
  
    strokeWeight( 5);
    arc(x+35, y, 40, 40, HALF_PI, PI+HALF_PI);
    arc(x-5, y, 40, 40, PI+HALF_PI, TWO_PI+HALF_PI );
    arc(x+50, y, 40, 40, PI+HALF_PI, TWO_PI+HALF_PI );
    x= x + random(5)-random(5);
    y= y + random(5)-random(5);
  }

  /*void mouseClicked() {
    background(255);
    x= random(200);
    y = random(200);
  }

  void mousePressed()
  {
    saveFrame("scaling-##.tif");
  }
  */


