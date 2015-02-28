
class Grass {
  color grassC;
  float blCorner;
  float grassWidth;
  float grassHeight;
  float yspeed;
  float grassBase;

  Grass(float tempXpos, float tempYspeed) {
    grassC = color (23, 48, 23, 150);
    blCorner = tempXpos; //bottom left corner has a random positon
    grassWidth = 4;
    grassHeight = (0+(grassWidth/2))+height;
    yspeed = tempYspeed;
    grassBase = height;
  }

  void display() {
    fill(grassC);
    strokeWeight(1);
    stroke(102, 175, 36);
    triangle(blCorner, grassBase, blCorner+(grassWidth/2), grassHeight, blCorner+grassWidth, grassBase);  
    //grassHeight=constrain(grassHeight, 400, 600);
  }

  void grow() {
    grassHeight += yspeed;
    if (grassHeight < (height-150)) {
      yspeed /= .25;
    }
  }
}


