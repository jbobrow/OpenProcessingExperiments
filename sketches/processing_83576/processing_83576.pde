
Character chara;

void setup() {
  size(200, 200);
  chara = new Character("chara.png", 48, 48);
}

void draw() {
  background(0);
  chara.update();
  chara.show();
}

void keyPressed() {
  if (key == CODED) {
    chara.move(keyCode);
  }
}

class Character {
  int w;
  int h;
  int dir;
  int x = 0;
  int y = 0;
  int moveUnit = 5;
  int frame = 0;
  int updateInterval = 10;
  PImage sourceImage;
  PImage currentImage;
  HashMap directionMap;
  HashMap moveValues;

  Character(String filename, int cWidth, int cHeight) {
    w = cWidth;
    h = cHeight;
    sourceImage = loadImage(filename);
    currentImage = new PImage(w, h, ARGB);
    getCurrentImage();
    setDirection();
    setMoveAction();
  }

  void show() {
    getCurrentImage();
    image(currentImage, x, y);
  }

  // 向きと座標を変更
  void move(int keyCode) {
    try {
      // int だとエラーになるので Integer でキャストする
      dir = (Integer)directionMap.get(keyCode);
      x += ((int[])moveValues.get(keyCode))[0];
      y += ((int[])moveValues.get(keyCode))[1];
    } catch(Exception e) {
  }
  }

  // アニメーション用にキャラクターのフレーム値をインクリメント
  void update() {
    if (frameCount % updateInterval == 0) {
      frame += 1;
      if (frame * w >= sourceImage.width) {
        frame = 0;
      }
    }
  }

  // 現在の状態に則した表示用画像を原画像から取得
  void getCurrentImage() {
    currentImage.copy(sourceImage, frame * w, dir * h, w, h,
                                           0,       0, w, h);
  }

  void setDirection() {
    directionMap = new HashMap();
    directionMap.put( DOWN, 0);
    directionMap.put( LEFT, 1);
    directionMap.put(RIGHT, 2);
    directionMap.put(   UP, 3);
  }

  void setMoveAction() {
    moveValues = new HashMap();
    moveValues.put( DOWN, new int[]{        0,  moveUnit});
    moveValues.put( LEFT, new int[]{-moveUnit,         0});
    moveValues.put(RIGHT, new int[]{ moveUnit,         0});
    moveValues.put(   UP, new int[]{        0, -moveUnit});
  }
}


