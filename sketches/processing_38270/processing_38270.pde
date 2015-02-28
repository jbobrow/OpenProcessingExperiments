
void setup() {
  size(500, 500);
  background(255);
}


int numOfTries = 1;
float rectPlace;


void draw() {

  if (numOfTries > 0) {

    rectPlace = random(width);
    //yellow square
    fill(255, 255, 0);
    noStroke();
    rect(rectPlace, rectPlace, 200, 200);
    //bounding lines
    stroke(0, 0, 0);
    strokeWeight(5);
    //horizontal bounding lines for yellow square
    line(rectPlace, rectPlace, width, rectPlace);
    line(-width, rectPlace, rectPlace, rectPlace);
    line(rectPlace+200, rectPlace+200, width, rectPlace+200);
    line(-width, rectPlace+200, rectPlace+200, rectPlace+200);
    //vertical bounding lines for yellow square
    line(rectPlace, height, rectPlace, rectPlace);
    line(rectPlace, rectPlace, rectPlace, -height);
    line(rectPlace+200, height, rectPlace+200, rectPlace+200);
    line(rectPlace+200, rectPlace+200, rectPlace+200, -height);

    rectPlace = random(height);
    //blue rectangle
    fill(0, 0, 255);
    noStroke();
    rect(rectPlace, rectPlace, 200, 50);
    //bounding lines
    stroke(0, 0, 0);
    strokeWeight(3);
    //horizontal bounding lines for blue rectangle
    line(rectPlace, rectPlace, width, rectPlace);
    line(-width, rectPlace, rectPlace, rectPlace);
    line(rectPlace+200, rectPlace+50, width, rectPlace+50);
    line(-width, rectPlace+50, rectPlace+200, rectPlace+50);
    //vertical bounding lines for blue rectangle
    line(rectPlace, height, rectPlace, rectPlace);
    line(rectPlace, rectPlace, rectPlace, -height);
    line(rectPlace+200, height, rectPlace+200, rectPlace+50);
    line(rectPlace+200, rectPlace+50, rectPlace+200, -height);

    rectPlace = random(width);
    //red rectangle
    fill(255, 0, 0);
    noStroke();
    rect(rectPlace, rectPlace, 50, 100);
    //bounding lines
    stroke(0, 0, 0);
    strokeWeight(2);
    //horizontal bounding lines for red rectangle
    line(rectPlace, rectPlace, width, rectPlace);
    line(-width, rectPlace, rectPlace, rectPlace);
    line(rectPlace+50, rectPlace+100, width, rectPlace+100);
    line(-width, rectPlace+100, rectPlace+50, rectPlace+100);
    //vertical bounding lines for red rectangle
    line(rectPlace, height, rectPlace, rectPlace);
    line(rectPlace, rectPlace, rectPlace, -height);
    line(rectPlace+50, height, rectPlace+50, rectPlace+100);
    line(rectPlace+50, rectPlace+100, rectPlace+50, -height);
  }

  numOfTries--;
}




