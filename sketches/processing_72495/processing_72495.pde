
float growingDiameter = 0;
float growingColor = 0;
float growingWeight = 1;

boolean boolPress= false;
boolean boolClick= false;
boolean boolColor= true;


float secondDiameter= 0;

void setup() {
  size(1200, 600);
  background(200, 255, 200);
}

void draw () {
  smooth();

  //LINES FROM CENTER
  if (growingWeight<50) {
    growingWeight++;
  }
  else {
    growingWeight=0;
  }

  strokeWeight (growingWeight/20);
  line(width/2, height/2, mouseX-100, mouseY+50);


  fill(255, 0, 100);

  //BLINKING EYE
  strokeWeight(1);
  if (boolPress) {

    if (growingDiameter<1000) {
      growingDiameter= growingDiameter+15;
    }
    else {
      growingDiameter=0;
    }
    if (boolColor) {
      if (growingColor<255) {
        growingColor++;
      }
      else {
        growingColor= 0;
      }
    }


    fill(growingColor, 0, 90);
    ellipse(mouseX, mouseY, width+growingDiameter/10, growingDiameter);
    fill(150, 255, growingColor*3);
    ellipse(mouseX, mouseY, width, growingDiameter/2);
  }


  //CIRCLES SURROUNDING MOUSE

  if (boolClick) {

    if (secondDiameter<100) {
      secondDiameter= secondDiameter+5;
    }
    else {
      secondDiameter=0;
    }
    strokeWeight(5);
    noFill();
    ellipse(mouseX-150, mouseY+50, secondDiameter, secondDiameter);
  }
}

void mouseClicked () {
  if (boolClick== false) {
    boolClick= true;
  }
  else boolClick= false;
}


void mousePressed () {
  if (boolPress== false) {
    boolPress= true;
  }
}

void mouseReleased() {
  boolPress=false;
}

void keyPressed() {
  if (key=='b') {
    if (boolColor==true) {
      boolColor=false;
    }
  }

  if (key=='s') {
    save("rachelAsbel.png");
  }
}
