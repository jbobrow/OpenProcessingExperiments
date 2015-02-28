

void setup() {
  size( 600, 600);
  smooth();
}

void draw() {
  background(255);
  noStroke();



  // RECTANGLE
  if ((mouseX > 100) && (mouseX < 200) && (mouseY > 100) && (mouseY < 200)) {
    colorMode(HSB);
    for (int i = 0; i<100; i ++) {

      stroke(i*2.2, 255, 255);

      line(i+100, 100, i+100, 200);
    }
  }
  else {
    fill(#65D433);
    rect(100, 100, 100, 100);
  }





  if ( ( mouseX > 350 ) && ( mouseX < 550 )) {

    fill(#65D433);
    arc(450, 300, 200, 200, 0, HALF_PI);
    fill(#FF066C);
    arc(450, 300, 180, 180, HALF_PI, PI);
    fill(#63D4FC);
    arc(450, 300, 240, 240, PI, TWO_PI - HALF_PI);

    fill(#99FF08);
    arc(450, 300, 220, 220, TWO_PI - HALF_PI, TWO_PI);
  }
  else {
   
    noStroke();
    fill(#00A4FF);
    ellipse(450, 300, 200, 200);
  }
}



