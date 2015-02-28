
void setup() {
  size(200, 400);
  colorMode(RGB, width);
  rectMode(CORNERS);
  background(80);
  //ground plane
  noStroke();
  fill(120);
  rect(0, height*.9, width, height);
  fill(100);
  rect(0, height*.9, width, height*.91);

  //scale figure
  fill(0);
  ellipse(width*.1, height*.86, 2, 3);
  ellipse(width*.1, height*.88, 3, 7);
  strokeWeight(1);
  stroke(0);
  line(width*.1, height*.89, width*.09, height*.90);
  line(width*.1, height*.89, width*.11, height*.90);

  //building form,variable boundaries
  fill(0);
  rect(width*.2, height*.25, width, height*.9);
  rect(width*.18, height*.85, width, height*.9);
}

float count=width*.22;
float num=25;


void draw() {

  rectMode(CENTER);
  //windows,variable
  if (count%2==0) {

    //set 1
    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*15)), (num*4.5), 3, 6);
    }

    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*25)), (num*5), 3, 12);
    }
  }

  if (count%4==0) {

    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*15)), (num*6), 3, 12);
    }
    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*25)), (num*7), 3, 6);
    }

    //set 2
    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*15)), (num*8), 3, 6);
    }

    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*25)), (num*9), 3, 18);
    }
  }

  if (count%4==0) {

    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*15)), (num*10), 3, 12);
    }
    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*25)), (num*11), 3, 6);
    }

    //set 3
    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*15)), (num*12), 3, 6);
    }

    if (count<=width*.22) {
      fill(180, 200, 0);
      rect(width*.22+(random(count*25)), (num*13), 3, 12);
    }
  }



  count++;
}


