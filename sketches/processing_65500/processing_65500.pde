
class Cube {
  int cubeNum;
  int startSize;
  int strokeColor;
  //  int r;
  //  int g;
  //  int b;



  Cube(int place, int startSize, int sColor) {
    this.cubeNum = place;
    this.startSize = startSize;
    this.strokeColor = sColor;
  }

  void createCube() {
    /*
    this.r = int(random(70, 255));
     this.g = int(random(70, 255));
     this.b = int(random(70, 255));
     */
    pushMatrix();
    translate(width/2, height/2, -(width/2));

    if ((cubeNum%2) != 0) {

      rotateX(map(mouseY, 0, height, -PI, PI));
      rotateY(map(mouseX, 0, width, -PI, PI));
      rotateZ(map(mouseX, mouseY, height, -PI, PI));
      //stroke(r, g, b);
      stroke(255 - strokeColor/cubeNum);
      box(startSize/(pow(2, cubeNum-1)));
    }

    else if ((cubeNum%2) == 0) {

      rotateX(map(mouseY, 0, height, -PI, PI));
      rotateY(map(mouseX, 0, width, -PI, PI));
      rotateZ(map(-mouseX, -mouseY, height, -PI, PI));
      //stroke(r, g, b);
      stroke(255 - strokeColor/cubeNum);
      box(startSize/(pow(2, cubeNum-1)));
    }
    popMatrix();
  }

  void update() {
    pushMatrix();
    translate(width/2, height/2, -(width/2));
    if ((cubeNum%2) != 0) {
      rotateX(map(mouseY, 0, height, -PI, PI));
      rotateY(map(mouseX, 0, width, -PI, PI));
      rotateZ(map(mouseX, mouseY, height, -PI, PI));
      //stroke(r, g, b);
      stroke(255 - strokeColor/cubeNum);
      box(startSize/(pow(2, cubeNum-1)));
    }

    else if ((cubeNum%2) == 0) {

      rotateX(map(mouseY, 0, height, -PI, PI));
      rotateY(map(mouseX, 0, width, -PI, PI));
      rotateZ(map(-mouseX, -mouseY, height, -PI, PI));
      //stroke(r, g, b);
      stroke(255 - strokeColor/cubeNum);
      box(startSize/(pow(2, cubeNum-1)));
    }
    popMatrix();
  }

  int getVolume () {
    int volume = int(pow(startSize/pow(2, cubeNum-1), 3));
    return(volume);
  }
}


