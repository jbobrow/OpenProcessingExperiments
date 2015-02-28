
void setup() {
  size(300, 300);
  background(255);
}

//interger for motion when mouse pressed
int x=1;

void draw() {

  //left side color
  noStroke();
  fill(0, 200, 60);
  rect(0, 0, 150, 300);
  //right side color
  fill(60, 0, 200);
  rect(150, 0, 150, 300);

  //dividing mouse for ellipse change
  if (mouseX < width/2) {  //left side ellipse
    fill(200, 200, 0);
    ellipse(mouseX, height/2, mouseX, mouseX); //follows mouse on X
  }
  else { //right side ellipse
    fill(200, 0, 150); //color change
    ellipse(mouseX, height/2, 300-mouseX, 300-mouseX); //follows mouse on X
  }
  //alternate action when mouse pressed
  if (mousePressed) {
    //left side and right background color change
    noStroke();
    fill(0, 200, 60);
    rect(150, 0, 150, 300);

    fill(60, 0, 200);
    rect(0, 0, 150, 300);
    //rectangle motion
    if (x < 75) { //left side
      fill(200, 200, 0);
      rect(x, height/2, x, x);
      x++;
    }
    else { //color and direction change
      if (x<225) { //right side
        fill(200, 0, 150);
        rect(x, height/2, 150-x, 150-x);
        x++;
      }
      else {  //right side motion and color change
        fill(200, 200, 0);
        rect(x, x-(x-1), 300-x, 300-x);
        x++;
      }
    }
    if (x>width) { //restart mouse pressed
      x=1;
    }
  }
}


