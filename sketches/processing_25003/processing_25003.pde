
void setup() {
  size (300,400);
  background(128);
  smooth();

  fill(75,196,76);
  ellipse(150,240,140,160); //body

  fill(228,250,177);
  ellipse(150,290,92,65);
  arc(150,290,90,110,radians(168),radians(372));//belly

  fill(75,196,76);
  ellipse(150,150, 200,130); //head

  noStroke();
  ellipse(100,100,80,70); //behind left eye
  ellipse(200,100,80,70); //behind right eye

  stroke(1);
  arc(100,100, 80,70,radians(150),radians(335)); //left eye socket
  arc(200,100, 80,70,radians(205),radians(390)); //right eye socket

  fill(208,240,34);
  ellipse(100,100,55,50);//eye
  ellipse(200,100,55,50);

  fill(0);
  ellipse(100,100,40,35);//iris
  ellipse(200,100,40,35);

  fill(255);
  ellipse(107,91,13,13);//pupil
  ellipse(193,91,13,13);

  fill(87,142,88);
  ellipse(145,140,5,5);//nose
  ellipse(155,140,5,5);

  noFill();
  //fill(232,68,68);
  arc(150,160, 100,50, 0, PI); //mouth

  //line(123,245,125,260);
}

void draw() {

  if (mousePressed || keyPressed == true) {
    // noStroke();
    smooth();
    fill(232,68,68);
    arc(150,160, 100,50, 0, PI); //open mouth

    fill(255,255,255);
    noStroke();
    triangle(160,170, 200,183, 190, 192);
    ellipse(235,195, 100,50);
    stroke(1);
    line(160,170,185,190);
    line(160,170,195,180);
    arc(235,195, 100,50, radians(215),radians(550)); //speech bubble



    fill(0);
    textSize(14);
    text("kero!", 220, 200);
  }
}

void mouseReleased() {
  setup();
}

void keyReleased() {
  setup();
}



