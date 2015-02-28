
PImage pencil;
PImage park;
PImage school;

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(5);
  park = loadImage("parkbackground.jpeg");
  school = loadImage("school.jpeg");
  pencil = loadImage("pencilsprite.png");
  cursor(pencil, mouseX, mouseY);

}

void draw() {
  if (mousePressed == true) {
    //strokeWeight(5);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  if (keyPressed == true) {
    if (key == 'q') {
      strokeWeight(5);
    }
    else if (key == 'w') {
      strokeWeight(20);
    }else if(key == 'e') {
      strokeWeight(30);
    }else if (key == '1') {
      stroke(255, 0, 0);
    }
    else if (key == '2') {
      stroke(247, 79, 0);
    }
    else if (key == '3') {
      stroke(255, 204, 0);
    }
    else if (key == '4') {
      stroke(0, 255, 0);
    }
    else if (key == '5') {
      stroke(0, 0, 255);
    }
    else if (key == '6') {
      stroke(66, 49, 128);
    }
    else if (key == '7') {
      stroke(102, 51, 0);
    }
    else if (key == '8') {
      stroke(0);
    }
    else if (key == '9') {
      stroke(255);
    }
    else if (key == 'a') {
      background(0);
    }
    else if (key == 's') {
      background(park);
    }
    else if (key == 'd') {
      background(school);
    }
    else if (key == 'r') {
      background(255);
    }
  }
}


