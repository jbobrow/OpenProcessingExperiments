
class Bacterium extends Sprite {
  
  float spreadMin = 5;
  float spread = spreadMin;
  float spreadMax = 50;
  float friction = 5;

  Bacterium(float pX, float pY) {
    super("bacterium.png",50,50, pX, pY); // filename, tilewidth, tileheight, x pos, y pos
    internalFps = 12;
    goTo("stop");
  }

  void goTo(String c) {
    command = c;
    if(command=="play"){
    setTiles(0,1,9,1);
    }
    if(command=="stop"){
    setTiles(0,9,9,9);
      }
  }

  void behaviors() {
    if(command=="play") {
      if(spread<spreadMax) {
        spread++;
      }
      x = tween(x,mouseX,friction);
      y = tween(y,mouseY,friction);
    }

    if(command=="stop") {
      spread=spreadMin;
    }
    x = shake(x,spread);
    y = shake(y,spread);
    x = boundary(x,0,width);
    y = boundary(y,0,height);
  }

  void update() {
    frameTileMotor(frameRate/internalFps);
    behaviors();
    display("NORMAL");
  }
}


