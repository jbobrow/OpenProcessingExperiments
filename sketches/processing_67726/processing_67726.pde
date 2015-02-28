

//INITIAL SETTINGS

float ranX, ranY;

Boolean drawCirc;

void setup() {

  size(400,300);

  smooth();

  background(0);

  stroke(153);

  fill(0);

  drawCirc = false;

}

//REPEAT INSTRUCTIONS

void draw() {

  if(drawCirc==true) {

    ranX=random(10,width-10);

    ranY=random(10, height-10);

    fill (255);
    ellipse(ranX, ranY, 20, 20);

  }

}

void mousePressed() {
  drawCirc=true;
}


