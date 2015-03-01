
class Cube {
  float centerX, centerY, centerZ, side;
  int cubeNum, faceNum, shadeA, shadeB;
  Face[] faces = new Face[6];
  Cube(float centerX, float centerY, float centerZ, float side, int cubeNum) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.centerZ = centerZ;
    this.side = side;
    this.cubeNum = cubeNum;
    switch (cubeNum) {
    case 0:
      shadeA = 2;
      shadeB = -1;
      break;
    case 1:
      shadeA = 0;
      shadeB = 2;
      break;
    case 2:
      shadeA = 2;
      shadeB = 5;
      break;
    case 3:
      shadeA = -1;
      shadeB = -1;
      break;
    case 4:
      shadeA = -1;
      shadeB = -1;
      break;
    case 5:
      shadeA = 5;
      shadeB = -1;
      break;
    case 6:
      shadeA = 5;
      shadeB = -1;
    }
    for (int i = 0; i < faces.length; i++) {
      faces[i] = new Face(centerX, centerY, centerZ, side, cubeNum, i, shadeA, shadeB);
    }
  }
  void update() {
    for (int i = 0; i < faces.length; i++) {
      faces[i].update();
    }
  }
}

