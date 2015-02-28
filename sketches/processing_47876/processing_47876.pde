
class CircleEnemy extends Enemy {

  float rLength, rWidth;
  float fromTriTopLeft, fromTriTopRight, fromTriBottomLeft, fromTriBottomRight, triSide;
  boolean collide;
  PImage img3;
  int r;


  CircleEnemy(float x, float y, float rWidth, float rLength) {
    super(x, y);
    this.rWidth = rWidth;
    this.rLength = rLength;
    img3 = loadImage("blueGuitarSmall.png");
    r = int(random(0, 2));
  }

  void update() {
    super.update();
    if (r == 0) {
      goPos.x += noise(goPos.y);
    }
    else {
      goPos.x += -(noise(goPos.y));
    }
  }

  void display() {
    super.display();
    image(img3, goPos.x, goPos.y, rWidth, rLength); 
  }

  boolean contact(Shot shot) {
    return 
      (goPos.x < shot.goPos.x && goPos.x + rWidth > shot.goPos.x)
      &&
        (goPos.y < shot.goPos.y && goPos.y + rLength > shot.goPos.y);
  }

  boolean collide(Player player) {
    if ((player.goPos.x < goPos.x) && (goPos.x < player.goPos.x + rWidth) &&
      (player.goPos.y < goPos.y) && (goPos.y < player.goPos.y + rLength)) {
      collide = true;
    }
    else if ((player.goPos.x < goPos.x + rWidth) && (goPos.x + rWidth < player.goPos.x + rWidth) &&
      (player.goPos.y < goPos.y + rLength) && (goPos.y + rLength < player.goPos.y + rLength)) {
      collide = true;
    }
    else {
      collide = false;
    }

    return collide;
  }
}

